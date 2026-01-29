# mizchi/lsp

LSP (Language Server Protocol) implementation for MoonBit.

## Packages

| Package | Description |
|---------|-------------|
| `mizchi/lsp/json` | JSON parser and serializer |
| `mizchi/lsp/jsonrpc` | JSON-RPC 2.0 codec |
| `mizchi/lsp/types` | LSP type definitions (auto-generated) |
| `mizchi/lsp/server` | LSP server framework |
| `mizchi/lsp/client` | LSP client framework |
| `mizchi/lsp/fs` | Filesystem abstraction (real/in-memory) |

## Installation

```bash
moon add mizchi/lsp
```

## Usage

### LSP Client

Connect to an external LSP server and receive diagnostics.

```moonbit
// Import packages
// "mizchi/lsp/client"
// "mizchi/lsp/json"

// 1. Implement Transport trait for your platform
pub struct MyTransport {
  // Platform-specific fields (process handle, stdio, etc.)
}

pub impl @client.Transport for MyTransport with read(self) {
  // Read from LSP server stdout
  // Return @client.ReadResult::Data(data) or ::Eof or ::Error(msg)
}

pub impl @client.Transport for MyTransport with write(self, data) {
  // Write to LSP server stdin
}

// 2. Create client and connect
fn main {
  let config = @client.ClientConfig::{
    root_uri: "file:///path/to/project",
    process_id: 1234,
  }
  let client = @client.Client::new(config)
  let transport = MyTransport::new()

  // Register notification handler for diagnostics
  client.on_notification("textDocument/publishDiagnostics", fn(params) {
    match params {
      Some(@json.JsonValue::Object(obj)) => {
        // Handle diagnostics
        println(obj.to_json().stringify())
      }
      _ => ()
    }
  })

  // Initialize
  client.initialize(transport, fn(resp) {
    println("Initialized!")
  })

  // Process server responses
  client.tick(transport)

  // Send initialized notification
  client.send_initialized(transport)

  // Open a document
  client.open_document(
    transport,
    "file:///path/to/file.mbt",
    "moonbit",
    1,
    "fn main { }",
  )

  // Keep processing messages
  while client.tick(transport) {
    // Handle incoming notifications
  }

  // Shutdown
  client.shutdown(transport, fn(_) { })
  client.tick(transport)
  client.exit(transport)
}
```

### LSP Server

Build an LSP server that responds to client requests.

```moonbit
// Import packages
// "mizchi/lsp/server"
// "mizchi/lsp/jsonrpc"

// 1. Implement IoHandler trait for your platform
pub struct MyIoHandler {
  // Platform-specific fields (stdio, socket, etc.)
}

pub impl @server.IoHandler for MyIoHandler with read(self) {
  // Read from client
  // Return @server.ReadResult::Data(data) or ::Eof or ::Error(msg)
}

pub impl @server.IoHandler for MyIoHandler with write(self, data) {
  // Write to client stdout
}

pub impl @server.IoHandler for MyIoHandler with write_error(self, data) {
  // Write to client stderr
}

// 2. Create server and register handlers
fn main {
  let config = @server.ServerConfig::{
    name: "my-lsp-server",
    version: "0.1.0",
  }
  let server = @server.Server::new(config)
  let io = MyIoHandler::new()

  // Register request handlers
  server.on_request("initialize", fn(req) {
    let capabilities = { ... }
    @jsonrpc.Response::ok(req.id, capabilities)
  })

  server.on_request("textDocument/hover", fn(req) {
    // Handle hover request
    @jsonrpc.Response::ok(req.id, hover_result)
  })

  // Register notification handlers
  server.on_notification("textDocument/didOpen", fn(req) {
    // Handle document open
  })

  // Run the server
  server.run(io)
}
```

### Testing with Stub Implementations

Both client and server provide stub implementations for testing.

