///| LSP Client - Platform-independent interface

///| Client configuration
pub(all) struct ClientConfig {
  root_uri : String
  process_id : Int
}

///| Pending request callback
struct ResponseHandler {
  handler : (@jsonrpc.Response) -> Unit
}

///| Notification callback
struct NotificationHandler {
  handler : (@json.JsonValue?) -> Unit
}

///| Client instance that handles LSP communication
pub struct Client {
  config : ClientConfig
  decoder : @jsonrpc.Decoder
  mut next_id : Int
  pending : Map[Int, ResponseHandler]
  notification_handlers : Map[String, NotificationHandler]
  mut initialized : Bool
}

///|
pub fn Client::new(config : ClientConfig) -> Client {
  Client::{
    config,
    decoder: @jsonrpc.Decoder::new(),
    next_id: 1,
    pending: Map::new(),
    notification_handlers: Map::new(),
    initialized: false,
  }
}

///| Get next request ID
fn Client::get_next_id(self : Client) -> Int {
  let id = self.next_id
  self.next_id = self.next_id + 1
  id
}

///| Register a notification handler
pub fn Client::on_notification(
  self : Client,
  name : String,
  handler : (@json.JsonValue?) -> Unit
) -> Unit {
  self.notification_handlers.set(name, NotificationHandler::{ handler, })
}

///| Build capabilities object
fn build_capabilities() -> @json.JsonValue {
  let publish_diag : Map[String, @json.JsonValue] = {}
  publish_diag.set("relatedInformation", @json.JsonValue::Bool(true))

  let sync : Map[String, @json.JsonValue] = {}
  sync.set("dynamicRegistration", @json.JsonValue::Bool(false))
  sync.set("willSave", @json.JsonValue::Bool(false))
  sync.set("willSaveWaitUntil", @json.JsonValue::Bool(false))
  sync.set("didSave", @json.JsonValue::Bool(true))

  let text_doc : Map[String, @json.JsonValue] = {}
  text_doc.set("publishDiagnostics", @json.JsonValue::Object(publish_diag))
  text_doc.set("synchronization", @json.JsonValue::Object(sync))

  let caps : Map[String, @json.JsonValue] = {}
  caps.set("textDocument", @json.JsonValue::Object(text_doc))
  @json.JsonValue::Object(caps)
}

///| Create initialize request
pub fn Client::create_initialize_request(self : Client) -> (Int, String) {
  let id = self.get_next_id()
  let params : Map[String, @json.JsonValue] = {}
  params.set("processId", @json.JsonValue::Number(self.config.process_id.to_double()))
  params.set("rootUri", @json.JsonValue::String(self.config.root_uri))
  params.set("capabilities", build_capabilities())

  let request = @jsonrpc.Request::new(
    "initialize",
    params=Some(@json.JsonValue::Object(params)),
    id=Some(@jsonrpc.RequestId::Number(id)),
  )
  let encoded = @jsonrpc.encode_request(request)
  (id, encoded)
}

///| Create initialized notification
pub fn Client::create_initialized_notification(_self : Client) -> String {
  let params : Map[String, @json.JsonValue] = {}
  let request = @jsonrpc.Request::new("initialized", params=Some(@json.JsonValue::Object(params)))
  @jsonrpc.encode_request(request)
}

///| Create textDocument/didOpen notification
pub fn Client::create_did_open_notification(
  _self : Client,
  uri : String,
  language_id : String,
  version : Int,
  text : String
) -> String {
  let text_document : Map[String, @json.JsonValue] = {}
  text_document.set("uri", @json.JsonValue::String(uri))
  text_document.set("languageId", @json.JsonValue::String(language_id))
  text_document.set("version", @json.JsonValue::Number(version.to_double()))
  text_document.set("text", @json.JsonValue::String(text))

  let params : Map[String, @json.JsonValue] = {}
  params.set("textDocument", @json.JsonValue::Object(text_document))

  let request = @jsonrpc.Request::new("textDocument/didOpen", params=Some(@json.JsonValue::Object(params)))
  @jsonrpc.encode_request(request)
}

///| Create textDocument/didClose notification
pub fn Client::create_did_close_notification(_self : Client, uri : String) -> String {
  let text_document : Map[String, @json.JsonValue] = {}
  text_document.set("uri", @json.JsonValue::String(uri))

  let params : Map[String, @json.JsonValue] = {}
  params.set("textDocument", @json.JsonValue::Object(text_document))

  let request = @jsonrpc.Request::new("textDocument/didClose", params=Some(@json.JsonValue::Object(params)))
  @jsonrpc.encode_request(request)
}

