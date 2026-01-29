///| JSON-RPC codec - message framing for LSP
///|
///| LSP uses HTTP-like headers:
///|   Content-Length: <length>\r\n
///|   \r\n
///|   <json content>

///| Encode a message with Content-Length header
pub fn encode(message : Message) -> String {
  let json = @json.stringify(message.to_json())
  let content_length = json.length()
  "Content-Length: \{content_length}\r\n\r\n\{json}"
}

///| Encode a response with Content-Length header
pub fn encode_response(response : Response) -> String {
  let json = @json.stringify(response.to_json())
  let content_length = json.length()
  "Content-Length: \{content_length}\r\n\r\n\{json}"
}

///| Encode a request with Content-Length header
pub fn encode_request(request : Request) -> String {
  let json = @json.stringify(request.to_json())
  let content_length = json.length()
  "Content-Length: \{content_length}\r\n\r\n\{json}"
}

///| Parse result from decode
pub struct DecodeResult {
  message : Message
  consumed : Int  // bytes consumed from input
}

///| Decoder state
pub struct Decoder {
  mut buffer : String
}

///|
pub fn Decoder::new() -> Decoder {
  Decoder::{ buffer: "" }
}

///|
pub fn Decoder::push(self : Decoder, data : String) -> Unit {
  self.buffer = self.buffer + data
}

///| Try to decode a complete message from the buffer
pub fn Decoder::decode(self : Decoder) -> DecodeResult? raise @json.JsonError {
  // Find header end
  let header_end = find_header_end(self.buffer)
  guard header_end >= 0 else { return None }

  // Parse Content-Length from header
  let header = try {
    self.buffer[0:header_end].to_string()
  } catch {
    _ => return None
  }
  let content_length = parse_content_length(header)
  guard content_length > 0 else { return None }

  // Check if we have the full content
  let content_start = header_end + 4  // skip \r\n\r\n
  let content_end = content_start + content_length
  guard content_end <= self.buffer.length() else { return None }

  // Extract and parse content
  let content = try {
    self.buffer[content_start:content_end].to_string()
  } catch {
    _ => return None
  }
  let json = @json.parse(content)
  let message = Message::from_json(json)

  // Remove consumed data from buffer
  self.buffer = try {
    self.buffer[content_end:self.buffer.length()].to_string()
  } catch {
    _ => ""
  }

  Some(DecodeResult::{ message, consumed: content_end })
}

///| Find the position of \r\n\r\n (header end)
fn find_header_end(s : String) -> Int {
  for i = 0; i < s.length() - 3; i = i + 1 {
    if char_at(s, i) == '\r' &&
       char_at(s, i + 1) == '\n' &&
       char_at(s, i + 2) == '\r' &&
       char_at(s, i + 3) == '\n' {
      return i
    }
  }
  -1
}

///|
fn char_at(s : String, i : Int) -> Char {
  s[i].to_int().unsafe_to_char()
}

///| Parse Content-Length from header string
fn parse_content_length(header : String) -> Int {
  // Look for "Content-Length: "
  let prefix = "Content-Length: "
  let prefix_len = prefix.length()

  for i = 0; i < header.length() - prefix_len; i = i + 1 {
    let mut matches = true
    for j = 0; j < prefix_len; j = j + 1 {
      if char_at(header, i + j) != char_at(prefix, j) {
        matches = false
        break
      }
    }
    if matches {
      // Found prefix, now parse the number
      let mut num = 0
      let mut k = i + prefix_len
      while k < header.length() {
        let c = char_at(header, k)
        if c >= '0' && c <= '9' {
          num = num * 10 + (c.to_int() - '0'.to_int())
          k = k + 1
        } else {
          break
        }
      }
      return num
    }
  }
  -1
}
