///| JSON-RPC dispatcher - routes messages to handlers

///| Handler function type
pub(all) type Handler (Request) -> Response!RpcError

///| RPC error type
pub(all) type! RpcError {
  MethodNotFound(String)
  InvalidParams(String)
  InternalError(String)
}

///| Convert RpcError to ResponseError
pub fn RpcError::to_response_error(self : RpcError) -> ResponseError {
  match self {
    MethodNotFound(msg) =>
      ResponseError::new(error_method_not_found(), "Method not found: \{msg}")
    InvalidParams(msg) =>
      ResponseError::new(error_invalid_params(), "Invalid params: \{msg}")
    InternalError(msg) =>
      ResponseError::new(error_internal_error(), "Internal error: \{msg}")
  }
}

///| Dispatcher manages method handlers
pub struct Dispatcher {
  handlers : Map[String, Handler]
  notification_handlers : Map[String, (Request) -> Unit]
}

///|
pub fn Dispatcher::new() -> Dispatcher {
  Dispatcher::{
    handlers: {},
    notification_handlers: {},
  }
}

///| Register a request handler
pub fn Dispatcher::on_request(
  self : Dispatcher,
  method : String,
  handler : Handler
) -> Unit {
  self.handlers.set(method, handler)
}

///| Register a notification handler
pub fn Dispatcher::on_notification(
  self : Dispatcher,
  method : String,
  handler : (Request) -> Unit
) -> Unit {
  self.notification_handlers.set(method, handler)
}

///| Dispatch a message and return response (if any)
pub fn Dispatcher::dispatch(self : Dispatcher, message : Message) -> Response? {
  match message {
    Message::Request(req) => {
      if req.is_notification() {
        // Notification - no response expected
        match self.notification_handlers.get(req.method) {
          Some(handler) => handler(req)
          None => () // Ignore unknown notifications
        }
        None
      } else {
        // Request - response required
        Some(self.dispatch_request(req))
      }
    }
    Message::Response(_) => None // Responses are not dispatched
  }
}

///| Dispatch a request and return response
fn Dispatcher::dispatch_request(self : Dispatcher, req : Request) -> Response {
  match self.handlers.get(req.method) {
    Some(handler) => {
      try {
        handler!(req)
      } catch {
        err => Response::err(req.id, err.to_response_error())
      }
    }
    None =>
      Response::err(
        req.id,
        ResponseError::new(
          error_method_not_found(),
          "Method not found: \{req.method}",
        ),
      )
  }
}

///| Process a raw message string and return encoded response (if any)
pub fn Dispatcher::process(self : Dispatcher, input : String) -> String?!@json.JsonError {
  let json = @json.parse!(input)
  let message = Message::from_json!(json)
  match self.dispatch(message) {
    Some(response) => Some(encode_response(response))
    None => None
  }
}
