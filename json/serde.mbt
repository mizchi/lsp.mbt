///| JSON serialization/deserialization traits

///|
/// Error type for JSON operations
pub(all) suberror JsonError {
  JsonError(String)
}

///|
/// Create a JSON error
pub fn json_error(msg : String) -> JsonError {
  JsonError(msg)
}

///|
/// Trait for types that can be converted to JSON
pub(open) trait ToJson {
  fn to_json(Self) -> JsonValue
}

///|
/// Trait for types that can be parsed from JSON
pub(open) trait FromJson {
  fn from_json(JsonValue) -> Self raise JsonError
}

// Implementations for primitive types

///|
pub impl ToJson for Bool with fn to_json(self) {
  JsonValue::Bool(self)
}

///|
pub impl FromJson for Bool with fn from_json(json) {
  match json {
    JsonValue::Bool(b) => b
    _ => raise JsonError("expected bool")
  }
}

///|
pub impl ToJson for Int with fn to_json(self) {
  JsonValue::Number(self.to_double())
}

///|
pub impl FromJson for Int with fn from_json(json) {
  match json {
    JsonValue::Number(n) => n.to_int()
    _ => raise JsonError("expected number")
  }
}

///|
pub impl ToJson for UInt with fn to_json(self) {
  JsonValue::Number(self.reinterpret_as_int().to_double())
}

///|
pub impl FromJson for UInt with fn from_json(json) {
  match json {
    JsonValue::Number(n) => n.to_int().reinterpret_as_uint()
    _ => raise JsonError("expected number")
  }
}

///|
pub impl ToJson for Double with fn to_json(self) {
  JsonValue::Number(self)
}

///|
pub impl FromJson for Double with fn from_json(json) {
  match json {
    JsonValue::Number(n) => n
    _ => raise JsonError("expected number")
  }
}

///|
pub impl ToJson for String with fn to_json(self) {
  JsonValue::String(self)
}

///|
pub impl FromJson for String with fn from_json(json) {
  match json {
    JsonValue::String(s) => s
    _ => raise JsonError("expected string")
  }
}

///|
pub impl[T : ToJson] ToJson for Array[T] with fn to_json(self) {
  let arr : Array[JsonValue] = []
  for item in self {
    arr.push(item.to_json())
  }
  JsonValue::Array(arr)
}

///|
pub impl[T : FromJson] FromJson for Array[T] with fn from_json(json) {
  match json {
    JsonValue::Array(arr) => {
      let result : Array[T] = []
      for item in arr {
        result.push(T::from_json(item))
      }
      result
    }
    _ => raise JsonError("expected array")
  }
}

///|
pub impl[T : ToJson] ToJson for T? with fn to_json(self) {
  match self {
    Some(v) => v.to_json()
    None => JsonValue::Null
  }
}

///|
pub impl[T : FromJson] FromJson for T? with fn from_json(json) {
  match json {
    JsonValue::Null => None
    _ => Some(T::from_json(json))
  }
}

///|
pub impl ToJson for JsonValue with fn to_json(self) {
  self
}

///|
pub impl FromJson for JsonValue with fn from_json(json) {
  json
}
