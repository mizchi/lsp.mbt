///| JSON serialization/deserialization traits

///| Error type for JSON operations
pub(all) type! JsonError String

///| Create a JSON error
pub fn json_error(msg : String) -> JsonError {
  JsonError(msg)
}

///| Trait for types that can be converted to JSON
pub(open) trait ToJson {
  to_json(Self) -> JsonValue
}

///| Trait for types that can be parsed from JSON
pub(open) trait FromJson {
  from_json(JsonValue) -> Self!JsonError
}

// Implementations for primitive types

///|
pub impl ToJson for Bool with to_json(self) {
  JsonValue::Bool(self)
}

///|
pub impl FromJson for Bool with from_json(json) {
  match json {
    JsonValue::Bool(b) => b
    _ => raise JsonError("expected bool")
  }
}

///|
pub impl ToJson for Int with to_json(self) {
  JsonValue::Number(self.to_double())
}

///|
pub impl FromJson for Int with from_json(json) {
  match json {
    JsonValue::Number(n) => n.to_int()
    _ => raise JsonError("expected number")
  }
}

///|
pub impl ToJson for UInt with to_json(self) {
  JsonValue::Number(self.to_int().to_double())
}

///|
pub impl FromJson for UInt with from_json(json) {
  match json {
    JsonValue::Number(n) => n.to_int().reinterpret_as_uint()
    _ => raise JsonError("expected number")
  }
}

///|
pub impl ToJson for Double with to_json(self) {
  JsonValue::Number(self)
}

///|
pub impl FromJson for Double with from_json(json) {
  match json {
    JsonValue::Number(n) => n
    _ => raise JsonError("expected number")
  }
}

///|
pub impl ToJson for String with to_json(self) {
  JsonValue::String(self)
}

///|
pub impl FromJson for String with from_json(json) {
  match json {
    JsonValue::String(s) => s
    _ => raise JsonError("expected string")
  }
}

///|
pub impl[T : ToJson] ToJson for Array[T] with to_json(self) {
  let arr : Array[JsonValue] = []
  for item in self {
    arr.push(item.to_json())
  }
  JsonValue::Array(arr)
}

///|
pub impl[T : FromJson] FromJson for Array[T] with from_json(json) {
  match json {
    JsonValue::Array(arr) => {
      let result : Array[T] = []
      for item in arr {
        result.push(T::from_json!(item))
      }
      result
    }
    _ => raise JsonError("expected array")
  }
}

///|
pub impl[T : ToJson] ToJson for T? with to_json(self) {
  match self {
    Some(v) => v.to_json()
    None => JsonValue::Null
  }
}

///|
pub impl[T : FromJson] FromJson for T? with from_json(json) {
  match json {
    JsonValue::Null => None
    _ => Some(T::from_json!(json))
  }
}

///|
pub impl ToJson for JsonValue with to_json(self) {
  self
}

///|
pub impl FromJson for JsonValue with from_json(json) {
  json
}
