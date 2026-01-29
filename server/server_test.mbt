///| Server module tests

test "StubIoHandler basic operations" {
  let io = StubIoHandler::new()

  // Initially empty
  assert_eq(io.read(), ReadResult::Eof)

  // Push input and read it back
  io.push_input("hello")
  io.push_input("world")

  assert_eq(io.read(), ReadResult::Data("hello"))
  assert_eq(io.read(), ReadResult::Data("world"))
  assert_eq(io.read(), ReadResult::Eof)

  // Test output
  io.write("output1")
  io.write("output2")
  assert_eq(io.get_output().length(), 2)

  // Test error output
  io.write_error("error1")
  assert_eq(io.get_errors().length(), 1)
}

test "Server creation" {
  let config = ServerConfig::{ name: "test-server", version: "0.1.0" }
  let server = Server::new(config)
  assert_eq(server.config.name, "test-server")
  assert_eq(server.config.version, "0.1.0")
}

test "Server request handler registration" {
  let config = ServerConfig::{ name: "test", version: "0.1.0" }
  let server = Server::new(config)

  server.on_request("test/echo", fn(req) {
    @jsonrpc.Response::ok(req.id, req.params.unwrap_or(@json.JsonValue::Null))
  })

  // Process a request
  let request = @jsonrpc.Request::new(
    "test/echo",
    params=Some(@json.JsonValue::String("hello")),
    id=Some(@jsonrpc.RequestId::Number(1))
  )
  let response = server.process_message(@jsonrpc.Message::Request(request))

  assert_true(response is Some(_))
  match response {
    Some(resp) => {
      assert_true(resp.is_success())
      assert_eq(resp.result, Some(@json.JsonValue::String("hello")))
    }
    None => fail("expected response")
  }
}

test "Server notification handler" {
  let config = ServerConfig::{ name: "test", version: "0.1.0" }
  let server = Server::new(config)
  let mut called = false

  server.on_notification("test/notify", fn(_req) {
    called = true
  })

  // Process a notification (no id)
  let notification = @jsonrpc.Request::new("test/notify")
  let response = server.process_message(@jsonrpc.Message::Request(notification))

  assert_true(response is None)
  assert_true(called)
}

test "Server feed with StubIoHandler" {
  let config = ServerConfig::{ name: "test", version: "0.1.0" }
  let server = Server::new(config)
  let io = StubIoHandler::new()

  server.on_request("test/ping", fn(req) {
    @jsonrpc.Response::ok(req.id, @json.JsonValue::String("pong"))
  })

  // Feed a complete message
  let message = "{\"jsonrpc\":\"2.0\",\"id\":1,\"method\":\"test/ping\"}"
  let data = "Content-Length: \{message.length()}\r\n\r\n\{message}"
  server.feed(io, data)

  // Check output
  let output = io.get_output()
  assert_eq(output.length(), 1)
  assert_true(output[0].contains("pong"))
}

test "Server multiple requests" {
  let config = ServerConfig::{ name: "test", version: "0.1.0" }
  let server = Server::new(config)
  let io = StubIoHandler::new()
  let call_count : Ref[Int] = { val: 0 }

  server.on_request("test/count", fn(req) {
    call_count.val = call_count.val + 1
    @jsonrpc.Response::ok(req.id, @json.JsonValue::Number(call_count.val.to_double()))
  })

  let msg1 = "{\"jsonrpc\":\"2.0\",\"id\":1,\"method\":\"test/count\"}"
  let msg2 = "{\"jsonrpc\":\"2.0\",\"id\":2,\"method\":\"test/count\"}"

  server.feed(io, "Content-Length: \{msg1.length()}\r\n\r\n\{msg1}")
  server.feed(io, "Content-Length: \{msg2.length()}\r\n\r\n\{msg2}")

  assert_eq(call_count.val, 2)
  assert_eq(io.get_output().length(), 2)
}

test "Server notification no response" {
  let config = ServerConfig::{ name: "test", version: "0.1.0" }
  let server = Server::new(config)
  let io = StubIoHandler::new()
  let notified : Ref[Bool] = { val: false }

  server.on_notification("test/notify", fn(_req) {
    notified.val = true
  })

  // Notification has no id
  let message = "{\"jsonrpc\":\"2.0\",\"method\":\"test/notify\"}"
  server.feed(io, "Content-Length: \{message.length()}\r\n\r\n\{message}")

  assert_true(notified.val)
  // Notifications should not produce responses
  assert_eq(io.get_output().length(), 0)
}

test "Server method not found response" {
  let config = ServerConfig::{ name: "test", version: "0.1.0" }
  let server = Server::new(config)
  let io = StubIoHandler::new()

  let message = "{\"jsonrpc\":\"2.0\",\"id\":1,\"method\":\"unknown/method\"}"
  server.feed(io, "Content-Length: \{message.length()}\r\n\r\n\{message}")

  let output = io.get_output()
  assert_eq(output.length(), 1)
  assert_true(output[0].contains("error"))
  assert_true(output[0].contains("-32601"))  // method not found
}

test "Server with params" {
  let config = ServerConfig::{ name: "test", version: "0.1.0" }
  let server = Server::new(config)
  let io = StubIoHandler::new()

  server.on_request("test/add", fn(req) {
    match req.params {
      Some(@json.JsonValue::Object(obj)) => {
        let a = match obj.get("a") {
          Some(@json.JsonValue::Number(n)) => n.to_int()
          _ => 0
        }
        let b = match obj.get("b") {
          Some(@json.JsonValue::Number(n)) => n.to_int()
          _ => 0
        }
        @jsonrpc.Response::ok(req.id, @json.JsonValue::Number((a + b).to_double()))
      }
      _ => @jsonrpc.Response::ok(req.id, @json.JsonValue::Number(0.0))
    }
  })

  let message = "{\"jsonrpc\":\"2.0\",\"id\":1,\"method\":\"test/add\",\"params\":{\"a\":3,\"b\":5}}"
  server.feed(io, "Content-Length: \{message.length()}\r\n\r\n\{message}")

  let output = io.get_output()
  assert_true(output[0].contains("8"))
}
