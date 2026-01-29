///| Platform-independent filesystem interface
///| Supports real filesystem, in-memory filesystem, and virtual filesystem

///| File entry type
pub(all) enum EntryKind {
  File
  Directory
} derive(Eq, Show)

///| Directory entry
pub(all) struct DirEntry {
  name : String
  kind : EntryKind
} derive(Eq, Show)

///| Filesystem operation result
pub(all) enum FsResult[T] {
  Ok(T)
  NotFound(String)
  PermissionDenied(String)
  IoError(String)
} derive(Show, Eq)

///|
pub fn[T] FsResult::is_ok(self : FsResult[T]) -> Bool {
  match self {
    Ok(_) => true
    _ => false
  }
}

///|
pub fn[T] FsResult::unwrap(self : FsResult[T]) -> T {
  match self {
    Ok(v) => v
    NotFound(msg) => abort("FsResult::unwrap on NotFound: \{msg}")
    PermissionDenied(msg) => abort("FsResult::unwrap on PermissionDenied: \{msg}")
    IoError(msg) => abort("FsResult::unwrap on IoError: \{msg}")
  }
}

///| FileSystem trait - implement for platform-specific or virtual filesystems
pub(open) trait FileSystem {
  /// Read file content as string
  read_file(Self, String) -> FsResult[String]

  /// Write content to file
  write_file(Self, String, String) -> FsResult[Unit]

  /// Check if path exists
  exists(Self, String) -> Bool

  /// Check if path is a file
  is_file(Self, String) -> Bool

  /// Check if path is a directory
  is_directory(Self, String) -> Bool

  /// List directory contents
  read_dir(Self, String) -> FsResult[Array[DirEntry]]

  /// Create directory (and parents if needed)
  create_dir(Self, String) -> FsResult[Unit]

  /// Remove file
  remove_file(Self, String) -> FsResult[Unit]

  /// Remove directory
  remove_dir(Self, String) -> FsResult[Unit]
}

///| In-memory filesystem node
enum FsNode {
  FileNode(String)  // content
  DirNode(Map[String, FsNode])  // children
}

///| In-memory filesystem for testing and WASM
pub struct MemoryFs {
  priv root : Map[String, FsNode]
}

///|
pub fn MemoryFs::new() -> MemoryFs {
  MemoryFs::{ root: Map::new() }
}

///| Parse path into components
fn parse_path(path : String) -> Array[String] {
  let parts : Array[String] = []
  let current = StringBuilder::new()
  for c in path {
    if c == '/' {
      let s = current.to_string()
      if s.length() > 0 {
        parts.push(s)
      }
      current.reset()
    } else {
      current.write_char(c)
    }
  }
  let s = current.to_string()
  if s.length() > 0 {
    parts.push(s)
  }
  parts
}

///| Get parent path
fn parent_path(parts : Array[String]) -> Array[String] {
  if parts.length() <= 1 {
    []
  } else {
    let result : Array[String] = []
    for i in 0..<(parts.length() - 1) {
      result.push(parts[i])
    }
    result
  }
}

///| Navigate to a node
fn MemoryFs::get_node(self : MemoryFs, parts : Array[String]) -> FsNode? {
  if parts.length() == 0 {
    return Some(FsNode::DirNode(self.root))
  }
  let mut current : Map[String, FsNode] = self.root
  for i in 0..<parts.length() {
    let part = parts[i]
    match current.get(part) {
      Some(FsNode::DirNode(children)) => {
        if i == parts.length() - 1 {
          return Some(FsNode::DirNode(children))
        }
        current = children
      }
      Some(FsNode::FileNode(content)) => {
        if i == parts.length() - 1 {
          return Some(FsNode::FileNode(content))
        }
        return None  // Can't traverse into a file
      }
      None => return None
    }
  }
  None
}

///| Get parent directory node
fn MemoryFs::get_parent_dir(
  self : MemoryFs,
  parts : Array[String]
) -> Map[String, FsNode]? {
  if parts.length() == 0 {
    return Some(self.root)
  }
  let parent_parts = parent_path(parts)
  if parent_parts.length() == 0 {
    return Some(self.root)
  }
  match self.get_node(parent_parts) {
    Some(FsNode::DirNode(children)) => Some(children)
    _ => None
  }
}

///|
pub impl FileSystem for MemoryFs with read_file(self, path) {
  let parts = parse_path(path)
  match self.get_node(parts) {
    Some(FsNode::FileNode(content)) => FsResult::Ok(content)
    Some(FsNode::DirNode(_)) => FsResult::IoError("path is a directory: \{path}")
    None => FsResult::NotFound(path)
  }
}

