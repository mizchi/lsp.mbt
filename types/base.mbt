///| LSP Base Types

///| Document URI (typically file:// URL)
pub struct DocumentUri(String) derive(Eq)

///|
pub impl Show for DocumentUri with output(self, logger) {
  logger.write_string(self.0)
}

///|
pub impl @json.ToJson for DocumentUri with to_json(self) {
  @json.JsonValue::string(self.0)
}

///|
pub impl @json.FromJson for DocumentUri with from_json(json) {
  match json {
    @json.JsonValue::String(s) => DocumentUri(s)
    _ => raise @json.JsonError("expected string for DocumentUri")
  }
}

///| Position in a text document (0-based line and character)
pub struct Position {
  line : UInt
  character : UInt
} derive(Eq, Show)

///|
pub fn Position::new(line : UInt, character : UInt) -> Position {
  Position::{ line, character }
}

///|
pub impl @json.ToJson for Position with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("line", @json.JsonValue::int(self.line.reinterpret_as_int()))
  obj.set("character", @json.JsonValue::int(self.character.reinterpret_as_int()))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for Position with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for Position")
  }
  let line = match obj.get("line") {
    Some(@json.JsonValue::Number(n)) => n.to_int().reinterpret_as_uint()
    _ => raise @json.JsonError("missing or invalid line")
  }
  let character = match obj.get("character") {
    Some(@json.JsonValue::Number(n)) => n.to_int().reinterpret_as_uint()
    _ => raise @json.JsonError("missing or invalid character")
  }
  Position::{ line, character }
}

///| A range in a text document
pub struct Range {
  start : Position
  end : Position
} derive(Eq, Show)

///|
pub fn Range::new(start : Position, end : Position) -> Range {
  Range::{ start, end }
}

///|
pub impl @json.ToJson for Range with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("start", self.start.to_json())
  obj.set("end", self.end.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for Range with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for Range")
  }
  let start = match obj.get("start") {
    Some(v) => Position::from_json(v)
    None => raise @json.JsonError("missing start")
  }
  let end = match obj.get("end") {
    Some(v) => Position::from_json(v)
    None => raise @json.JsonError("missing end")
  }
  Range::{ start, end }
}

///| Represents a location inside a resource
pub struct Location {
  uri : DocumentUri
  range : Range
} derive(Eq, Show)

///|
pub fn Location::new(uri : DocumentUri, range : Range) -> Location {
  Location::{ uri, range }
}

///|
pub impl @json.ToJson for Location with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("uri", self.uri.to_json())
  obj.set("range", self.range.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for Location with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for Location")
  }
  let uri = match obj.get("uri") {
    Some(v) => DocumentUri::from_json(v)
    None => raise @json.JsonError("missing uri")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  Location::{ uri, range }
}

///| Text document identifier
pub struct TextDocumentIdentifier {
  uri : DocumentUri
} derive(Eq, Show)

///|
pub impl @json.ToJson for TextDocumentIdentifier with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("uri", self.uri.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextDocumentIdentifier with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextDocumentIdentifier")
  }
  let uri = match obj.get("uri") {
    Some(v) => DocumentUri::from_json(v)
    None => raise @json.JsonError("missing uri")
  }
  TextDocumentIdentifier::{ uri }
}

///| Text document item (with content)
pub struct TextDocumentItem {
  uri : DocumentUri
  language_id : String
  version : Int
  text : String
} derive(Show)

///|
pub impl @json.ToJson for TextDocumentItem with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("uri", self.uri.to_json())
  obj.set("languageId", @json.JsonValue::string(self.language_id))
  obj.set("version", @json.JsonValue::int(self.version))
  obj.set("text", @json.JsonValue::string(self.text))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextDocumentItem with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextDocumentItem")
  }
  let uri = match obj.get("uri") {
    Some(v) => DocumentUri::from_json(v)
    None => raise @json.JsonError("missing uri")
  }
  let language_id = match obj.get("languageId") {
    Some(@json.JsonValue::String(s)) => s
    _ => raise @json.JsonError("missing or invalid languageId")
  }
  let version = match obj.get("version") {
    Some(@json.JsonValue::Number(n)) => n.to_int()
    _ => raise @json.JsonError("missing or invalid version")
  }
  let text = match obj.get("text") {
    Some(@json.JsonValue::String(s)) => s
    _ => raise @json.JsonError("missing or invalid text")
  }
  TextDocumentItem::{ uri, language_id, version, text }
}

///| Versioned text document identifier
pub struct VersionedTextDocumentIdentifier {
  uri : DocumentUri
  version : Int
} derive(Eq, Show)

///|
pub impl @json.ToJson for VersionedTextDocumentIdentifier with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("uri", self.uri.to_json())
  obj.set("version", @json.JsonValue::int(self.version))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for VersionedTextDocumentIdentifier with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for VersionedTextDocumentIdentifier")
  }
  let uri = match obj.get("uri") {
    Some(v) => DocumentUri::from_json(v)
    None => raise @json.JsonError("missing uri")
  }
  let version = match obj.get("version") {
    Some(@json.JsonValue::Number(n)) => n.to_int()
    _ => raise @json.JsonError("missing or invalid version")
  }
  VersionedTextDocumentIdentifier::{ uri, version }
}

///| Text document position params
pub struct TextDocumentPositionParams {
  text_document : TextDocumentIdentifier
  position : Position
} derive(Eq, Show)

///|
pub impl @json.ToJson for TextDocumentPositionParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  obj.set("position", self.position.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextDocumentPositionParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextDocumentPositionParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let position = match obj.get("position") {
    Some(v) => Position::from_json(v)
    None => raise @json.JsonError("missing position")
  }
  TextDocumentPositionParams::{ text_document, position }
}
