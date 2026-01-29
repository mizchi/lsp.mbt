///| LSP Diagnostic Types

///| Diagnostic severity
pub enum DiagnosticSeverity {
  Error       // 1
  Warning     // 2
  Information // 3
  Hint        // 4
} derive(Eq, Show)

///|
pub impl @json.ToJson for DiagnosticSeverity with to_json(self) {
  let n = match self {
    Error => 1
    Warning => 2
    Information => 3
    Hint => 4
  }
  @json.JsonValue::int(n)
}

///|
pub impl @json.FromJson for DiagnosticSeverity with from_json(json) {
  match json {
    @json.JsonValue::Number(n) =>
      match n.to_int() {
        1 => Error
        2 => Warning
        3 => Information
        4 => Hint
        _ => raise @json.JsonError("invalid DiagnosticSeverity")
      }
    _ => raise @json.JsonError("expected number for DiagnosticSeverity")
  }
}

///| Diagnostic tag
pub enum DiagnosticTag {
  Unnecessary // 1
  Deprecated  // 2
} derive(Eq, Show)

///|
pub impl @json.ToJson for DiagnosticTag with to_json(self) {
  let n = match self {
    Unnecessary => 1
    Deprecated => 2
  }
  @json.JsonValue::int(n)
}

///|
pub impl @json.FromJson for DiagnosticTag with from_json(json) {
  match json {
    @json.JsonValue::Number(n) =>
      match n.to_int() {
        1 => Unnecessary
        2 => Deprecated
        _ => raise @json.JsonError("invalid DiagnosticTag")
      }
    _ => raise @json.JsonError("expected number for DiagnosticTag")
  }
}

///| Related diagnostic information
pub struct DiagnosticRelatedInformation {
  location : Location
  message : String
} derive(Eq, Show)

///|
pub impl @json.ToJson for DiagnosticRelatedInformation with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("location", self.location.to_json())
  obj.set("message", @json.JsonValue::string(self.message))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DiagnosticRelatedInformation with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DiagnosticRelatedInformation")
  }
  let location = match obj.get("location") {
    Some(v) => Location::from_json(v)
    None => raise @json.JsonError("missing location")
  }
  let message = match obj.get("message") {
    Some(@json.JsonValue::String(s)) => s
    _ => raise @json.JsonError("missing or invalid message")
  }
  DiagnosticRelatedInformation::{ location, message }
}

///| Diagnostic code (can be string or number)
pub enum DiagnosticCode {
  Number(Int)
  String(String)
} derive(Eq, Show)

///|
pub impl @json.ToJson for DiagnosticCode with to_json(self) {
  match self {
    Number(n) => @json.JsonValue::int(n)
    String(s) => @json.JsonValue::string(s)
  }
}

///|
pub impl @json.FromJson for DiagnosticCode with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => Number(n.to_int())
    @json.JsonValue::String(s) => String(s)
    _ => raise @json.JsonError("expected number or string for DiagnosticCode")
  }
}

///| A diagnostic message
pub struct Diagnostic {
  range : Range
  severity : DiagnosticSeverity?
  code : DiagnosticCode?
  source : String?
  message : String
  tags : Array[DiagnosticTag]?
  related_information : Array[DiagnosticRelatedInformation]?
} derive(Show)

///|
pub fn Diagnostic::new(
  range : Range,
  message : String,
  severity~ : DiagnosticSeverity? = None,
  code~ : DiagnosticCode? = None,
  source~ : String? = None,
  tags~ : Array[DiagnosticTag]? = None,
  related_information~ : Array[DiagnosticRelatedInformation]? = None
) -> Diagnostic {
  Diagnostic::{ range, severity, code, source, message, tags, related_information }
}

///|
pub impl @json.ToJson for Diagnostic with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("range", self.range.to_json())
  obj.set("message", @json.JsonValue::string(self.message))
  match self.severity {
    Some(s) => obj.set("severity", s.to_json())
    None => ()
  }
  match self.code {
    Some(c) => obj.set("code", c.to_json())
    None => ()
  }
  match self.source {
    Some(s) => obj.set("source", @json.JsonValue::string(s))
    None => ()
  }
  match self.tags {
    Some(t) => {
      let arr : Array[@json.JsonValue] = []
      for tag in t {
        arr.push(tag.to_json())
      }
      obj.set("tags", @json.JsonValue::Array(arr))
    }
    None => ()
  }
  match self.related_information {
    Some(r) => {
      let arr : Array[@json.JsonValue] = []
      for info in r {
        arr.push(info.to_json())
      }
      obj.set("relatedInformation", @json.JsonValue::Array(arr))
    }
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for Diagnostic with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for Diagnostic")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  let message = match obj.get("message") {
    Some(@json.JsonValue::String(s)) => s
    _ => raise @json.JsonError("missing or invalid message")
  }
  let severity : DiagnosticSeverity? = match obj.get("severity") {
    Some(v) if not(v.is_null()) => Some(DiagnosticSeverity::from_json(v))
    _ => None
  }
  let code : DiagnosticCode? = match obj.get("code") {
    Some(v) if not(v.is_null()) => Some(DiagnosticCode::from_json(v))
    _ => None
  }
  let source : String? = match obj.get("source") {
    Some(@json.JsonValue::String(s)) => Some(s)
    _ => None
  }
  let tags : Array[DiagnosticTag]? = match obj.get("tags") {
    Some(@json.JsonValue::Array(arr)) => {
      let result : Array[DiagnosticTag] = []
      for item in arr {
        result.push(DiagnosticTag::from_json(item))
      }
      Some(result)
    }
    _ => None
  }
  let related_information : Array[DiagnosticRelatedInformation]? = match obj.get(
    "relatedInformation"
  ) {
    Some(@json.JsonValue::Array(arr)) => {
      let result : Array[DiagnosticRelatedInformation] = []
      for item in arr {
        result.push(DiagnosticRelatedInformation::from_json(item))
      }
      Some(result)
    }
    _ => None
  }
  Diagnostic::{ range, severity, code, source, message, tags, related_information }
}

///| Publish diagnostics params
pub struct PublishDiagnosticsParams {
  uri : DocumentUri
  version : Int?
  diagnostics : Array[Diagnostic]
} derive(Show)

///|
pub impl @json.ToJson for PublishDiagnosticsParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("uri", self.uri.to_json())
  match self.version {
    Some(v) => obj.set("version", @json.JsonValue::int(v))
    None => ()
  }
  let diag_arr : Array[@json.JsonValue] = []
  for diag in self.diagnostics {
    diag_arr.push(diag.to_json())
  }
  obj.set("diagnostics", @json.JsonValue::Array(diag_arr))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for PublishDiagnosticsParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for PublishDiagnosticsParams")
  }
  let uri = match obj.get("uri") {
    Some(v) => DocumentUri::from_json(v)
    None => raise @json.JsonError("missing uri")
  }
  let version : Int? = match obj.get("version") {
    Some(@json.JsonValue::Number(n)) => Some(n.to_int())
    _ => None
  }
  let diagnostics : Array[Diagnostic] = match obj.get("diagnostics") {
    Some(@json.JsonValue::Array(arr)) => {
      let result : Array[Diagnostic] = []
      for item in arr {
        result.push(Diagnostic::from_json(item))
      }
      result
    }
    _ => raise @json.JsonError("missing diagnostics")
  }
  PublishDiagnosticsParams::{ uri, version, diagnostics }
}
