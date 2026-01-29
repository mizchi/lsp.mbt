///| JSON parser implementation

///| Parser state
priv struct Parser {
  input : String
  mut pos : Int
}

///|
fn Parser::new(input : String) -> Parser {
  Parser::{ input, pos: 0 }
}

///|
fn Parser::peek(self : Parser) -> Char? {
  if self.pos >= self.input.length() {
    None
  } else {
    Some(self.input[self.pos].to_int().unsafe_to_char())
  }
}

///|
fn Parser::advance(self : Parser) -> Char? {
  match self.peek() {
    Some(c) => {
      self.pos += 1
      Some(c)
    }
    None => None
  }
}

///|
fn Parser::skip_whitespace(self : Parser) -> Unit {
  while {
    match self.peek() {
      Some(' ') | Some('\t') | Some('\n') | Some('\r') => true
      _ => false
    }
  } {
    let _ = self.advance()
  }
}

///|
fn Parser::expect(self : Parser, c : Char) -> Unit raise JsonError {
  match self.advance() {
    Some(ch) if ch == c => ()
    _ => raise JsonError("expected '\{c}'")
  }
}

///| Parse a JSON value from string
pub fn parse(input : String) -> JsonValue raise JsonError {
  let parser = Parser::new(input)
  let value = parser.parse_value()
  parser.skip_whitespace()
  if parser.peek() != None {
    raise JsonError("unexpected trailing content")
  }
  value
}

///|
fn Parser::parse_value(self : Parser) -> JsonValue raise JsonError {
  self.skip_whitespace()
  match self.peek() {
    None => raise JsonError("unexpected end of input")
    Some('n') => self.parse_null()
    Some('t') => self.parse_true()
    Some('f') => self.parse_false()
    Some('"') => self.parse_string()
    Some('[') => self.parse_array()
    Some('{') => self.parse_object()
    Some(c) =>
      if c == '-' || (c >= '0' && c <= '9') {
        self.parse_number()
      } else {
        raise JsonError("unexpected character: '\{c}'")
      }
  }
}

///|
fn Parser::parse_null(self : Parser) -> JsonValue raise JsonError {
  self.expect('n')
  self.expect('u')
  self.expect('l')
  self.expect('l')
  JsonValue::Null
}

///|
fn Parser::parse_true(self : Parser) -> JsonValue raise JsonError {
  self.expect('t')
  self.expect('r')
  self.expect('u')
  self.expect('e')
  JsonValue::Bool(true)
}

///|
fn Parser::parse_false(self : Parser) -> JsonValue raise JsonError {
  self.expect('f')
  self.expect('a')
  self.expect('l')
  self.expect('s')
  self.expect('e')
  JsonValue::Bool(false)
}

///|
fn Parser::parse_string(self : Parser) -> JsonValue raise JsonError {
  self.expect('"')
  let buf = StringBuilder::new()
  while {
    match self.peek() {
      Some('"') => false
      Some(_) => true
      None => raise JsonError("unterminated string")
    }
  } {
    match self.advance() {
      Some('\\') =>
        match self.advance() {
          Some('"') => buf.write_char('"')
          Some('\\') => buf.write_char('\\')
          Some('/') => buf.write_char('/')
          Some('b') => buf.write_char('\u0008')
          Some('f') => buf.write_char('\u000C')
          Some('n') => buf.write_char('\n')
          Some('r') => buf.write_char('\r')
          Some('t') => buf.write_char('\t')
          Some('u') => {
            let code = self.parse_hex4()
            buf.write_char(code.unsafe_to_char())
          }
          _ => raise JsonError("invalid escape sequence")
        }
      Some(c) => buf.write_char(c)
      None => raise JsonError("unterminated string")
    }
  }
  self.expect('"')
  JsonValue::String(buf.to_string())
}

