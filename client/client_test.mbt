///| Client module tests

test "Client creation" {
  let config = ClientConfig::{ root_uri: "file:///test", process_id: 1234 }
  let client = Client::new(config)
  assert_eq(client.config.root_uri, "file:///test")
  assert_eq(client.config.process_id, 1234)
  assert_false(client.is_initialized())
}

test "Client initialize request" {
  let config = ClientConfig::{ root_uri: "file:///project", process_id: 42 }
  let client = Client::new(config)
  let (id, encoded) = client.create_initialize_request()
  assert_eq(id, 1)
  assert_true(encoded.contains("initialize"))
  assert_true(encoded.contains("Content-Length:"))
  assert_true(encoded.contains("processId"))
  assert_true(encoded.contains("rootUri"))
}

test "Client initialized notification" {
  let config = ClientConfig::{ root_uri: "file:///project", process_id: 42 }
  let client = Client::new(config)
  let encoded = client.create_initialized_notification()
  assert_true(encoded.contains("initialized"))
  assert_false(encoded.contains("\"id\""))
}

test "Client didOpen notification" {
  let config = ClientConfig::{ root_uri: "file:///project", process_id: 42 }
  let client = Client::new(config)
  let encoded = client.create_did_open_notification(
    "file:///project/test.mbt",
    "moonbit",
    1,
    "fn main { }",
  )
  assert_true(encoded.contains("textDocument/didOpen"))
  assert_true(encoded.contains("test.mbt"))
  assert_true(encoded.contains("moonbit"))
}

test "Client shutdown request" {
  let config = ClientConfig::{ root_uri: "file:///project", process_id: 42 }
  let client = Client::new(config)
  let (id, encoded) = client.create_shutdown_request()
  assert_eq(id, 1)
  assert_true(encoded.contains("shutdown"))
  assert_true(encoded.contains("\"id\":1"))
}

test "Client notification handler" {
  let config = ClientConfig::{ root_uri: "file:///project", process_id: 42 }
  let client = Client::new(config)
  let received_uri : Ref[String] = { val: "" }

  client.on_notification("textDocument/publishDiagnostics", fn(params) {
    match params {
      Some(@json.JsonValue::Object(obj)) => {
        match obj.get("uri") {
          Some(@json.JsonValue::String(uri)) => received_uri.val = uri
          _ => ()
        }
      }
      _ => ()
    }
  })

  // Simulate receiving a diagnostics notification
  let message = "{\"jsonrpc\":\"2.0\",\"method\":\"textDocument/publishDiagnostics\",\"params\":{\"uri\":\"file:///test.mbt\",\"diagnostics\":[]}}"
  let data = "Content-Length: \{message.length()}\r\n\r\n\{message}"
  client.feed(data)

  assert_eq(received_uri.val, "file:///test.mbt")
}

test "Client response handler" {
  let config = ClientConfig::{ root_uri: "file:///project", process_id: 42 }
  let client = Client::new(config)
  let response_received : Ref[Bool] = { val: false }

  // Register pending request
  client.register_pending(1, fn(_resp) {
    response_received.val = true
  })

  // Simulate receiving a response
  let message = "{\"jsonrpc\":\"2.0\",\"id\":1,\"result\":{\"capabilities\":{}}}"
  let data = "Content-Length: \{message.length()}\r\n\r\n\{message}"
  client.feed(data)

  assert_true(response_received.val)
}

test "Client request ID increment" {
  let config = ClientConfig::{ root_uri: "file:///project", process_id: 42 }
  let client = Client::new(config)

  let (id1, _) = client.create_initialize_request()
  let (id2, _) = client.create_shutdown_request()

  assert_eq(id1, 1)
  assert_eq(id2, 2)
}

test "StubTransport basic operations" {
  let transport = StubTransport::new()

  // Initially empty
  assert_eq(transport.read(), ReadResult::Eof)

  // Push input and read it back
  transport.push_input("hello")
  transport.push_input("world")

  assert_eq(transport.read(), ReadResult::Data("hello"))
  assert_eq(transport.read(), ReadResult::Data("world"))
  assert_eq(transport.read(), ReadResult::Eof)

  // Test output
  transport.write("output1")
  transport.write("output2")
  assert_eq(transport.get_output().length(), 2)
}

