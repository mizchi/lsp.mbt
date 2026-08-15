///| LSP Diagnostic Types

///|
/// Diagnostic severity
pub enum DiagnosticSeverity {
  Error // 1
  Warning // 2
  Information // 3
  Hint // 4
} derive(Eq, Debug)

///|
pub impl Show for DiagnosticSeverity with fn output(self, logger) {
  match self {
    Error => logger.write_string("Error")
    Warning => logger.write_string("Warning")
    Information => logger.write_string("Information")
    Hint => logger.write_string("Hint")
  }
}

///|
pub impl @json.ToJson for DiagnosticSeverity with fn to_json(self) {
  let n = match self {
    Error => 1
    Warning => 2
    Information => 3
    Hint => 4
  }
  @json.JsonValue::int(n)
}

///|
pub impl @json.FromJson for DiagnosticSeverity with fn from_json(json) {
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

///|
/// Diagnostic tag
pub enum DiagnosticTag {
  Unnecessary // 1
  Deprecated // 2
} derive(Eq, Debug)

///|
pub impl Show for DiagnosticTag with fn output(self, logger) {
  match self {
    Unnecessary => logger.write_string("Unnecessary")
    Deprecated => logger.write_string("Deprecated")
  }
}

///|
pub impl @json.ToJson for DiagnosticTag with fn to_json(self) {
  let n = match self {
    Unnecessary => 1
    Deprecated => 2
  }
  @json.JsonValue::int(n)
}

///|
pub impl @json.FromJson for DiagnosticTag with fn from_json(json) {
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

///|
/// Related diagnostic information
pub struct DiagnosticRelatedInformation {
  location : Location
  message : String
} derive(Eq, Debug)

///|
pub impl Show for DiagnosticRelatedInformation with fn output(self, logger) {
  logger.write_string("{location: ")
  write_show_value(self.location, logger)
  logger.write_string(", message: ")
  write_show_value(self.message, logger)
  logger.write_string("}")
}

///|
pub impl @json.ToJson for DiagnosticRelatedInformation with fn to_json(self) {
  let obj : Map[String, @json.JsonValue] = Map([])
  obj.set("location", self.location.to_json())
  obj.set("message", @json.JsonValue::string(self.message))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DiagnosticRelatedInformation with fn from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ =>
      raise @json.JsonError("expected object for DiagnosticRelatedInformation")
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

///|
/// Diagnostic code (can be string or number)
pub enum DiagnosticCode {
  Number(Int)
  String(String)
} derive(Eq, Debug)

///|
pub impl Show for DiagnosticCode with fn output(self, logger) {
  match self {
    Number(n) => {
      logger.write_string("Number(")
      write_show_value(n, logger)
      logger.write_string(")")
    }
    String(s) => {
      logger.write_string("String(")
      write_show_value(s, logger)
      logger.write_string(")")
    }
  }
}

///|
pub impl @json.ToJson for DiagnosticCode with fn to_json(self) {
  match self {
    Number(n) => @json.JsonValue::int(n)
    String(s) => @json.JsonValue::string(s)
  }
}

///|
pub impl @json.FromJson for DiagnosticCode with fn from_json(json) {
  match json {
    @json.JsonValue::Number(n) => Number(n.to_int())
    @json.JsonValue::String(s) => String(s)
    _ => raise @json.JsonError("expected number or string for DiagnosticCode")
  }
}

///|
/// A diagnostic message
pub struct Diagnostic {
  range : Range
  severity : DiagnosticSeverity?
  code : DiagnosticCode?
  source : String?
  message : String
  tags : Array[DiagnosticTag]?
  related_information : Array[DiagnosticRelatedInformation]?
} derive(Debug)

///|
pub impl Show for Diagnostic with fn output(self, logger) {
  logger.write_string("{range: ")
  write_show_value(self.range, logger)
  logger.write_string(", severity: ")
  write_debug_value(self.severity, logger)
  logger.write_string(", code: ")
  write_debug_value(self.code, logger)
  logger.write_string(", source: ")
  write_debug_value(self.source, logger)
  logger.write_string(", message: ")
  write_show_value(self.message, logger)
  logger.write_string(", tags: ")
  write_debug_value(self.tags, logger)
  logger.write_string(", related_information: ")
  write_debug_value(self.related_information, logger)
  logger.write_string("}")
}

///|
pub fn Diagnostic::new(
  range : Range,
  message : String,
  severity? : DiagnosticSeverity? = None,
  code? : DiagnosticCode? = None,
  source? : String? = None,
  tags? : Array[DiagnosticTag]? = None,
  related_information? : Array[DiagnosticRelatedInformation]? = None,
) -> Diagnostic {
  Diagnostic::{
    range,
    severity,
    code,
    source,
    message,
    tags,
    related_information,
  }
}

///|
pub impl @json.ToJson for Diagnostic with fn to_json(self) {
  let obj : Map[String, @json.JsonValue] = Map([])
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
pub impl @json.FromJson for Diagnostic with fn from_json(json) {
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
    Some(v) if !v.is_null() => Some(DiagnosticSeverity::from_json(v))
    _ => None
  }
  let code : DiagnosticCode? = match obj.get("code") {
    Some(v) if !v.is_null() => Some(DiagnosticCode::from_json(v))
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
  let related_information : Array[DiagnosticRelatedInformation]? = match
    obj.get("relatedInformation") {
    Some(@json.JsonValue::Array(arr)) => {
      let result : Array[DiagnosticRelatedInformation] = []
      for item in arr {
        result.push(DiagnosticRelatedInformation::from_json(item))
      }
      Some(result)
    }
    _ => None
  }
  Diagnostic::{
    range,
    severity,
    code,
    source,
    message,
    tags,
    related_information,
  }
}

///|
/// Publish diagnostics params
pub struct PublishDiagnosticsParams {
  uri : DocumentUri
  version : Int?
  diagnostics : Array[Diagnostic]
} derive(Debug)

///|
pub impl Show for PublishDiagnosticsParams with fn output(self, logger) {
  logger.write_string("{uri: ")
  write_show_value(self.uri, logger)
  logger.write_string(", version: ")
  write_debug_value(self.version, logger)
  logger.write_string(", diagnostics: ")
  write_debug_value(self.diagnostics, logger)
  logger.write_string("}")
}

///|
pub impl @json.ToJson for PublishDiagnosticsParams with fn to_json(self) {
  let obj : Map[String, @json.JsonValue] = Map([])
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
pub impl @json.FromJson for PublishDiagnosticsParams with fn from_json(json) {
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
