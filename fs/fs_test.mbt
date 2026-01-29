///| FileSystem tests

test "MemoryFs basic file operations" {
  let fs = MemoryFs::new()

  // Write file
  assert_true(fs.write_file("/test.txt", "hello").is_ok())

  // Read file
  assert_eq(fs.read_file("/test.txt"), FsResult::Ok("hello"))

  // Check exists
  assert_true(fs.exists("/test.txt"))
  assert_true(fs.is_file("/test.txt"))
  assert_false(fs.is_directory("/test.txt"))

  // Overwrite
  assert_true(fs.write_file("/test.txt", "world").is_ok())
  assert_eq(fs.read_file("/test.txt"), FsResult::Ok("world"))
}

test "MemoryFs directory operations" {
  let fs = MemoryFs::new()

  // Create directory
  assert_true(fs.create_dir("/src").is_ok())
  assert_true(fs.exists("/src"))
  assert_true(fs.is_directory("/src"))

  // Create nested directories
  assert_true(fs.create_dir("/src/lib/utils").is_ok())
  assert_true(fs.is_directory("/src/lib"))
  assert_true(fs.is_directory("/src/lib/utils"))

  // Write file in directory
  assert_true(fs.write_file("/src/main.mbt", "fn main {}").is_ok())
  assert_eq(fs.read_file("/src/main.mbt"), FsResult::Ok("fn main {}"))
}

test "MemoryFs read_dir" {
  let fs = MemoryFs::new()

  fs.write_file("/a.txt", "a") |> ignore
  fs.write_file("/b.txt", "b") |> ignore
  fs.create_dir("/dir") |> ignore

  match fs.read_dir("/") {
    FsResult::Ok(entries) => {
      assert_eq(entries.length(), 3)
      // Check entries exist (order may vary)
      let names : Array[String] = entries.map(fn(e) { e.name })
      assert_true(names.contains("a.txt"))
      assert_true(names.contains("b.txt"))
      assert_true(names.contains("dir"))
    }
    _ => fail("expected Ok")
  }
}

test "MemoryFs remove operations" {
  let fs = MemoryFs::new()

  // Remove file
  fs.write_file("/test.txt", "hello") |> ignore
  assert_true(fs.exists("/test.txt"))
  assert_true(fs.remove_file("/test.txt").is_ok())
  assert_false(fs.exists("/test.txt"))

  // Remove empty directory
  fs.create_dir("/empty") |> ignore
  assert_true(fs.remove_dir("/empty").is_ok())
  assert_false(fs.exists("/empty"))

  // Cannot remove non-empty directory
  fs.create_dir("/nonempty") |> ignore
  fs.write_file("/nonempty/file.txt", "x") |> ignore
  match fs.remove_dir("/nonempty") {
    FsResult::IoError(_) => ()  // Expected
    _ => fail("expected IoError for non-empty directory")
  }
}

test "MemoryFs error cases" {
  let fs = MemoryFs::new()

  // Read non-existent file
  match fs.read_file("/nofile.txt") {
    FsResult::NotFound(_) => ()
    _ => fail("expected NotFound")
  }

  // Read directory as file
  fs.create_dir("/mydir") |> ignore
  match fs.read_file("/mydir") {
    FsResult::IoError(_) => ()
    _ => fail("expected IoError")
  }

  // Remove non-existent file
  match fs.remove_file("/nofile.txt") {
    FsResult::NotFound(_) => ()
    _ => fail("expected NotFound")
  }
}

test "MemoryFs auto-create parent directories" {
  let fs = MemoryFs::new()

  // Write file should auto-create parent dirs
  assert_true(fs.write_file("/a/b/c/file.txt", "deep").is_ok())
  assert_true(fs.is_directory("/a"))
  assert_true(fs.is_directory("/a/b"))
  assert_true(fs.is_directory("/a/b/c"))
  assert_eq(fs.read_file("/a/b/c/file.txt"), FsResult::Ok("deep"))
}

test "MemoryFs path parsing" {
  let fs = MemoryFs::new()

  // Various path formats should work
  fs.write_file("simple.txt", "a") |> ignore
  fs.write_file("/absolute.txt", "b") |> ignore
  fs.write_file("dir/nested.txt", "c") |> ignore

  assert_true(fs.exists("simple.txt"))
  assert_true(fs.exists("/absolute.txt"))
  assert_true(fs.exists("/dir/nested.txt"))
}

test "DocumentStore basic operations" {
  let fs = MemoryFs::new()
  let store : DocumentStore[MemoryFs] = DocumentStore::new(fs)

  // Open document with content
  let doc = store.open(
    "file:///test.mbt",
    "moonbit",
    1,
    Some("fn main {}"),
  )
  assert_true(doc is Some(_))

  // Get document
  match store.get("file:///test.mbt") {
    Some(d) => {
      assert_eq(d.get_content(), "fn main {}")
      assert_eq(d.get_version(), 1)
    }
    None => fail("expected document")
  }

  // Update document
  assert_true(store.update("file:///test.mbt", 2, "fn main { println(\"hello\") }"))
  match store.get("file:///test.mbt") {
    Some(d) => {
      assert_eq(d.get_version(), 2)
      assert_true(d.get_content().contains("hello"))
    }
    None => fail("expected document")
  }

  // Close document
  store.close("file:///test.mbt")
  assert_true(store.get("file:///test.mbt") is None)
}

test "DocumentStore with filesystem" {
  let fs = MemoryFs::new()
  fs.write_file("/project/main.mbt", "fn main {}") |> ignore

  let store : DocumentStore[MemoryFs] = DocumentStore::new(fs)

  // Open document from filesystem (no content provided)
  let doc = store.open("file:///project/main.mbt", "moonbit", 1, None)
  assert_true(doc is Some(_))
  match doc {
    Some(d) => assert_eq(d.get_content(), "fn main {}")
    None => fail("expected document")
  }

  // Save document back to filesystem
  store.update("file:///project/main.mbt", 2, "fn main { let x = 1 }") |> ignore
  assert_true(store.save("file:///project/main.mbt").is_ok())

  // Verify filesystem was updated
  assert_eq(fs.read_file("/project/main.mbt"), FsResult::Ok("fn main { let x = 1 }"))
}

test "DocumentStore list_open" {
  let fs = MemoryFs::new()
  let store : DocumentStore[MemoryFs] = DocumentStore::new(fs)

  store.open("file:///a.mbt", "moonbit", 1, Some("a")) |> ignore
  store.open("file:///b.mbt", "moonbit", 1, Some("b")) |> ignore
  store.open("file:///c.mbt", "moonbit", 1, Some("c")) |> ignore

  let open = store.list_open()
  assert_eq(open.length(), 3)
}

test "path_to_uri conversion" {
  assert_eq(path_to_uri("/project/main.mbt"), "file:///project/main.mbt")
  assert_eq(path_to_uri("file:///already/uri"), "file:///already/uri")
}
