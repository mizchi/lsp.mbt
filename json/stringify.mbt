///| JSON stringify implementation

///| Convert JsonValue to string
pub fn stringify(value : JsonValue) -> String {
  let buf = StringBuilder::new()
  write_value(value, buf)
  buf.to_string()
}

///|
fn write_value(value : JsonValue, buf : StringBuilder) -> Unit {
  match value {
    JsonValue::Null => buf.write_string("null")
    JsonValue::Bool(b) =>
      if b {
        buf.write_string("true")
      } else {
        buf.write_string("false")
      }
    JsonValue::Number(n) => buf.write_string(format_number(n))
    JsonValue::String(s) => write_string(s, buf)
    JsonValue::Array(arr) => write_array(arr, buf)
    JsonValue::Object(obj) => write_object(obj, buf)
  }
}

///|
fn format_number(n : Double) -> String {
  // Check if it's an integer
  let i = n.to_int()
  if i.to_double() == n {
    i.to_string()
  } else {
    n.to_string()
  }
}

///|
fn write_string(s : String, buf : StringBuilder) -> Unit {
  buf.write_char('"')
  for i = 0; i < s.length(); i = i + 1 {
    let c = s[i].to_int().unsafe_to_char()
    match c {
      '"' => buf.write_string("\\\"")
      '\\' => buf.write_string("\\\\")
      '\n' => buf.write_string("\\n")
      '\r' => buf.write_string("\\r")
      '\t' => buf.write_string("\\t")
      _ =>
        if c.to_int() < 32 {
          // Control character - escape as \uXXXX
          buf.write_string("\\u")
          buf.write_string(hex4(c.to_int()))
        } else {
          buf.write_char(c)
        }
    }
  }
  buf.write_char('"')
}

///|
fn hex4(n : Int) -> String {
  let hex = "0123456789abcdef"
  let chars : Array[Char] = [
    hex[(n >> 12) & 0xF].to_int().unsafe_to_char(),
    hex[(n >> 8) & 0xF].to_int().unsafe_to_char(),
    hex[(n >> 4) & 0xF].to_int().unsafe_to_char(),
    hex[n & 0xF].to_int().unsafe_to_char(),
  ]
  let buf = StringBuilder::new()
  for c in chars {
    buf.write_char(c)
  }
  buf.to_string()
}

///|
fn write_array(arr : Array[JsonValue], buf : StringBuilder) -> Unit {
  buf.write_char('[')
  for i, item in arr {
    if i > 0 {
      buf.write_char(',')
    }
    write_value(item, buf)
  }
  buf.write_char(']')
}

///|
fn write_object(obj : Map[String, JsonValue], buf : StringBuilder) -> Unit {
  buf.write_char('{')
  let mut first = true
  obj.each(fn(key, value) {
    if not(first) {
      buf.write_char(',')
    }
    first = false
    write_string(key, buf)
    buf.write_char(':')
    write_value(value, buf)
  })
  buf.write_char('}')
}

///| Pretty print JSON with indentation
pub fn stringify_pretty(value : JsonValue) -> String {
  let buf = StringBuilder::new()
  write_value_pretty(value, buf, 0)
  buf.to_string()
}

///|
fn write_value_pretty(value : JsonValue, buf : StringBuilder, indent : Int) -> Unit {
  match value {
    JsonValue::Null => buf.write_string("null")
    JsonValue::Bool(b) =>
      if b {
        buf.write_string("true")
      } else {
        buf.write_string("false")
      }
    JsonValue::Number(n) => buf.write_string(format_number(n))
    JsonValue::String(s) => write_string(s, buf)
    JsonValue::Array(arr) => write_array_pretty(arr, buf, indent)
    JsonValue::Object(obj) => write_object_pretty(obj, buf, indent)
  }
}

///|
fn write_indent(buf : StringBuilder, indent : Int) -> Unit {
  for i = 0; i < indent; i = i + 1 {
    buf.write_string("  ")
  }
}

///|
fn write_array_pretty(
  arr : Array[JsonValue],
  buf : StringBuilder,
  indent : Int
) -> Unit {
  if arr.is_empty() {
    buf.write_string("[]")
    return
  }
  buf.write_string("[\n")
  for i, item in arr {
    if i > 0 {
      buf.write_string(",\n")
    }
    write_indent(buf, indent + 1)
    write_value_pretty(item, buf, indent + 1)
  }
  buf.write_char('\n')
  write_indent(buf, indent)
  buf.write_char(']')
}

///|
fn write_object_pretty(
  obj : Map[String, JsonValue],
  buf : StringBuilder,
  indent : Int
) -> Unit {
  if obj.is_empty() {
    buf.write_string("{}")
    return
  }
  buf.write_string("{\n")
  let mut first = true
  obj.each(fn(key, value) {
    if not(first) {
      buf.write_string(",\n")
    }
    first = false
    write_indent(buf, indent + 1)
    write_string(key, buf)
    buf.write_string(": ")
    write_value_pretty(value, buf, indent + 1)
  })
  buf.write_char('\n')
  write_indent(buf, indent)
  buf.write_char('}')
}