test "Client with StubTransport" {
  let config = ClientConfig::{ root_uri: "file:///project", process_id: 42 }
  let client = Client::new(config)
  let transport = StubTransport::new()
  let init_response_received : Ref[Bool] = { val: false }

  // Send initialize request
  client.initialize(transport, fn(_resp) {
    init_response_received.val = true
  })

  // Check that request was sent
  let output = transport.get_output()
  assert_eq(output.length(), 1)
  assert_true(output[0].contains("initialize"))

  // Simulate server response
  let response = "{\"jsonrpc\":\"2.0\",\"id\":1,\"result\":{\"capabilities\":{}}}"
  let data = "Content-Length: \{response.length()}\r\n\r\n\{response}"
  transport.push_input(data)

  // Process response
  client.tick(transport) |> ignore
  assert_true(init_response_received.val)
}

test "Client open document with transport" {
  let config = ClientConfig::{ root_uri: "file:///project", process_id: 42 }
  let client = Client::new(config)
  let transport = StubTransport::new()

  client.open_document(
    transport,
    "file:///project/test.mbt",
    "moonbit",
    1,
    "fn main { }",
  )

  let output = transport.get_output()
  assert_eq(output.length(), 1)
  assert_true(output[0].contains("textDocument/didOpen"))
  assert_true(output[0].contains("test.mbt"))
}

test "Client close document" {
  let config = ClientConfig::{ root_uri: "file:///project", process_id: 42 }
  let client = Client::new(config)
  let transport = StubTransport::new()

  client.close_document(transport, "file:///project/test.mbt")

  let output = transport.get_output()
  assert_eq(output.length(), 1)
  assert_true(output[0].contains("textDocument/didClose"))
}

test "Client shutdown and exit" {
  let config = ClientConfig::{ root_uri: "file:///project", process_id: 42 }
  let client = Client::new(config)
  let transport = StubTransport::new()
  let shutdown_received : Ref[Bool] = { val: false }

  client.shutdown(transport, fn(_resp) {
    shutdown_received.val = true
  })

  // Simulate shutdown response
  let response = "{\"jsonrpc\":\"2.0\",\"id\":1,\"result\":null}"
  transport.push_input("Content-Length: \{response.length()}\r\n\r\n\{response}")
  client.tick(transport) |> ignore

  assert_true(shutdown_received.val)

  // Send exit
  transport.clear_output()
  client.exit(transport)
  let output = transport.get_output()
  assert_true(output[0].contains("exit"))
}

test "Client multiple notifications" {
  let config = ClientConfig::{ root_uri: "file:///project", process_id: 42 }
  let client = Client::new(config)
  let notifications : Array[String] = []

  client.on_notification("window/logMessage", fn(params) {
    match params {
      Some(@json.JsonValue::Object(obj)) => {
        match obj.get("message") {
          Some(@json.JsonValue::String(msg)) => notifications.push(msg)
          _ => ()
        }
      }
      _ => ()
    }
  })

  let msg1 = "{\"jsonrpc\":\"2.0\",\"method\":\"window/logMessage\",\"params\":{\"message\":\"log1\"}}"
  let msg2 = "{\"jsonrpc\":\"2.0\",\"method\":\"window/logMessage\",\"params\":{\"message\":\"log2\"}}"

  client.feed("Content-Length: \{msg1.length()}\r\n\r\n\{msg1}")
  client.feed("Content-Length: \{msg2.length()}\r\n\r\n\{msg2}")

  assert_eq(notifications.length(), 2)
  assert_eq(notifications[0], "log1")
  assert_eq(notifications[1], "log2")
}

test "Client initialized state" {
  let config = ClientConfig::{ root_uri: "file:///project", process_id: 42 }
  let client = Client::new(config)
  let transport = StubTransport::new()

  assert_false(client.is_initialized())

  client.send_initialized(transport)

  assert_true(client.is_initialized())
}

test "Client tick returns false on eof" {
  let config = ClientConfig::{ root_uri: "file:///project", process_id: 42 }
  let client = Client::new(config)
  let transport = StubTransport::new()

  // No input, should return false
  let result = client.tick(transport)
  assert_false(result)
}

test "Client tick returns true on data" {
  let config = ClientConfig::{ root_uri: "file:///project", process_id: 42 }
  let client = Client::new(config)
  let transport = StubTransport::new()

  let msg = "{\"jsonrpc\":\"2.0\",\"method\":\"test\"}"
  transport.push_input("Content-Length: \{msg.length()}\r\n\r\n\{msg}")

  let result = client.tick(transport)
  assert_true(result)
}
