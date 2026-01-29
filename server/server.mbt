///| LSP Server - Platform-independent interface

///| Server configuration
pub(all) struct ServerConfig {
  name : String
  version : String
}

///| Server instance that handles LSP communication
pub struct Server {
  config : ServerConfig
  dispatcher : @jsonrpc.Dispatcher
  decoder : @jsonrpc.Decoder
}

///|
pub fn Server::new(config : ServerConfig) -> Server {
  Server::{
    config,
    dispatcher: @jsonrpc.Dispatcher::new(),
    decoder: @jsonrpc.Decoder::new(),
  }
}

///| Register a request handler
pub fn Server::on_request(
  self : Server,
  name : String,
  handler : @jsonrpc.Handler
) -> Unit {
  self.dispatcher.on_request(name, handler)
}

///| Register a notification handler
pub fn Server::on_notification(
  self : Server,
  name : String,
  handler : (@jsonrpc.Request) -> Unit
) -> Unit {
  self.dispatcher.on_notification(name, handler)
}

///| Process a single message and return response if any
pub fn Server::process_message(
  self : Server,
  message : @jsonrpc.Message
) -> @jsonrpc.Response? {
  self.dispatcher.dispatch(message)
}

///| Feed data to the decoder and process any complete messages
pub fn[H : IoHandler] Server::feed(
  self : Server,
  io : H,
  data : String
) -> Unit {
  self.decoder.push(data)
  // Process all complete messages in the buffer
  while true {
    let result = try { self.decoder.decode() } catch { _ => None }
    match result {
      Some(decode_result) => {
        match self.dispatcher.dispatch(decode_result.message) {
          Some(response) => {
            let encoded = @jsonrpc.encode_response(response)
            io.write(encoded)
          }
          None => ()
        }
      }
      None => break
    }
  }
}

///| Run the server with the given IO handler
pub fn[H : IoHandler] Server::run(self : Server, io : H) -> Unit {
  while true {
    match io.read() {
      ReadResult::Data(data) => self.feed(io, data)
      ReadResult::Eof => break
      ReadResult::Error(_) => break
    }
  }
}
