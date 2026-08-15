///| Platform-independent IO interface for LSP client

///| For actual IO, use platform-specific implementations

///|
/// Read result from LSP server
pub(all) enum ReadResult {
  Data(String)
  Eof
  Error(String)
} derive(Eq, Debug)

///|
pub impl Show for ReadResult with fn output(self, logger) {
  match self {
    Data(s) => {
      logger.write_string("Data(")
      write_show_value(s, logger)
      logger.write_string(")")
    }
    Eof => logger.write_string("Eof")
    Error(s) => {
      logger.write_string("Error(")
      write_show_value(s, logger)
      logger.write_string(")")
    }
  }
}

///| Transport trait - implement this for platform-specific communication

///|
/// This abstracts the bidirectional communication with an LSP server process
pub(open) trait Transport {
  /// Read data from the LSP server
  fn read(Self) -> ReadResult
  /// Write data to the LSP server
  fn write(Self, String) -> Unit
}

///|
/// Stub transport for testing
pub struct StubTransport {
  input_buffer : Array[String]
  output_buffer : Array[String]
}

///|
pub fn StubTransport::new() -> StubTransport {
  StubTransport::{ input_buffer: [], output_buffer: [] }
}

///|
/// Add input data (simulating server response)
pub fn StubTransport::push_input(self : StubTransport, data : String) -> Unit {
  self.input_buffer.push(data)
}

///|
/// Get all output (data sent to server)
pub fn StubTransport::get_output(self : StubTransport) -> Array[String] {
  self.output_buffer
}

///|
/// Clear output buffer
pub fn StubTransport::clear_output(self : StubTransport) -> Unit {
  self.output_buffer.clear()
}

///|
pub impl Transport for StubTransport with fn read(self) {
  if self.input_buffer.length() > 0 {
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
pub impl Transport for StubTransport with fn write(self, data) {
  self.output_buffer.push(data)
}

///|
fn[T : Show] write_show_value(value : T, logger : &Logger) -> Unit {
  value.output(logger)
}
