///| JSON module tests

test "parse null" {
  let result = parse("null")
  assert_eq(result, JsonValue::Null)
}

test "parse bool" {
  assert_eq(parse("true"), JsonValue::Bool(true))
  assert_eq(parse("false"), JsonValue::Bool(false))
}

test "parse number" {
  assert_eq(parse("42"), JsonValue::Number(42.0))
  assert_eq(parse("-3.14"), JsonValue::Number(-3.14))
}

test "parse string" {
  assert_eq(parse("\"hello\""), JsonValue::String("hello"))
  assert_eq(parse("\"hello\\nworld\""), JsonValue::String("hello\nworld"))
}

test "parse array" {
  let result = parse("[1, 2, 3]")
  match result {
    JsonValue::Array(arr) => assert_eq(arr.length(), 3)
    _ => fail("expected array")
  }
}

test "parse object" {
  let result = parse("{\"a\": 1, \"b\": 2}")
  match result {
    JsonValue::Object(obj) => {
      assert_eq(obj.length(), 2)
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
  let parsed = parse(original)
  let stringified = stringify(parsed)
  let reparsed = parse(stringified)
  assert_eq(parsed, reparsed)
}

test "parse nested object" {
  let result = parse("{\"outer\":{\"inner\":{\"value\":42}}}")
  match result {
    JsonValue::Object(obj) => {
      match obj.get("outer") {
        Some(JsonValue::Object(outer)) => {
          match outer.get("inner") {
            Some(JsonValue::Object(inner)) => {
              assert_eq(inner.get("value"), Some(JsonValue::Number(42.0)))
            }
            _ => fail("expected inner object")
          }
        }
        _ => fail("expected outer object")
      }
    }
    _ => fail("expected object")
  }
}

test "parse nested array" {
  let result = parse("[[1,2],[3,4]]")
  match result {
    JsonValue::Array(arr) => {
      assert_eq(arr.length(), 2)
      match arr[0] {
        JsonValue::Array(inner) => assert_eq(inner.length(), 2)
        _ => fail("expected inner array")
      }
    }
    _ => fail("expected array")
  }
}

test "parse escape sequences" {
  assert_eq(parse("\"\\t\""), JsonValue::String("\t"))
  assert_eq(parse("\"\\r\""), JsonValue::String("\r"))
  assert_eq(parse("\"\\\\\""), JsonValue::String("\\"))
  assert_eq(parse("\"\\\"\""), JsonValue::String("\""))
}

test "parse whitespace handling" {
  let result = parse("  {  \"a\"  :  1  }  ")
  match result {
    JsonValue::Object(obj) => {
      assert_eq(obj.get("a"), Some(JsonValue::Number(1.0)))
    }
    _ => fail("expected object")
  }
}

test "stringify object" {
  let obj : Map[String, JsonValue] = {}
  obj.set("name", JsonValue::String("test"))
  obj.set("value", JsonValue::Number(42.0))
  let result = stringify(JsonValue::Object(obj))
  assert_true(result.contains("\"name\":\"test\""))
  assert_true(result.contains("\"value\":42"))
}

test "stringify nested" {
  let inner = JsonValue::Array([JsonValue::Number(1.0)])
  let outer = JsonValue::Array([inner])
  assert_eq(stringify(outer), "[[1]]")
}

test "stringify escape" {
  assert_eq(stringify(JsonValue::String("a\nb")), "\"a\\nb\"")
  assert_eq(stringify(JsonValue::String("a\tb")), "\"a\\tb\"")
}

test "parse empty array" {
  let result = parse("[]")
  match result {
    JsonValue::Array(arr) => assert_eq(arr.length(), 0)
    _ => fail("expected empty array")
  }
}

test "parse empty object" {
  let result = parse("{}")
  match result {
    JsonValue::Object(obj) => assert_eq(obj.length(), 0)
    _ => fail("expected empty object")
  }
}