///|
fn Parser::parse_hex4(self : Parser) -> Int raise JsonError {
  let mut result = 0
  for i = 0; i < 4; i = i + 1 {
    match self.advance() {
      Some(c) => {
        let digit = if c >= '0' && c <= '9' {
          c.to_int() - '0'.to_int()
        } else if c >= 'a' && c <= 'f' {
          c.to_int() - 'a'.to_int() + 10
        } else if c >= 'A' && c <= 'F' {
          c.to_int() - 'A'.to_int() + 10
        } else {
          raise JsonError("invalid hex digit")
        }
        result = (result << 4) | digit
      }
      None => raise JsonError("unexpected end in unicode escape")
    }
  }
  result
}

///|
fn Parser::parse_number(self : Parser) -> JsonValue raise JsonError {
  let start = self.pos
  // Optional minus
  if self.peek() == Some('-') {
    let _ = self.advance()
  }
  // Integer part
  match self.peek() {
    Some('0') => {
      let _ = self.advance()
    }
    Some(c) if c >= '1' && c <= '9' => {
      let _ = self.advance()
      while {
        match self.peek() {
          Some(c) => c >= '0' && c <= '9'
          None => false
        }
      } {
        let _ = self.advance()
      }
    }
    _ => raise JsonError("invalid number")
  }
  // Fraction
  if self.peek() == Some('.') {
    let _ = self.advance()
    let mut has_digit = false
    while {
      match self.peek() {
        Some(c) => c >= '0' && c <= '9'
        None => false
      }
    } {
      let _ = self.advance()
      has_digit = true
    }
    if not(has_digit) {
      raise JsonError("invalid number: no digits after decimal point")
    }
  }
  // Exponent
  match self.peek() {
    Some('e') | Some('E') => {
      let _ = self.advance()
      match self.peek() {
        Some('+') | Some('-') => {
          let _ = self.advance()
        }
        _ => ()
      }
      let mut has_digit = false
      while {
        match self.peek() {
          Some(c) => c >= '0' && c <= '9'
          None => false
        }
      } {
        let _ = self.advance()
        has_digit = true
      }
      if not(has_digit) {
        raise JsonError("invalid number: no digits in exponent")
      }
    }
    _ => ()
  }
  let text = try {
    self.input[start:self.pos].to_string()
  } catch {
    _ => raise JsonError("invalid number substring")
  }
  try {
    let n = @strconv.parse_double(text)
    JsonValue::Number(n)
  } catch {
    _ => raise JsonError("invalid number: \{text}")
  }
}

///|
fn Parser::parse_array(self : Parser) -> JsonValue raise JsonError {
  self.expect('[')
  let arr : Array[JsonValue] = []
  self.skip_whitespace()
  if self.peek() == Some(']') {
    let _ = self.advance()
    return JsonValue::Array(arr)
  }
  arr.push(self.parse_value())
  while {
    self.skip_whitespace()
    self.peek() == Some(',')
  } {
    let _ = self.advance()
    arr.push(self.parse_value())
  }
  self.skip_whitespace()
  self.expect(']')
  JsonValue::Array(arr)
}

///|
fn Parser::parse_object(self : Parser) -> JsonValue raise JsonError {
  self.expect('{')
  let obj : Map[String, JsonValue] = {}
  self.skip_whitespace()
  if self.peek() == Some('}') {
    let _ = self.advance()
    return JsonValue::Object(obj)
  }
  // First key-value
  let (key, value) = self.parse_key_value()
  obj.set(key, value)
  while {
    self.skip_whitespace()
    self.peek() == Some(',')
  } {
    let _ = self.advance()
    let (key, value) = self.parse_key_value()
    obj.set(key, value)
  }
  self.skip_whitespace()
  self.expect('}')
  JsonValue::Object(obj)
}

///|
fn Parser::parse_key_value(self : Parser) -> (String, JsonValue) raise JsonError {
  self.skip_whitespace()
  let key = match self.parse_string() {
    JsonValue::String(s) => s
    _ => raise JsonError("expected string key")
  }
  self.skip_whitespace()
  self.expect(':')
  let value = self.parse_value()
  (key, value)
}
