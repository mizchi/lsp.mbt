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
  let result = decoder.decode!()
  match result {
    Some(r) => {
      match r.message {
        Message::Request(req) => {
          assert_eq(req.method, "test")
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
  let result = decoder.decode!()
  assert_true(result.is_empty())
}

test "dispatcher handles request" {
  let dispatcher = Dispatcher::new()
  dispatcher.on_request("echo", fn(req) {
    Response::ok(req.id, req.params.or(@json.JsonValue::Null))
  })

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

  assert_true(response.is_empty())
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
  let parsed = Request::from_json!(json)
  assert_eq(parsed.method, req.method)
  assert_eq(parsed.id, req.id)
}

test "response serialization roundtrip" {
  let resp = Response::ok(
    Some(RequestId::Number(42)),
    @json.JsonValue::Array([@json.JsonValue::int(1), @json.JsonValue::int(2)])
  )
  let json = resp.to_json()
  let parsed = Response::from_json!(json)
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
  let parsed = Response::from_json!(json)
  assert_false(parsed.is_success())
  match parsed.error {
    Some(e) => {
      assert_eq(e.code, error_invalid_params())
      assert_eq(e.message, "Invalid parameters")
    }
    None => fail("expected error")
  }
}
