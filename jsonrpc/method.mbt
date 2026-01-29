///| Type-safe method definitions

///| Method definition with typed params and result
pub struct MethodDef[Params, Result] {
  name : String
  phantom_params : Params?
  phantom_result : Result?
}

///|
pub fn[Params, Result] MethodDef::new(name : String) -> MethodDef[Params, Result] {
  MethodDef::{ name, phantom_params: None, phantom_result: None }
}

///| Common LSP method definitions
pub fn method_initialize() -> MethodDef[@json.JsonValue, @json.JsonValue] {
  MethodDef::new("initialize")
}

///|
pub fn method_shutdown() -> MethodDef[Unit, @json.JsonValue] {
  MethodDef::new("shutdown")
}

///|
pub fn method_text_document_did_open() -> MethodDef[@json.JsonValue, Unit] {
  MethodDef::new("textDocument/didOpen")
}

///|
pub fn method_text_document_did_change() -> MethodDef[@json.JsonValue, Unit] {
  MethodDef::new("textDocument/didChange")
}

///|
pub fn method_text_document_did_close() -> MethodDef[@json.JsonValue, Unit] {
  MethodDef::new("textDocument/didClose")
}

///|
pub fn method_text_document_hover() -> MethodDef[@json.JsonValue, @json.JsonValue?] {
  MethodDef::new("textDocument/hover")
}

///|
pub fn method_text_document_completion() -> MethodDef[@json.JsonValue, @json.JsonValue] {
  MethodDef::new("textDocument/completion")
}

///|
pub fn method_text_document_definition() -> MethodDef[@json.JsonValue, @json.JsonValue?] {
  MethodDef::new("textDocument/definition")
}

///|
pub fn method_text_document_references() -> MethodDef[@json.JsonValue, @json.JsonValue] {
  MethodDef::new("textDocument/references")
}

///|
pub fn method_text_document_formatting() -> MethodDef[@json.JsonValue, @json.JsonValue] {
  MethodDef::new("textDocument/formatting")
}

///| Helper to create a typed request handler
pub fn[Params : @json.FromJson, Result : @json.ToJson] make_handler(
  f : (Params) -> Result raise RpcError
) -> Handler {
  Handler(fn(req : Request) -> Response raise RpcError {
    let params : Params = match req.params {
      Some(p) => {
        try {
          Params::from_json(p)
        } catch {
          _ => raise InvalidParams("failed to parse params")
        }
      }
      None => raise InvalidParams("missing params")
    }
    let result = f(params)
    Response::ok(req.id, result.to_json())
  })
}

///| Helper to create a typed notification handler
pub fn[Params : @json.FromJson] make_notification_handler(
  f : (Params) -> Unit
) -> (Request) -> Unit {
  fn(req : Request) {
    match req.params {
      Some(p) => {
        try {
          let params : Params = Params::from_json(p)
          f(params)
        } catch {
          _ => () // Ignore parse errors for notifications
        }
      }
      None => ()
    }
  }
}
