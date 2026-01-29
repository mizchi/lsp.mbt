///| JSON-RPC 2.0 protocol types

///| Request ID - can be string or number
pub(all) enum RequestId {
  Number(Int)
  String(String)
} derive(Eq, Show)

///|
pub impl @json.ToJson for RequestId with to_json(self) {
  match self {
    Number(n) => @json.JsonValue::int(n)
    String(s) => @json.JsonValue::string(s)
  }
}

///|
pub impl @json.FromJson for RequestId with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => Number(n.to_int())
    @json.JsonValue::String(s) => String(s)
    _ => raise @json.JsonError("expected number or string for RequestId")
  }
}

///| JSON-RPC Request
pub struct Request {
  id : RequestId?
  method_name : String
  params : @json.JsonValue?
} derive(Show)

///|
pub fn Request::new(
  method_name : String,
  params~ : @json.JsonValue? = None,
  id~ : RequestId? = None
) -> Request {
  Request::{ id, method_name, params }
}

///|
pub fn Request::is_notification(self : Request) -> Bool {
  self.id is None
}

///|
pub impl @json.ToJson for Request with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("jsonrpc", @json.JsonValue::string("2.0"))
  match self.id {
    Some(id) => obj.set("id", id.to_json())
    None => ()
  }
  obj.set("method", @json.JsonValue::string(self.method_name))
  match self.params {
    Some(p) => obj.set("params", p)
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for Request with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for Request")
  }
  let method_name = match obj.get("method") {
    Some(@json.JsonValue::String(m)) => m
    _ => raise @json.JsonError("missing or invalid method")
  }
  let id : RequestId? = match obj.get("id") {
    Some(v) if not(v.is_null()) => Some(RequestId::from_json(v))
    _ => None
  }
  let params = obj.get("params")
  Request::{ id, method_name, params }
}

///| JSON-RPC Error
pub struct ResponseError {
  code : Int
  message : String
  data : @json.JsonValue?
} derive(Show)

///| Standard error codes
pub fn error_parse_error() -> Int {
  -32700
}

pub fn error_invalid_request() -> Int {
  -32600
}

pub fn error_method_not_found() -> Int {
  -32601
}

pub fn error_invalid_params() -> Int {
  -32602
}

pub fn error_internal_error() -> Int {
  -32603
}

///|
pub fn ResponseError::new(
  code : Int,
  message : String,
  data~ : @json.JsonValue? = None
) -> ResponseError {
  ResponseError::{ code, message, data }
}

///|
pub impl @json.ToJson for ResponseError with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("code", @json.JsonValue::int(self.code))
  obj.set("message", @json.JsonValue::string(self.message))
  match self.data {
    Some(d) => obj.set("data", d)
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ResponseError with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ResponseError")
  }
  let code = match obj.get("code") {
    Some(@json.JsonValue::Number(n)) => n.to_int()
    _ => raise @json.JsonError("missing or invalid code")
  }
  let message = match obj.get("message") {
    Some(@json.JsonValue::String(m)) => m
    _ => raise @json.JsonError("missing or invalid message")
  }
  let data = obj.get("data")
  ResponseError::{ code, message, data }
}

///| JSON-RPC Response
pub struct Response {
  id : RequestId?
  result : @json.JsonValue?
  error : ResponseError?
} derive(Show)

///|
pub fn Response::ok(id : RequestId?, result : @json.JsonValue) -> Response {
  Response::{ id, result: Some(result), error: None }
}

///|
pub fn Response::err(id : RequestId?, error : ResponseError) -> Response {
  Response::{ id, result: None, error: Some(error) }
}

///|
pub fn Response::is_success(self : Response) -> Bool {
  self.error is None
}

///|
pub impl @json.ToJson for Response with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("jsonrpc", @json.JsonValue::string("2.0"))
  match self.id {
    Some(id) => obj.set("id", id.to_json())
    None => obj.set("id", @json.JsonValue::Null)
  }
  match self.result {
    Some(r) => obj.set("result", r)
    None => ()
  }
  match self.error {
    Some(e) => obj.set("error", e.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for Response with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for Response")
  }
  let id : RequestId? = match obj.get("id") {
    Some(v) if not(v.is_null()) => Some(RequestId::from_json(v))
    _ => None
  }
  let result = obj.get("result")
  let error : ResponseError? = match obj.get("error") {
    Some(v) if not(v.is_null()) => Some(ResponseError::from_json(v))
    _ => None
  }
  Response::{ id, result, error }
}

///| JSON-RPC Message - either request or response
pub(all) enum Message {
  Request(Request)
  Response(Response)
} derive(Show)

///|
pub impl @json.ToJson for Message with to_json(self) {
  match self {
    Request(r) => r.to_json()
    Response(r) => r.to_json()
  }
}

///|
pub impl @json.FromJson for Message with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for Message")
  }
  // Check if it's a request (has method) or response (has result or error)
  if obj.contains("method") {
    Request(Request::from_json(json))
  } else {
    Response(Response::from_json(json))
  }
}