///|
pub impl FileSystem for MemoryFs with write_file(self, path, content) {
  let parts = parse_path(path)
  if parts.length() == 0 {
    return FsResult::IoError("invalid path")
  }
  let filename = parts[parts.length() - 1]

  // Ensure parent directories exist
  let parent_parts = parent_path(parts)
  let mut current = self.root
  for i in 0..<parent_parts.length() {
    let part = parent_parts[i]
    match current.get(part) {
      Some(FsNode::DirNode(children)) => current = children
      Some(FsNode::FileNode(_)) =>
        return FsResult::IoError("parent is a file")
      None => {
        let new_dir : Map[String, FsNode] = Map::new()
        current.set(part, FsNode::DirNode(new_dir))
        current = new_dir
      }
    }
  }

  current.set(filename, FsNode::FileNode(content))
  FsResult::Ok(())
}

///|
pub impl FileSystem for MemoryFs with exists(self, path) {
  let parts = parse_path(path)
  self.get_node(parts) is Some(_)
}

///|
pub impl FileSystem for MemoryFs with is_file(self, path) {
  let parts = parse_path(path)
  match self.get_node(parts) {
    Some(FsNode::FileNode(_)) => true
    _ => false
  }
}

///|
pub impl FileSystem for MemoryFs with is_directory(self, path) {
  let parts = parse_path(path)
  match self.get_node(parts) {
    Some(FsNode::DirNode(_)) => true
    _ => false
  }
}

///|
pub impl FileSystem for MemoryFs with read_dir(self, path) {
  let parts = parse_path(path)
  let node = if parts.length() == 0 {
    Some(FsNode::DirNode(self.root))
  } else {
    self.get_node(parts)
  }
  match node {
    Some(FsNode::DirNode(children)) => {
      let entries : Array[DirEntry] = []
      children.each(fn(name, node) {
        let kind = match node {
          FsNode::FileNode(_) => EntryKind::File
          FsNode::DirNode(_) => EntryKind::Directory
        }
        entries.push(DirEntry::{ name, kind })
      })
      FsResult::Ok(entries)
    }
    Some(FsNode::FileNode(_)) => FsResult::IoError("path is a file: \{path}")
    None => FsResult::NotFound(path)
  }
}

///|
pub impl FileSystem for MemoryFs with create_dir(self, path) {
  let parts = parse_path(path)
  if parts.length() == 0 {
    return FsResult::Ok(())  // Root always exists
  }

  let mut current = self.root
  for part in parts {
    match current.get(part) {
      Some(FsNode::DirNode(children)) => current = children
      Some(FsNode::FileNode(_)) =>
        return FsResult::IoError("path exists as file")
      None => {
        let new_dir : Map[String, FsNode] = Map::new()
        current.set(part, FsNode::DirNode(new_dir))
        current = new_dir
      }
    }
  }
  FsResult::Ok(())
}

///|
pub impl FileSystem for MemoryFs with remove_file(self, path) {
  let parts = parse_path(path)
  if parts.length() == 0 {
    return FsResult::IoError("cannot remove root")
  }
  let filename = parts[parts.length() - 1]

  match self.get_parent_dir(parts) {
    Some(parent) => {
      match parent.get(filename) {
        Some(FsNode::FileNode(_)) => {
          parent.remove(filename)
          FsResult::Ok(())
        }
        Some(FsNode::DirNode(_)) => FsResult::IoError("path is a directory")
        None => FsResult::NotFound(path)
      }
    }
    None => FsResult::NotFound(path)
  }
}

///|
pub impl FileSystem for MemoryFs with remove_dir(self, path) {
  let parts = parse_path(path)
  if parts.length() == 0 {
    return FsResult::IoError("cannot remove root")
  }
  let dirname = parts[parts.length() - 1]

  match self.get_parent_dir(parts) {
    Some(parent) => {
      match parent.get(dirname) {
        Some(FsNode::DirNode(children)) => {
          if children.length() > 0 {
            FsResult::IoError("directory not empty")
          } else {
            parent.remove(dirname)
            FsResult::Ok(())
          }
        }
        Some(FsNode::FileNode(_)) => FsResult::IoError("path is a file")
        None => FsResult::NotFound(path)
      }
    }
    None => FsResult::NotFound(path)
  }
}
