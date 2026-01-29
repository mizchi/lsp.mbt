///| Platform-independent IO interface
///| For actual IO, use platform-specific server implementations

///| Read result from stdin
pub(all) enum ReadResult {
  Data(String)
  Eof
  Error(String)
} derive(Eq, Show)

///| IO handler trait - implement this for platform-specific IO
pub(open) trait IoHandler {
  read(Self) -> ReadResult
  write(Self, String) -> Unit
  write_error(Self, String) -> Unit
}

///| Stub IO handler for WASM/testing
pub struct StubIoHandler {
  input_buffer : Array[String]
  output_buffer : Array[String]
  error_buffer : Array[String]
}

///|
pub fn StubIoHandler::new() -> StubIoHandler {
  StubIoHandler::{
    input_buffer: [],
    output_buffer: [],
    error_buffer: [],
  }
}

///| Add input data for testing
pub fn StubIoHandler::push_input(self : StubIoHandler, data : String) -> Unit {
  self.input_buffer.push(data)
}

///| Get all output for testing
pub fn StubIoHandler::get_output(self : StubIoHandler) -> Array[String] {
  self.output_buffer
}

///| Get all error output for testing
pub fn StubIoHandler::get_errors(self : StubIoHandler) -> Array[String] {
  self.error_buffer
}

///|
pub impl IoHandler for StubIoHandler with read(self) {
  if self.input_buffer.length() > 0 {
    // Remove first element
    let data = self.input_buffer[0]
    let new_buffer : Array[String] = []
    for i in 1..<self.input_buffer.length() {
      new_buffer.push(self.input_buffer[i])
    }
    self.input_buffer.clear()
    for item in new_buffer {
      self.input_buffer.push(item)
    }
    ReadResult::Data(data)
  } else {
    ReadResult::Eof
  }
}

///|
pub impl IoHandler for StubIoHandler with write(self, data) {
  self.output_buffer.push(data)
}

///|
pub impl IoHandler for StubIoHandler with write_error(self, data) {
  self.error_buffer.push(data)
}
