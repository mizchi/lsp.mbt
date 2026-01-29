///| JSON module tests

test "parse null" {
  let result = parse!("null")
  assert_eq(result, JsonValue::Null)
}

test "parse bool" {
  assert_eq(parse!("true"), JsonValue::Bool(true))
  assert_eq(parse!("false"), JsonValue::Bool(false))
}

test "parse number" {
  assert_eq(parse!("42"), JsonValue::Number(42.0))
  assert_eq(parse!("-3.14"), JsonValue::Number(-3.14))
}

test "parse string" {
  assert_eq(parse!("\"hello\""), JsonValue::String("hello"))
  assert_eq(parse!("\"hello\\nworld\""), JsonValue::String("hello\nworld"))
}

test "parse array" {
  let result = parse!("[1, 2, 3]")
  match result {
    JsonValue::Array(arr) => assert_eq(arr.length(), 3)
    _ => fail("expected array")
  }
}

test "parse object" {
  let result = parse!("{\"a\": 1, \"b\": 2}")
  match result {
    JsonValue::Object(obj) => {
      assert_eq(obj.size(), 2)
      assert_eq(obj.get("a"), Some(JsonValue::Number(1.0)))
    }
    _ => fail("expected object")
  }
}

test "stringify null" {
  assert_eq(stringify(JsonValue::Null), "null")
}

test "stringify bool" {
  assert_eq(stringify(JsonValue::Bool(true)), "true")
  assert_eq(stringify(JsonValue::Bool(false)), "false")
}

test "stringify number" {
  assert_eq(stringify(JsonValue::Number(42.0)), "42")
}

test "stringify string" {
  assert_eq(stringify(JsonValue::String("hello")), "\"hello\"")
}

test "stringify array" {
  let arr = JsonValue::Array([JsonValue::Number(1.0), JsonValue::Number(2.0)])
  assert_eq(stringify(arr), "[1,2]")
}

test "roundtrip" {
  let original = "{\"name\":\"test\",\"value\":123}"
  let parsed = parse!(original)
  let stringified = stringify(parsed)
  let reparsed = parse!(stringified)
  assert_eq(parsed, reparsed)
}