```moonbit
test "client with stub transport" {
  let config = @client.ClientConfig::{
    root_uri: "file:///test",
    process_id: 1,
  }
  let client = @client.Client::new(config)
  let transport = @client.StubTransport::new()

  // Send request
  client.initialize(transport, fn(_) { })

  // Verify output
  let output = transport.get_output()
  assert_true(output[0].contains("initialize"))

  // Simulate server response
  let response = "{\"jsonrpc\":\"2.0\",\"id\":1,\"result\":{}}"
  transport.push_input("Content-Length: \{response.length()}\r\n\r\n\{response}")

  // Process
  client.tick(transport)
}

test "server with stub io" {
  let config = @server.ServerConfig::{
    name: "test",
    version: "0.1.0",
  }
  let server = @server.Server::new(config)
  let io = @server.StubIoHandler::new()

  server.on_request("test/ping", fn(req) {
    @jsonrpc.Response::ok(req.id, @json.JsonValue::String("pong"))
  })

  // Feed a request
  let message = "{\"jsonrpc\":\"2.0\",\"id\":1,\"method\":\"test/ping\"}"
  server.feed(io, "Content-Length: \{message.length()}\r\n\r\n\{message}")

  // Check response
  let output = io.get_output()
  assert_true(output[0].contains("pong"))
}
```

## Filesystem Abstraction

The `fs` package provides a `FileSystem` trait for platform-independent file operations.

```moonbit
// "mizchi/lsp/fs"

// Use in-memory filesystem for testing/WASM
let fs = @fs.MemoryFs::new()

// Basic file operations
fs.write_file("/project/main.mbt", "fn main {}")
fs.read_file("/project/main.mbt")  // FsResult::Ok("fn main {}")
fs.exists("/project/main.mbt")     // true
fs.is_file("/project/main.mbt")    // true

// Directory operations
fs.create_dir("/project/src")
fs.read_dir("/project")            // Array of DirEntry

// Implement FileSystem trait for real filesystem
pub struct RealFs { }

pub impl @fs.FileSystem for RealFs with read_file(self, path) {
  // Platform-specific file read
}

pub impl @fs.FileSystem for RealFs with write_file(self, path, content) {
  // Platform-specific file write
}
// ... other methods
```

### DocumentStore

Manage open documents backed by a filesystem.

```moonbit
let fs = @fs.MemoryFs::new()
let store = @fs.DocumentStore::new(fs)

// Open document from filesystem
store.open("file:///project/main.mbt", "moonbit", 1, None)

// Open document with content (skip filesystem read)
store.open("file:///new.mbt", "moonbit", 1, Some("fn test {}"))

// Update and save
store.update("file:///new.mbt", 2, "fn test { let x = 1 }")
store.save("file:///new.mbt")  // Write back to filesystem

// List open documents
store.list_open()  // ["file:///project/main.mbt", "file:///new.mbt"]
```

## Platform-specific Implementation

The `Transport` (client), `IoHandler` (server), and `FileSystem` (fs) traits abstract platform-specific operations:

| Platform | Transport/IoHandler | FileSystem |
|----------|---------------------|------------|
| Native | Process spawn + stdio | OS file system |
| JS/Node | `child_process.spawn` via FFI | Node `fs` via FFI |
| WASM | `StubTransport`/`StubIoHandler` | `MemoryFs` |

## JSON-RPC Low-level API

```moonbit
// Encode request
let request = @jsonrpc.Request::new(
  "textDocument/hover",
  params=Some(params_json),
  id=Some(@jsonrpc.RequestId::Number(1)),
)
let encoded = @jsonrpc.encode_request(request)

// Decode response
let decoder = @jsonrpc.Decoder::new()
decoder.push(data)
match decoder.decode() {
  Some(result) => {
    match result.message {
      @jsonrpc.Message::Response(resp) => { ... }
      @jsonrpc.Message::Request(req) => { ... }
    }
  }
  None => ()
}
```

## LSP Types

Auto-generated from LSP specification. See `types/generated.mbt` for all types.

```moonbit
// Position, Range, Location
let pos = @types.Position::{ line: 0, character: 5 }
let range = @types.Range::{ start: pos, end: pos }

// Diagnostic
let diag = @types.Diagnostic::{
  range,
  message: "Error message",
  severity: Some(@types.DiagnosticSeverity::Error),
  // ...
}
```

## Development

```bash
# Run tests
moon test

# Generate LSP types from specification
cd codegen && pnpm install && pnpm run generate

# Format code
moon fmt
```

## License

Apache-2.0
