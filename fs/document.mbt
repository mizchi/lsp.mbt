///| Document management for LSP
///| Tracks open documents and their content, backed by a FileSystem

///| Text document with version tracking
pub struct TextDocument {
  uri : String
  language_id : String
  mut version : Int
  mut content : String
}

///|
pub fn TextDocument::new(
  uri : String,
  language_id : String,
  version : Int,
  content : String
) -> TextDocument {
  TextDocument::{ uri, language_id, version, content }
}

///|
pub fn TextDocument::get_uri(self : TextDocument) -> String {
  self.uri
}

///|
pub fn TextDocument::get_language_id(self : TextDocument) -> String {
  self.language_id
}

///|
pub fn TextDocument::get_version(self : TextDocument) -> Int {
  self.version
}

///|
pub fn TextDocument::get_content(self : TextDocument) -> String {
  self.content
}

///|
pub fn TextDocument::set_content(
  self : TextDocument,
  version : Int,
  content : String
) -> Unit {
  self.version = version
  self.content = content
}

///| Document store - manages open documents
///| Can be backed by any FileSystem implementation
pub struct DocumentStore[F] {
  fs : F
  documents : Map[String, TextDocument]
}

///|
pub fn[F] DocumentStore::new(fs : F) -> DocumentStore[F] {
  DocumentStore::{ fs, documents: Map::new() }
}

///| Open a document (load from FS if not provided)
pub fn[F : FileSystem] DocumentStore::open(
  self : DocumentStore[F],
  uri : String,
  language_id : String,
  version : Int,
  content : String?
) -> TextDocument? {
  let text = match content {
    Some(c) => c
    None => {
      // Load from filesystem
      let path = uri_to_path(uri)
      match self.fs.read_file(path) {
        FsResult::Ok(c) => c
        _ => return None
      }
    }
  }
  let doc = TextDocument::new(uri, language_id, version, text)
  self.documents.set(uri, doc)
  Some(doc)
}

///| Get an open document
pub fn[F] DocumentStore::get(
  self : DocumentStore[F],
  uri : String
) -> TextDocument? {
  self.documents.get(uri)
}

///| Close a document
pub fn[F] DocumentStore::close(
  self : DocumentStore[F],
  uri : String
) -> Unit {
  self.documents.remove(uri)
}

///| Update document content
pub fn[F] DocumentStore::update(
  self : DocumentStore[F],
  uri : String,
  version : Int,
  content : String
) -> Bool {
  match self.documents.get(uri) {
    Some(doc) => {
      doc.set_content(version, content)
      true
    }
    None => false
  }
}

///| Save document to filesystem
pub fn[F : FileSystem] DocumentStore::save(
  self : DocumentStore[F],
  uri : String
) -> FsResult[Unit] {
  match self.documents.get(uri) {
    Some(doc) => {
      let path = uri_to_path(uri)
      self.fs.write_file(path, doc.get_content())
    }
    None => FsResult::NotFound(uri)
  }
}

///| List all open documents
pub fn[F] DocumentStore::list_open(self : DocumentStore[F]) -> Array[String] {
  let uris : Array[String] = []
  self.documents.each(fn(uri, _) { uris.push(uri) })
  uris
}

///| Read file from filesystem (without opening)
pub fn[F : FileSystem] DocumentStore::read_file(
  self : DocumentStore[F],
  uri : String
) -> FsResult[String] {
  let path = uri_to_path(uri)
  self.fs.read_file(path)
}

///| Write file to filesystem (without opening)
pub fn[F : FileSystem] DocumentStore::write_file(
  self : DocumentStore[F],
  uri : String,
  content : String
) -> FsResult[Unit] {
  let path = uri_to_path(uri)
  self.fs.write_file(path, content)
}

///| Convert file URI to path
///| "file:///path/to/file" -> "/path/to/file"
fn uri_to_path(uri : String) -> String {
  if uri.has_prefix("file://") {
    // Remove "file://" prefix (7 characters)
    let result = StringBuilder::new()
    let mut index = 0
    for c in uri {
      if index >= 7 {
        result.write_char(c)
      }
      index = index + 1
    }
    result.to_string()
  } else {
    uri
  }
}

///| Convert path to file URI
///| "/path/to/file" -> "file:///path/to/file"
pub fn path_to_uri(path : String) -> String {
  if path.has_prefix("file://") {
    path
  } else {
    "file://\{path}"
  }
}
