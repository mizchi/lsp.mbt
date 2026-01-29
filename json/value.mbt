///| JSON Value type

///| Represents a JSON value
pub(all) enum JsonValue {
  Null
  Bool(Bool)
  Number(Double)
  String(String)
  Array(Array[JsonValue])
  Object(Map[String, JsonValue])
} derive(Eq)

///|
pub impl Show for JsonValue with output(self, logger) {
  logger.write_string(stringify(self))
}

///| Create a null value
pub fn JsonValue::null() -> JsonValue {
  Null
}

///| Create a boolean value
pub fn JsonValue::bool(b : Bool) -> JsonValue {
  Bool(b)
}

///| Create a number value from Int
pub fn JsonValue::int(n : Int) -> JsonValue {
  Number(n.to_double())
}

///| Create a number value from Double
pub fn JsonValue::number(n : Double) -> JsonValue {
  Number(n)
}

///| Create a string value
pub fn JsonValue::string(s : String) -> JsonValue {
  String(s)
}

///| Create an array value
pub fn JsonValue::array(arr : Array[JsonValue]) -> JsonValue {
  Array(arr)
}

///| Create an object value
pub fn JsonValue::object(obj : Map[String, JsonValue]) -> JsonValue {
  Object(obj)
}

///| Check if value is null
pub fn JsonValue::is_null(self : JsonValue) -> Bool {
  match self {
    Null => true
    _ => false
  }
}

///| Get as boolean
pub fn JsonValue::as_bool(self : JsonValue) -> Bool? {
  match self {
    Bool(b) => Some(b)
    _ => None
  }
}

///| Get as number (Double)
pub fn JsonValue::as_number(self : JsonValue) -> Double? {
  match self {
    Number(n) => Some(n)
    _ => None
  }
}

///| Get as integer
pub fn JsonValue::as_int(self : JsonValue) -> Int? {
  match self {
    Number(n) => Some(n.to_int())
    _ => None
  }
}

///| Get as string
pub fn JsonValue::as_string(self : JsonValue) -> String? {
  match self {
    String(s) => Some(s)
    _ => None
  }
}

///| Get as array
pub fn JsonValue::as_array(self : JsonValue) -> Array[JsonValue]? {
  match self {
    Array(arr) => Some(arr)
    _ => None
  }
}

///| Get as object
pub fn JsonValue::as_object(self : JsonValue) -> Map[String, JsonValue]? {
  match self {
    Object(obj) => Some(obj)
    _ => None
  }
}

///| Get a field from an object
pub fn JsonValue::get(self : JsonValue, key : String) -> JsonValue? {
  match self {
    Object(obj) => obj.get(key)
    _ => None
  }
}

///| Get an element from an array
pub fn JsonValue::at(self : JsonValue, index : Int) -> JsonValue? {
  match self {
    Array(arr) =>
      if index >= 0 && index < arr.length() {
        Some(arr[index])
      } else {
        None
      }
    _ => None
  }
}
