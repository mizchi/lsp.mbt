///| Platform-independent IO interface for LSP client
///| For actual IO, use platform-specific implementations

///| Read result from LSP server
pub(all) enum ReadResult {
  Data(String)
  Eof
  Error(String)
} derive(Eq, Show)

///| Transport trait - implement this for platform-specific communication
///| This abstracts the bidirectional communication with an LSP server process
pub(open) trait Transport {
  /// Read data from the LSP server
  read(Self) -> ReadResult
  /// Write data to the LSP server
  write(Self, String) -> Unit
}

///| Stub transport for testing
pub struct StubTransport {
  input_buffer : Array[String]
  output_buffer : Array[String]
}

///|
pub fn StubTransport::new() -> StubTransport {
  StubTransport::{ input_buffer: [], output_buffer: [] }
}

///| Add input data (simulating server response)
pub fn StubTransport::push_input(self : StubTransport, data : String) -> Unit {
  self.input_buffer.push(data)
}

///| Get all output (data sent to server)
pub fn StubTransport::get_output(self : StubTransport) -> Array[String] {
  self.output_buffer
}

///| Clear output buffer
pub fn StubTransport::clear_output(self : StubTransport) -> Unit {
  self.output_buffer.clear()
}

///|
pub impl Transport for StubTransport with read(self) {
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
pub impl Transport for StubTransport with write(self, data) {
  self.output_buffer.push(data)
}