///| Create shutdown request
pub fn Client::create_shutdown_request(self : Client) -> (Int, String) {
  let id = self.get_next_id()
  let request = @jsonrpc.Request::new(
    "shutdown",
    params=Some(@json.JsonValue::Null),
    id=Some(@jsonrpc.RequestId::Number(id)),
  )
  let encoded = @jsonrpc.encode_request(request)
  (id, encoded)
}

///| Create exit notification
pub fn Client::create_exit_notification(_self : Client) -> String {
  let request = @jsonrpc.Request::new("exit", params=Some(@json.JsonValue::Null))
  @jsonrpc.encode_request(request)
}

///| Register a pending request handler
pub fn Client::register_pending(
  self : Client,
  id : Int,
  handler : (@jsonrpc.Response) -> Unit
) -> Unit {
  self.pending.set(id, ResponseHandler::{ handler, })
}

///| Feed data from server and process messages
pub fn Client::feed(self : Client, data : String) -> Unit {
  self.decoder.push(data)
  while true {
    let result = try { self.decoder.decode() } catch { _ => None }
    match result {
      Some(decode_result) => self.handle_message(decode_result.message)
      None => break
    }
  }
}

///| Handle a decoded message
fn Client::handle_message(self : Client, message : @jsonrpc.Message) -> Unit {
  match message {
    @jsonrpc.Message::Request(req) => {
      // Server-initiated request or notification
      if req.id is None {
        // It's a notification
        self.handle_notification(req.method_name, req.params)
      }
      // Ignore server requests for now (we'd need to respond)
    }
    @jsonrpc.Message::Response(resp) => {
      // Response to our request
      match resp.id {
        Some(@jsonrpc.RequestId::Number(id)) => {
          match self.pending.get(id) {
            Some(handler) => {
              self.pending.remove(id)
              (handler.handler)(resp)
            }
            None => ()
          }
        }
        _ => ()
      }
    }
  }
}

///| Handle a notification from server
fn Client::handle_notification(
  self : Client,
  name : String,
  params : @json.JsonValue?
) -> Unit {
  match self.notification_handlers.get(name) {
    Some(handler) => (handler.handler)(params)
    None => ()
  }
}

///| Mark client as initialized
pub fn Client::set_initialized(self : Client) -> Unit {
  self.initialized = true
}

///| Check if client is initialized
pub fn Client::is_initialized(self : Client) -> Bool {
  self.initialized
}

///| Send initialize request via transport
pub fn[T : Transport] Client::initialize(
  self : Client,
  transport : T,
  on_response : (@jsonrpc.Response) -> Unit
) -> Unit {
  let (id, encoded) = self.create_initialize_request()
  self.register_pending(id, on_response)
  transport.write(encoded)
}

///| Send initialized notification via transport
pub fn[T : Transport] Client::send_initialized(self : Client, transport : T) -> Unit {
  let encoded = self.create_initialized_notification()
  transport.write(encoded)
  self.set_initialized()
}

///| Open a document via transport
pub fn[T : Transport] Client::open_document(
  self : Client,
  transport : T,
  uri : String,
  language_id : String,
  version : Int,
  text : String
) -> Unit {
  let encoded = self.create_did_open_notification(uri, language_id, version, text)
  transport.write(encoded)
}

///| Close a document via transport
pub fn[T : Transport] Client::close_document(
  self : Client,
  transport : T,
  uri : String
) -> Unit {
  let encoded = self.create_did_close_notification(uri)
  transport.write(encoded)
}

///| Send shutdown request via transport
pub fn[T : Transport] Client::shutdown(
  self : Client,
  transport : T,
  on_response : (@jsonrpc.Response) -> Unit
) -> Unit {
  let (id, encoded) = self.create_shutdown_request()
  self.register_pending(id, on_response)
  transport.write(encoded)
}

///| Send exit notification via transport
pub fn[T : Transport] Client::exit(self : Client, transport : T) -> Unit {
  let encoded = self.create_exit_notification()
  transport.write(encoded)
}

///| Process incoming data from transport
pub fn[T : Transport] Client::process(self : Client, transport : T) -> Unit {
  while true {
    match transport.read() {
      ReadResult::Data(data) => self.feed(data)
      ReadResult::Eof => break
      ReadResult::Error(_) => break
    }
  }
}

///| Run single read cycle (non-blocking style)
pub fn[T : Transport] Client::tick(self : Client, transport : T) -> Bool {
  match transport.read() {
    ReadResult::Data(data) => {
      self.feed(data)
      true
    }
    ReadResult::Eof => false
    ReadResult::Error(_) => false
  }
}
