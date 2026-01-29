///| JSON-RPC module tests

test "encode request" {
  let req = Request::new("test/method", params=Some(@json.JsonValue::int(42)), id=Some(RequestId::Number(1)))
  let encoded = encode_request(req)
  assert_true(encoded.contains("Content-Length:"))
  assert_true(encoded.contains("test/method"))
}

test "encode response" {
  let resp = Response::ok(Some(RequestId::Number(1)), @json.JsonValue::string("result"))
  let encoded = encode_response(resp)
  assert_true(encoded.contains("Content-Length:"))
  assert_true(encoded.contains("result"))
}

test "decode single message" {
  let decoder = Decoder::new()
  let msg = "Content-Length: 40\r\n\r\n{\"jsonrpc\":\"2.0\",\"id\":1,\"method\":\"test\"}"
  decoder.push(msg)
  let result = decoder.decode()
  match result {
    Some(r) => {
      match r.message {
        Message::Request(req) => {
          assert_eq(req.method_name, "test")
          assert_eq(req.id, Some(RequestId::Number(1)))
        }
        _ => fail("expected request")
      }
    }
    None => fail("expected message")
  }
}

test "decode incomplete message" {
  let decoder = Decoder::new()
  decoder.push("Content-Length: 100\r\n\r\n{\"jsonrpc\":")
  let result = decoder.decode()
  assert_true(result is None)
}

test "dispatcher handles request" {
  let dispatcher = Dispatcher::new()
  dispatcher.on_request("echo", Handler(fn(req) {
    Response::ok(req.id, req.params.unwrap_or(@json.JsonValue::Null))
  }))

  let req = Request::new("echo", params=Some(@json.JsonValue::string("hello")), id=Some(RequestId::Number(1)))
  let response = dispatcher.dispatch(Message::Request(req))

  match response {
    Some(resp) => {
      assert_true(resp.is_success())
      assert_eq(resp.result, Some(@json.JsonValue::string("hello")))
    }
    None => fail("expected response")
  }
}

test "dispatcher handles notification" {
  let dispatcher = Dispatcher::new()
  let mut called = false
  dispatcher.on_notification("notify", fn(_req) {
    called = true
  })

  let req = Request::new("notify")  // No id = notification
  let response = dispatcher.dispatch(Message::Request(req))

  assert_true(response is None)
  assert_true(called)
}

test "dispatcher method not found" {
  let dispatcher = Dispatcher::new()
  let req = Request::new("unknown", id=Some(RequestId::Number(1)))
  let response = dispatcher.dispatch(Message::Request(req))

  match response {
    Some(resp) => {
      assert_false(resp.is_success())
      match resp.error {
        Some(err) => assert_eq(err.code, error_method_not_found())
        None => fail("expected error")
      }
    }
    None => fail("expected response")
  }
}

test "request serialization roundtrip" {
  let req = Request::new(
    "test/method",
    params=Some(@json.JsonValue::Object({ "key": @json.JsonValue::string("value") })),
    id=Some(RequestId::String("abc"))
  )
  let json = req.to_json()
  let parsed = Request::from_json(json)
  assert_eq(parsed.method_name, req.method_name)
  assert_eq(parsed.id, req.id)
}

test "response serialization roundtrip" {
  let resp = Response::ok(
    Some(RequestId::Number(42)),
    @json.JsonValue::Array([@json.JsonValue::int(1), @json.JsonValue::int(2)])
  )
  let json = resp.to_json()
  let parsed = Response::from_json(json)
  assert_eq(parsed.id, resp.id)
  assert_true(parsed.is_success())
}

test "error response" {
  let err = ResponseError::new(
    error_invalid_params(),
    "Invalid parameters",
    data=Some(@json.JsonValue::string("details"))
  )
  let resp = Response::err(Some(RequestId::Number(1)), err)
  assert_false(resp.is_success())

  let json = resp.to_json()
  let parsed = Response::from_json(json)
  assert_false(parsed.is_success())
  match parsed.error {
    Some(e) => {
      assert_eq(e.code, error_invalid_params())
      assert_eq(e.message, "Invalid parameters")
    }
    None => fail("expected error")
  }
}

test "decode multiple messages" {
  let decoder = Decoder::new()
  let msg1 = "{\"jsonrpc\":\"2.0\",\"id\":1,\"method\":\"test1\"}"
  let msg2 = "{\"jsonrpc\":\"2.0\",\"id\":2,\"method\":\"test2\"}"
  let data = "Content-Length: \{msg1.length()}\r\n\r\n\{msg1}Content-Length: \{msg2.length()}\r\n\r\n\{msg2}"
  decoder.push(data)

  let result1 = decoder.decode()
  assert_true(result1 is Some(_))

  let result2 = decoder.decode()
  assert_true(result2 is Some(_))

  let result3 = decoder.decode()
  assert_true(result3 is None)
}

test "decode chunked message" {
  let decoder = Decoder::new()
  let msg = "{\"jsonrpc\":\"2.0\",\"id\":1,\"method\":\"test\"}"

  // Push header
  decoder.push("Content-Length: \{msg.length()}\r\n\r\n")
  assert_true(decoder.decode() is None)

  // Push body
  decoder.push(msg)
  let result = decoder.decode()
  assert_true(result is Some(_))
}

test "request id types" {
  // Number ID
  let req1 = Request::new("test", id=Some(RequestId::Number(42)))
  assert_eq(req1.id, Some(RequestId::Number(42)))

  // String ID
  let req2 = Request::new("test", id=Some(RequestId::String("abc-123")))
  assert_eq(req2.id, Some(RequestId::String("abc-123")))
}

test "standard error codes" {
  assert_eq(error_parse_error(), -32700)
  assert_eq(error_invalid_request(), -32600)
  assert_eq(error_method_not_found(), -32601)
  assert_eq(error_invalid_params(), -32602)
  assert_eq(error_internal_error(), -32603)
}

test "dispatcher multiple handlers" {
  let dispatcher = Dispatcher::new()
  let call_log : Array[String] = []

  dispatcher.on_request("method1", Handler(fn(req) {
    call_log.push("method1")
    Response::ok(req.id, @json.JsonValue::Null)
  }))

  dispatcher.on_request("method2", Handler(fn(req) {
    call_log.push("method2")
    Response::ok(req.id, @json.JsonValue::Null)
  }))

  let req1 = Request::new("method1", id=Some(RequestId::Number(1)))
  let req2 = Request::new("method2", id=Some(RequestId::Number(2)))

  dispatcher.dispatch(Message::Request(req1)) |> ignore
  dispatcher.dispatch(Message::Request(req2)) |> ignore

  assert_eq(call_log.length(), 2)
  assert_eq(call_log[0], "method1")
  assert_eq(call_log[1], "method2")
}

test "response to message dispatch" {
  let dispatcher = Dispatcher::new()
  let resp = Response::ok(Some(RequestId::Number(1)), @json.JsonValue::Null)

  // Dispatching a response should return None (responses are not handled)
  let result = dispatcher.dispatch(Message::Response(resp))
  assert_true(result is None)
}
