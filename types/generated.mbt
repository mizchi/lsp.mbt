///| LSP Types - Auto-generated from LSP metaModel.json
///| LSP Version: 3.17.0

// ============ Enumerations ============

///| A set of predefined token types. This set is not fixed
pub(all) enum SemanticTokenTypes {
  Namespace
  ///| Represents a generic type. Acts as a fallback for types which can't be mapped to
  Type
  Class
  Enum
  Interface
  Struct
  TypeParameter
  Parameter
  Variable
  Property
  EnumMember
  Event
  Function
  Method
  Macro
  Keyword
  Modifier
  Comment
  String
  Number
  Regexp
  Operator
  ///| @since 3.17.0
  Decorator
  ///| @since 3.18.0
  Label
}

///|
pub impl @json.ToJson for SemanticTokenTypes with to_json(self) {
  let s = match self {
    Namespace => "namespace"
    Type => "type"
    Class => "class"
    Enum => "enum"
    Interface => "interface"
    Struct => "struct"
    TypeParameter => "typeParameter"
    Parameter => "parameter"
    Variable => "variable"
    Property => "property"
    EnumMember => "enumMember"
    Event => "event"
    Function => "function"
    Method => "method"
    Macro => "macro"
    Keyword => "keyword"
    Modifier => "modifier"
    Comment => "comment"
    String => "string"
    Number => "number"
    Regexp => "regexp"
    Operator => "operator"
    Decorator => "decorator"
    Label => "label"
  }
  @json.JsonValue::String(s)
}

///|
pub impl @json.FromJson for SemanticTokenTypes with from_json(json) {
  match json {
    @json.JsonValue::String(s) => {
      match s {
        "namespace" => Namespace
        "type" => Type
        "class" => Class
        "enum" => Enum
        "interface" => Interface
        "struct" => Struct
        "typeParameter" => TypeParameter
        "parameter" => Parameter
        "variable" => Variable
        "property" => Property
        "enumMember" => EnumMember
        "event" => Event
        "function" => Function
        "method" => Method
        "macro" => Macro
        "keyword" => Keyword
        "modifier" => Modifier
        "comment" => Comment
        "string" => String
        "number" => Number
        "regexp" => Regexp
        "operator" => Operator
        "decorator" => Decorator
        "label" => Label
        _ => raise @json.JsonError("invalid SemanticTokenTypes")
      }
    }
    _ => raise @json.JsonError("expected string for SemanticTokenTypes")
  }
}

///| A set of predefined token modifiers. This set is not fixed
pub(all) enum SemanticTokenModifiers {
  Declaration
  Definition
  Readonly
  Static
  Deprecated
  Abstract
  Async
  Modification
  Documentation
  DefaultLibrary
}

///|
pub impl @json.ToJson for SemanticTokenModifiers with to_json(self) {
  let s = match self {
    Declaration => "declaration"
    Definition => "definition"
    Readonly => "readonly"
    Static => "static"
    Deprecated => "deprecated"
    Abstract => "abstract"
    Async => "async"
    Modification => "modification"
    Documentation => "documentation"
    DefaultLibrary => "defaultLibrary"
  }
  @json.JsonValue::String(s)
}

///|
pub impl @json.FromJson for SemanticTokenModifiers with from_json(json) {
  match json {
    @json.JsonValue::String(s) => {
      match s {
        "declaration" => Declaration
        "definition" => Definition
        "readonly" => Readonly
        "static" => Static
        "deprecated" => Deprecated
        "abstract" => Abstract
        "async" => Async
        "modification" => Modification
        "documentation" => Documentation
        "defaultLibrary" => DefaultLibrary
        _ => raise @json.JsonError("invalid SemanticTokenModifiers")
      }
    }
    _ => raise @json.JsonError("expected string for SemanticTokenModifiers")
  }
}

///| The document diagnostic report kinds.
pub(all) enum DocumentDiagnosticReportKind {
  ///| A diagnostic report with a full
  Full
  ///| A report indicating that the last
  Unchanged
}

///|
pub impl @json.ToJson for DocumentDiagnosticReportKind with to_json(self) {
  let s = match self {
    Full => "full"
    Unchanged => "unchanged"
  }
  @json.JsonValue::String(s)
}

///|
pub impl @json.FromJson for DocumentDiagnosticReportKind with from_json(json) {
  match json {
    @json.JsonValue::String(s) => {
      match s {
        "full" => Full
        "unchanged" => Unchanged
        _ => raise @json.JsonError("invalid DocumentDiagnosticReportKind")
      }
    }
    _ => raise @json.JsonError("expected string for DocumentDiagnosticReportKind")
  }
}

///| Predefined error codes.
pub(all) enum ErrorCodes {
  ParseError  // -32700
  InvalidRequest  // -32600
  MethodNotFound  // -32601
  InvalidParams  // -32602
  InternalError  // -32603
  ///| Error code indicating that a server received a notification or
  ServerNotInitialized  // -32002
  UnknownErrorCode  // -32001
}

///|
pub impl @json.ToJson for ErrorCodes with to_json(self) {
  let n = match self {
    ParseError => -32700
    InvalidRequest => -32600
    MethodNotFound => -32601
    InvalidParams => -32602
    InternalError => -32603
    ServerNotInitialized => -32002
    UnknownErrorCode => -32001
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for ErrorCodes with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        -32700 => ParseError
        -32600 => InvalidRequest
        -32601 => MethodNotFound
        -32602 => InvalidParams
        -32603 => InternalError
        -32002 => ServerNotInitialized
        -32001 => UnknownErrorCode
        _ => raise @json.JsonError("invalid ErrorCodes")
      }
    }
    _ => raise @json.JsonError("expected number for ErrorCodes")
  }
}

pub(all) enum LSPErrorCodes {
  ///| A request failed but it was syntactically correct, e.g the
  RequestFailed  // -32803
  ///| The server cancelled the request. This error code should
  ServerCancelled  // -32802
  ///| The server detected that the content of a document got
  ContentModified  // -32801
  ///| The client has canceled a request and a server has detected
  RequestCancelled  // -32800
}

///|
pub impl @json.ToJson for LSPErrorCodes with to_json(self) {
  let n = match self {
    RequestFailed => -32803
    ServerCancelled => -32802
    ContentModified => -32801
    RequestCancelled => -32800
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for LSPErrorCodes with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        -32803 => RequestFailed
        -32802 => ServerCancelled
        -32801 => ContentModified
        -32800 => RequestCancelled
        _ => raise @json.JsonError("invalid LSPErrorCodes")
      }
    }
    _ => raise @json.JsonError("expected number for LSPErrorCodes")
  }
}

///| A set of predefined range kinds.
pub(all) enum FoldingRangeKind {
  ///| Folding range for a comment
  Comment
  ///| Folding range for an import or include
  Imports
  ///| Folding range for a region (e.g. `#region`)
  Region
}

///|
pub impl @json.ToJson for FoldingRangeKind with to_json(self) {
  let s = match self {
    Comment => "comment"
    Imports => "imports"
    Region => "region"
  }
  @json.JsonValue::String(s)
}

///|
pub impl @json.FromJson for FoldingRangeKind with from_json(json) {
  match json {
    @json.JsonValue::String(s) => {
      match s {
        "comment" => Comment
        "imports" => Imports
        "region" => Region
        _ => raise @json.JsonError("invalid FoldingRangeKind")
      }
    }
    _ => raise @json.JsonError("expected string for FoldingRangeKind")
  }
}

///| A symbol kind.
pub(all) enum SymbolKind {
  File  // 1
  Module  // 2
  Namespace  // 3
  Package  // 4
  Class  // 5
  Method  // 6
  Property  // 7
  Field  // 8
  Constructor  // 9
  Enum  // 10
  Interface  // 11
  Function  // 12
  Variable  // 13
  Constant  // 14
  String  // 15
  Number  // 16
  Boolean  // 17
  Array  // 18
  Object  // 19
  Key  // 20
  Null  // 21
  EnumMember  // 22
  Struct  // 23
  Event  // 24
  Operator  // 25
  TypeParameter  // 26
}

///|
pub impl @json.ToJson for SymbolKind with to_json(self) {
  let n = match self {
    File => 1
    Module => 2
    Namespace => 3
    Package => 4
    Class => 5
    Method => 6
    Property => 7
    Field => 8
    Constructor => 9
    Enum => 10
    Interface => 11
    Function => 12
    Variable => 13
    Constant => 14
    String => 15
    Number => 16
    Boolean => 17
    Array => 18
    Object => 19
    Key => 20
    Null => 21
    EnumMember => 22
    Struct => 23
    Event => 24
    Operator => 25
    TypeParameter => 26
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for SymbolKind with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        1 => File
        2 => Module
        3 => Namespace
        4 => Package
        5 => Class
        6 => Method
        7 => Property
        8 => Field
        9 => Constructor
        10 => Enum
        11 => Interface
        12 => Function
        13 => Variable
        14 => Constant
        15 => String
        16 => Number
        17 => Boolean
        18 => Array
        19 => Object
        20 => Key
        21 => Null
        22 => EnumMember
        23 => Struct
        24 => Event
        25 => Operator
        26 => TypeParameter
        _ => raise @json.JsonError("invalid SymbolKind")
      }
    }
    _ => raise @json.JsonError("expected number for SymbolKind")
  }
}

///| Symbol tags are extra annotations that tweak the rendering of a symbol.
pub(all) enum SymbolTag {
  ///| Render a symbol as obsolete, usually using a strike-out.
  Deprecated  // 1
}

///|
pub impl @json.ToJson for SymbolTag with to_json(self) {
  let n = match self {
    Deprecated => 1
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for SymbolTag with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        1 => Deprecated
        _ => raise @json.JsonError("invalid SymbolTag")
      }
    }
    _ => raise @json.JsonError("expected number for SymbolTag")
  }
}

///| Moniker uniqueness level to define scope of the moniker.
pub(all) enum UniquenessLevel {
  ///| The moniker is only unique inside a document
  Document
  ///| The moniker is unique inside a project for which a dump got created
  Project
  ///| The moniker is unique inside the group to which a project belongs
  Group
  ///| The moniker is unique inside the moniker scheme.
  Scheme
  ///| The moniker is globally unique
  Global
}

///|
pub impl @json.ToJson for UniquenessLevel with to_json(self) {
  let s = match self {
    Document => "document"
    Project => "project"
    Group => "group"
    Scheme => "scheme"
    Global => "global"
  }
  @json.JsonValue::String(s)
}

///|
pub impl @json.FromJson for UniquenessLevel with from_json(json) {
  match json {
    @json.JsonValue::String(s) => {
      match s {
        "document" => Document
        "project" => Project
        "group" => Group
        "scheme" => Scheme
        "global" => Global
        _ => raise @json.JsonError("invalid UniquenessLevel")
      }
    }
    _ => raise @json.JsonError("expected string for UniquenessLevel")
  }
}

///| The moniker kind.
pub(all) enum MonikerKind {
  ///| The moniker represent a symbol that is imported into a project
  Import
  ///| The moniker represents a symbol that is exported from a project
  Export
  ///| The moniker represents a symbol that is local to a project (e.g. a local
  Local
}

///|
pub impl @json.ToJson for MonikerKind with to_json(self) {
  let s = match self {
    Import => "import"
    Export => "export"
    Local => "local"
  }
  @json.JsonValue::String(s)
}

///|
pub impl @json.FromJson for MonikerKind with from_json(json) {
  match json {
    @json.JsonValue::String(s) => {
      match s {
        "import" => Import
        "export" => Export
        "local" => Local
        _ => raise @json.JsonError("invalid MonikerKind")
      }
    }
    _ => raise @json.JsonError("expected string for MonikerKind")
  }
}

///| Inlay hint kinds.
pub(all) enum InlayHintKind {
  ///| An inlay hint that for a type annotation.
  Type  // 1
  ///| An inlay hint that is for a parameter.
  Parameter  // 2
}

///|
pub impl @json.ToJson for InlayHintKind with to_json(self) {
  let n = match self {
    Type => 1
    Parameter => 2
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for InlayHintKind with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        1 => Type
        2 => Parameter
        _ => raise @json.JsonError("invalid InlayHintKind")
      }
    }
    _ => raise @json.JsonError("expected number for InlayHintKind")
  }
}

///| The message type
pub(all) enum MessageType {
  ///| An error message.
  Error  // 1
  ///| A warning message.
  Warning  // 2
  ///| An information message.
  Info  // 3
  ///| A log message.
  Log  // 4
  ///| A debug message.
  Debug  // 5
}

///|
pub impl @json.ToJson for MessageType with to_json(self) {
  let n = match self {
    Error => 1
    Warning => 2
    Info => 3
    Log => 4
    Debug => 5
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for MessageType with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        1 => Error
        2 => Warning
        3 => Info
        4 => Log
        5 => Debug
        _ => raise @json.JsonError("invalid MessageType")
      }
    }
    _ => raise @json.JsonError("expected number for MessageType")
  }
}

///| Defines how the host (editor) should sync
pub(all) enum TextDocumentSyncKind {
  ///| Documents should not be synced at all.
  None  // 0
  ///| Documents are synced by always sending the full content
  Full  // 1
  ///| Documents are synced by sending the full content on open.
  Incremental  // 2
}

///|
pub impl @json.ToJson for TextDocumentSyncKind with to_json(self) {
  let n = match self {
    None => 0
    Full => 1
    Incremental => 2
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for TextDocumentSyncKind with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        0 => None
        1 => Full
        2 => Incremental
        _ => raise @json.JsonError("invalid TextDocumentSyncKind")
      }
    }
    _ => raise @json.JsonError("expected number for TextDocumentSyncKind")
  }
}

///| Represents reasons why a text document is saved.
pub(all) enum TextDocumentSaveReason {
  ///| Manually triggered, e.g. by the user pressing save, by starting debugging,
  Manual  // 1
  ///| Automatic after a delay.
  AfterDelay  // 2
  ///| When the editor lost focus.
  FocusOut  // 3
}

///|
pub impl @json.ToJson for TextDocumentSaveReason with to_json(self) {
  let n = match self {
    Manual => 1
    AfterDelay => 2
    FocusOut => 3
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for TextDocumentSaveReason with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        1 => Manual
        2 => AfterDelay
        3 => FocusOut
        _ => raise @json.JsonError("invalid TextDocumentSaveReason")
      }
    }
    _ => raise @json.JsonError("expected number for TextDocumentSaveReason")
  }
}

///| The kind of a completion entry.
pub(all) enum CompletionItemKind {
  Text  // 1
  Method  // 2
  Function  // 3
  Constructor  // 4
  Field  // 5
  Variable  // 6
  Class  // 7
  Interface  // 8
  Module  // 9
  Property  // 10
  Unit  // 11
  Value  // 12
  Enum  // 13
  Keyword  // 14
  Snippet  // 15
  Color  // 16
  File  // 17
  Reference  // 18
  Folder  // 19
  EnumMember  // 20
  Constant  // 21
  Struct  // 22
  Event  // 23
  Operator  // 24
  TypeParameter  // 25
}

///|
pub impl @json.ToJson for CompletionItemKind with to_json(self) {
  let n = match self {
    Text => 1
    Method => 2
    Function => 3
    Constructor => 4
    Field => 5
    Variable => 6
    Class => 7
    Interface => 8
    Module => 9
    Property => 10
    Unit => 11
    Value => 12
    Enum => 13
    Keyword => 14
    Snippet => 15
    Color => 16
    File => 17
    Reference => 18
    Folder => 19
    EnumMember => 20
    Constant => 21
    Struct => 22
    Event => 23
    Operator => 24
    TypeParameter => 25
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for CompletionItemKind with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        1 => Text
        2 => Method
        3 => Function
        4 => Constructor
        5 => Field
        6 => Variable
        7 => Class
        8 => Interface
        9 => Module
        10 => Property
        11 => Unit
        12 => Value
        13 => Enum
        14 => Keyword
        15 => Snippet
        16 => Color
        17 => File
        18 => Reference
        19 => Folder
        20 => EnumMember
        21 => Constant
        22 => Struct
        23 => Event
        24 => Operator
        25 => TypeParameter
        _ => raise @json.JsonError("invalid CompletionItemKind")
      }
    }
    _ => raise @json.JsonError("expected number for CompletionItemKind")
  }
}

///| Completion item tags are extra annotations that tweak the rendering of a completion
pub(all) enum CompletionItemTag {
  ///| Render a completion as obsolete, usually using a strike-out.
  Deprecated  // 1
}

///|
pub impl @json.ToJson for CompletionItemTag with to_json(self) {
  let n = match self {
    Deprecated => 1
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for CompletionItemTag with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        1 => Deprecated
        _ => raise @json.JsonError("invalid CompletionItemTag")
      }
    }
    _ => raise @json.JsonError("expected number for CompletionItemTag")
  }
}

///| Defines whether the insert text in a completion item should be interpreted as
pub(all) enum InsertTextFormat {
  ///| The primary text to be inserted is treated as a plain string.
  PlainText  // 1
  ///| The primary text to be inserted is treated as a snippet.
  Snippet  // 2
}

///|
pub impl @json.ToJson for InsertTextFormat with to_json(self) {
  let n = match self {
    PlainText => 1
    Snippet => 2
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for InsertTextFormat with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        1 => PlainText
        2 => Snippet
        _ => raise @json.JsonError("invalid InsertTextFormat")
      }
    }
    _ => raise @json.JsonError("expected number for InsertTextFormat")
  }
}

///| How whitespace and indentation is handled during completion
pub(all) enum InsertTextMode {
  ///| The insertion or replace strings is taken as it is. If the
  AsIs  // 1
  ///| The editor adjusts leading whitespace of new lines so that
  AdjustIndentation  // 2
}

///|
pub impl @json.ToJson for InsertTextMode with to_json(self) {
  let n = match self {
    AsIs => 1
    AdjustIndentation => 2
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for InsertTextMode with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        1 => AsIs
        2 => AdjustIndentation
        _ => raise @json.JsonError("invalid InsertTextMode")
      }
    }
    _ => raise @json.JsonError("expected number for InsertTextMode")
  }
}

///| A document highlight kind.
pub(all) enum DocumentHighlightKind {
  ///| A textual occurrence.
  Text  // 1
  ///| Read-access of a symbol, like reading a variable.
  Read  // 2
  ///| Write-access of a symbol, like writing to a variable.
  Write  // 3
}

///|
pub impl @json.ToJson for DocumentHighlightKind with to_json(self) {
  let n = match self {
    Text => 1
    Read => 2
    Write => 3
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for DocumentHighlightKind with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        1 => Text
        2 => Read
        3 => Write
        _ => raise @json.JsonError("invalid DocumentHighlightKind")
      }
    }
    _ => raise @json.JsonError("expected number for DocumentHighlightKind")
  }
}

///| A set of predefined code action kinds
pub(all) enum CodeActionKind {
  ///| Empty kind.
  Empty
  ///| Base kind for quickfix actions: 'quickfix'
  QuickFix
  ///| Base kind for refactoring actions: 'refactor'
  Refactor
  ///| Base kind for refactoring extraction actions: 'refactor.extract'
  RefactorExtract
  ///| Base kind for refactoring inline actions: 'refactor.inline'
  RefactorInline
  ///| Base kind for refactoring move actions: `refactor.move`
  RefactorMove
  ///| Base kind for refactoring rewrite actions: 'refactor.rewrite'
  RefactorRewrite
  ///| Base kind for source actions: `source`
  Source
  ///| Base kind for an organize imports source action: `source.organizeImports`
  SourceOrganizeImports
  ///| Base kind for auto-fix source actions: `source.fixAll`.
  SourceFixAll
  ///| Base kind for all code actions applying to the entire notebook's scope. CodeActionKinds using
  Notebook
}

///|
pub impl @json.ToJson for CodeActionKind with to_json(self) {
  let s = match self {
    Empty => ""
    QuickFix => "quickfix"
    Refactor => "refactor"
    RefactorExtract => "refactor.extract"
    RefactorInline => "refactor.inline"
    RefactorMove => "refactor.move"
    RefactorRewrite => "refactor.rewrite"
    Source => "source"
    SourceOrganizeImports => "source.organizeImports"
    SourceFixAll => "source.fixAll"
    Notebook => "notebook"
  }
  @json.JsonValue::String(s)
}

///|
pub impl @json.FromJson for CodeActionKind with from_json(json) {
  match json {
    @json.JsonValue::String(s) => {
      match s {
        "" => Empty
        "quickfix" => QuickFix
        "refactor" => Refactor
        "refactor.extract" => RefactorExtract
        "refactor.inline" => RefactorInline
        "refactor.move" => RefactorMove
        "refactor.rewrite" => RefactorRewrite
        "source" => Source
        "source.organizeImports" => SourceOrganizeImports
        "source.fixAll" => SourceFixAll
        "notebook" => Notebook
        _ => raise @json.JsonError("invalid CodeActionKind")
      }
    }
    _ => raise @json.JsonError("expected string for CodeActionKind")
  }
}

///| Code action tags are extra annotations that tweak the behavior of a code action.
pub(all) enum CodeActionTag {
  ///| Marks the code action as LLM-generated.
  LLMGenerated  // 1
}

///|
pub impl @json.ToJson for CodeActionTag with to_json(self) {
  let n = match self {
    LLMGenerated => 1
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for CodeActionTag with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        1 => LLMGenerated
        _ => raise @json.JsonError("invalid CodeActionTag")
      }
    }
    _ => raise @json.JsonError("expected number for CodeActionTag")
  }
}

pub(all) enum TraceValue {
  ///| Turn tracing off.
  Off
  ///| Trace messages only.
  Messages
  ///| Verbose message tracing.
  Verbose
}

///|
pub impl @json.ToJson for TraceValue with to_json(self) {
  let s = match self {
    Off => "off"
    Messages => "messages"
    Verbose => "verbose"
  }
  @json.JsonValue::String(s)
}

///|
pub impl @json.FromJson for TraceValue with from_json(json) {
  match json {
    @json.JsonValue::String(s) => {
      match s {
        "off" => Off
        "messages" => Messages
        "verbose" => Verbose
        _ => raise @json.JsonError("invalid TraceValue")
      }
    }
    _ => raise @json.JsonError("expected string for TraceValue")
  }
}

///| Describes the content type that a client supports in various
pub(all) enum MarkupKind {
  ///| Plain text is supported as a content format
  PlainText
  ///| Markdown is supported as a content format
  Markdown
}

///|
pub impl @json.ToJson for MarkupKind with to_json(self) {
  let s = match self {
    PlainText => "plaintext"
    Markdown => "markdown"
  }
  @json.JsonValue::String(s)
}

///|
pub impl @json.FromJson for MarkupKind with from_json(json) {
  match json {
    @json.JsonValue::String(s) => {
      match s {
        "plaintext" => PlainText
        "markdown" => Markdown
        _ => raise @json.JsonError("invalid MarkupKind")
      }
    }
    _ => raise @json.JsonError("expected string for MarkupKind")
  }
}

///| Predefined Language kinds
pub(all) enum LanguageKind {
  ABAP
  WindowsBat
  BibTeX
  Clojure
  Coffeescript
  C
  CPP
  CSharp
  CSS
  ///| @since 3.18.0
  D
  ///| @since 3.18.0
  Delphi
  Diff
  Dart
  Dockerfile
  Elixir
  Erlang
  FSharp
  GitCommit
  GitRebase
  Go
  Groovy
  Handlebars
  Haskell
  HTML
  Ini
  Java
  JavaScript
  JavaScriptReact
  JSON
  LaTeX
  Less
  Lua
  Makefile
  Markdown
  ObjectiveC
  ObjectiveCPP
  ///| @since 3.18.0
  Pascal
  Perl
  Perl6
  PHP
  Powershell
  Pug
  Python
  R
  Razor
  Ruby
  Rust
  SCSS
  SASS
  Scala
  ShaderLab
  ShellScript
  SQL
  Swift
  TypeScript
  TypeScriptReact
  TeX
  VisualBasic
  XML
  XSL
  YAML
}

///|
pub impl @json.ToJson for LanguageKind with to_json(self) {
  let s = match self {
    ABAP => "abap"
    WindowsBat => "bat"
    BibTeX => "bibtex"
    Clojure => "clojure"
    Coffeescript => "coffeescript"
    C => "c"
    CPP => "cpp"
    CSharp => "csharp"
    CSS => "css"
    D => "d"
    Delphi => "pascal"
    Diff => "diff"
    Dart => "dart"
    Dockerfile => "dockerfile"
    Elixir => "elixir"
    Erlang => "erlang"
    FSharp => "fsharp"
    GitCommit => "git-commit"
    GitRebase => "rebase"
    Go => "go"
    Groovy => "groovy"
    Handlebars => "handlebars"
    Haskell => "haskell"
    HTML => "html"
    Ini => "ini"
    Java => "java"
    JavaScript => "javascript"
    JavaScriptReact => "javascriptreact"
    JSON => "json"
    LaTeX => "latex"
    Less => "less"
    Lua => "lua"
    Makefile => "makefile"
    Markdown => "markdown"
    ObjectiveC => "objective-c"
    ObjectiveCPP => "objective-cpp"
    Pascal => "pascal"
    Perl => "perl"
    Perl6 => "perl6"
    PHP => "php"
    Powershell => "powershell"
    Pug => "jade"
    Python => "python"
    R => "r"
    Razor => "razor"
    Ruby => "ruby"
    Rust => "rust"
    SCSS => "scss"
    SASS => "sass"
    Scala => "scala"
    ShaderLab => "shaderlab"
    ShellScript => "shellscript"
    SQL => "sql"
    Swift => "swift"
    TypeScript => "typescript"
    TypeScriptReact => "typescriptreact"
    TeX => "tex"
    VisualBasic => "vb"
    XML => "xml"
    XSL => "xsl"
    YAML => "yaml"
  }
  @json.JsonValue::String(s)
}

///|
pub impl @json.FromJson for LanguageKind with from_json(json) {
  match json {
    @json.JsonValue::String(s) => {
      match s {
        "abap" => ABAP
        "bat" => WindowsBat
        "bibtex" => BibTeX
        "clojure" => Clojure
        "coffeescript" => Coffeescript
        "c" => C
        "cpp" => CPP
        "csharp" => CSharp
        "css" => CSS
        "d" => D
        "pascal" => Delphi
        "diff" => Diff
        "dart" => Dart
        "dockerfile" => Dockerfile
        "elixir" => Elixir
        "erlang" => Erlang
        "fsharp" => FSharp
        "git-commit" => GitCommit
        "rebase" => GitRebase
        "go" => Go
        "groovy" => Groovy
        "handlebars" => Handlebars
        "haskell" => Haskell
        "html" => HTML
        "ini" => Ini
        "java" => Java
        "javascript" => JavaScript
        "javascriptreact" => JavaScriptReact
        "json" => JSON
        "latex" => LaTeX
        "less" => Less
        "lua" => Lua
        "makefile" => Makefile
        "markdown" => Markdown
        "objective-c" => ObjectiveC
        "objective-cpp" => ObjectiveCPP
        "pascal" => Pascal
        "perl" => Perl
        "perl6" => Perl6
        "php" => PHP
        "powershell" => Powershell
        "jade" => Pug
        "python" => Python
        "r" => R
        "razor" => Razor
        "ruby" => Ruby
        "rust" => Rust
        "scss" => SCSS
        "sass" => SASS
        "scala" => Scala
        "shaderlab" => ShaderLab
        "shellscript" => ShellScript
        "sql" => SQL
        "swift" => Swift
        "typescript" => TypeScript
        "typescriptreact" => TypeScriptReact
        "tex" => TeX
        "vb" => VisualBasic
        "xml" => XML
        "xsl" => XSL
        "yaml" => YAML
        _ => raise @json.JsonError("invalid LanguageKind")
      }
    }
    _ => raise @json.JsonError("expected string for LanguageKind")
  }
}

///| Describes how an {@link InlineCompletionItemProvider inline completion provider} was triggered.
pub(all) enum InlineCompletionTriggerKind {
  ///| Completion was triggered explicitly by a user gesture.
  Invoked  // 1
  ///| Completion was triggered automatically while editing.
  Automatic  // 2
}

///|
pub impl @json.ToJson for InlineCompletionTriggerKind with to_json(self) {
  let n = match self {
    Invoked => 1
    Automatic => 2
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for InlineCompletionTriggerKind with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        1 => Invoked
        2 => Automatic
        _ => raise @json.JsonError("invalid InlineCompletionTriggerKind")
      }
    }
    _ => raise @json.JsonError("expected number for InlineCompletionTriggerKind")
  }
}

///| A set of predefined position encoding kinds.
pub(all) enum PositionEncodingKind {
  ///| Character offsets count UTF-8 code units (e.g. bytes).
  UTF8
  ///| Character offsets count UTF-16 code units.
  UTF16
  ///| Character offsets count UTF-32 code units.
  UTF32
}

///|
pub impl @json.ToJson for PositionEncodingKind with to_json(self) {
  let s = match self {
    UTF8 => "utf-8"
    UTF16 => "utf-16"
    UTF32 => "utf-32"
  }
  @json.JsonValue::String(s)
}

///|
pub impl @json.FromJson for PositionEncodingKind with from_json(json) {
  match json {
    @json.JsonValue::String(s) => {
      match s {
        "utf-8" => UTF8
        "utf-16" => UTF16
        "utf-32" => UTF32
        _ => raise @json.JsonError("invalid PositionEncodingKind")
      }
    }
    _ => raise @json.JsonError("expected string for PositionEncodingKind")
  }
}

///| The file event type
pub(all) enum FileChangeType {
  ///| The file got created.
  Created  // 1
  ///| The file got changed.
  Changed  // 2
  ///| The file got deleted.
  Deleted  // 3
}

///|
pub impl @json.ToJson for FileChangeType with to_json(self) {
  let n = match self {
    Created => 1
    Changed => 2
    Deleted => 3
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for FileChangeType with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        1 => Created
        2 => Changed
        3 => Deleted
        _ => raise @json.JsonError("invalid FileChangeType")
      }
    }
    _ => raise @json.JsonError("expected number for FileChangeType")
  }
}

pub(all) enum WatchKind {
  ///| Interested in create events.
  Create  // 1
  ///| Interested in change events
  Change  // 2
  ///| Interested in delete events
  Delete  // 4
}

///|
pub impl @json.ToJson for WatchKind with to_json(self) {
  let n = match self {
    Create => 1
    Change => 2
    Delete => 4
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for WatchKind with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        1 => Create
        2 => Change
        4 => Delete
        _ => raise @json.JsonError("invalid WatchKind")
      }
    }
    _ => raise @json.JsonError("expected number for WatchKind")
  }
}

///| How a completion was triggered
pub(all) enum CompletionTriggerKind {
  ///| Completion was triggered by typing an identifier (24x7 code
  Invoked  // 1
  ///| Completion was triggered by a trigger character specified by
  TriggerCharacter  // 2
  ///| Completion was re-triggered as current completion list is incomplete
  TriggerForIncompleteCompletions  // 3
}

///|
pub impl @json.ToJson for CompletionTriggerKind with to_json(self) {
  let n = match self {
    Invoked => 1
    TriggerCharacter => 2
    TriggerForIncompleteCompletions => 3
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for CompletionTriggerKind with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        1 => Invoked
        2 => TriggerCharacter
        3 => TriggerForIncompleteCompletions
        _ => raise @json.JsonError("invalid CompletionTriggerKind")
      }
    }
    _ => raise @json.JsonError("expected number for CompletionTriggerKind")
  }
}

///| Defines how values from a set of defaults and an individual item will be
pub(all) enum ApplyKind {
  ///| The value from the individual item (if provided and not `null`) will be
  Replace  // 1
  ///| The value from the item will be merged with the default.
  Merge  // 2
}

///|
pub impl @json.ToJson for ApplyKind with to_json(self) {
  let n = match self {
    Replace => 1
    Merge => 2
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for ApplyKind with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        1 => Replace
        2 => Merge
        _ => raise @json.JsonError("invalid ApplyKind")
      }
    }
    _ => raise @json.JsonError("expected number for ApplyKind")
  }
}

///| How a signature help was triggered.
pub(all) enum SignatureHelpTriggerKind {
  ///| Signature help was invoked manually by the user or by a command.
  Invoked  // 1
  ///| Signature help was triggered by a trigger character.
  TriggerCharacter  // 2
  ///| Signature help was triggered by the cursor moving or by the document content changing.
  ContentChange  // 3
}

///|
pub impl @json.ToJson for SignatureHelpTriggerKind with to_json(self) {
  let n = match self {
    Invoked => 1
    TriggerCharacter => 2
    ContentChange => 3
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for SignatureHelpTriggerKind with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        1 => Invoked
        2 => TriggerCharacter
        3 => ContentChange
        _ => raise @json.JsonError("invalid SignatureHelpTriggerKind")
      }
    }
    _ => raise @json.JsonError("expected number for SignatureHelpTriggerKind")
  }
}

///| The reason why code actions were requested.
pub(all) enum CodeActionTriggerKind {
  ///| Code actions were explicitly requested by the user or by an extension.
  Invoked  // 1
  ///| Code actions were requested automatically.
  Automatic  // 2
}

///|
pub impl @json.ToJson for CodeActionTriggerKind with to_json(self) {
  let n = match self {
    Invoked => 1
    Automatic => 2
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for CodeActionTriggerKind with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        1 => Invoked
        2 => Automatic
        _ => raise @json.JsonError("invalid CodeActionTriggerKind")
      }
    }
    _ => raise @json.JsonError("expected number for CodeActionTriggerKind")
  }
}

///| A pattern kind describing if a glob pattern matches a file a folder or
pub(all) enum FileOperationPatternKind {
  ///| The pattern matches a file only.
  File
  ///| The pattern matches a folder only.
  Folder
}

///|
pub impl @json.ToJson for FileOperationPatternKind with to_json(self) {
  let s = match self {
    File => "file"
    Folder => "folder"
  }
  @json.JsonValue::String(s)
}

///|
pub impl @json.FromJson for FileOperationPatternKind with from_json(json) {
  match json {
    @json.JsonValue::String(s) => {
      match s {
        "file" => File
        "folder" => Folder
        _ => raise @json.JsonError("invalid FileOperationPatternKind")
      }
    }
    _ => raise @json.JsonError("expected string for FileOperationPatternKind")
  }
}

///| A notebook cell kind.
pub(all) enum NotebookCellKind {
  ///| A markup-cell is formatted source that is used for display.
  Markup  // 1
  ///| A code-cell is source code.
  Code  // 2
}

///|
pub impl @json.ToJson for NotebookCellKind with to_json(self) {
  let n = match self {
    Markup => 1
    Code => 2
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for NotebookCellKind with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        1 => Markup
        2 => Code
        _ => raise @json.JsonError("invalid NotebookCellKind")
      }
    }
    _ => raise @json.JsonError("expected number for NotebookCellKind")
  }
}

pub(all) enum ResourceOperationKind {
  ///| Supports creating new files and folders.
  Create
  ///| Supports renaming existing files and folders.
  Rename
  ///| Supports deleting existing files and folders.
  Delete
}

///|
pub impl @json.ToJson for ResourceOperationKind with to_json(self) {
  let s = match self {
    Create => "create"
    Rename => "rename"
    Delete => "delete"
  }
  @json.JsonValue::String(s)
}

///|
pub impl @json.FromJson for ResourceOperationKind with from_json(json) {
  match json {
    @json.JsonValue::String(s) => {
      match s {
        "create" => Create
        "rename" => Rename
        "delete" => Delete
        _ => raise @json.JsonError("invalid ResourceOperationKind")
      }
    }
    _ => raise @json.JsonError("expected string for ResourceOperationKind")
  }
}

pub(all) enum FailureHandlingKind {
  ///| Applying the workspace change is simply aborted if one of the changes provided
  Abort
  ///| All operations are executed transactional. That means they either all
  Transactional
  ///| If the workspace edit contains only textual file changes they are executed transactional.
  TextOnlyTransactional
  ///| The client tries to undo the operations already executed. But there is no
  Undo
}

///|
pub impl @json.ToJson for FailureHandlingKind with to_json(self) {
  let s = match self {
    Abort => "abort"
    Transactional => "transactional"
    TextOnlyTransactional => "textOnlyTransactional"
    Undo => "undo"
  }
  @json.JsonValue::String(s)
}

///|
pub impl @json.FromJson for FailureHandlingKind with from_json(json) {
  match json {
    @json.JsonValue::String(s) => {
      match s {
        "abort" => Abort
        "transactional" => Transactional
        "textOnlyTransactional" => TextOnlyTransactional
        "undo" => Undo
        _ => raise @json.JsonError("invalid FailureHandlingKind")
      }
    }
    _ => raise @json.JsonError("expected string for FailureHandlingKind")
  }
}

pub(all) enum PrepareSupportDefaultBehavior {
  ///| The client's default behavior is to select the identifier
  Identifier  // 1
}

///|
pub impl @json.ToJson for PrepareSupportDefaultBehavior with to_json(self) {
  let n = match self {
    Identifier => 1
  }
  @json.JsonValue::Number(n.to_double())
}

///|
pub impl @json.FromJson for PrepareSupportDefaultBehavior with from_json(json) {
  match json {
    @json.JsonValue::Number(n) => {
      match n.to_int() {
        1 => Identifier
        _ => raise @json.JsonError("invalid PrepareSupportDefaultBehavior")
      }
    }
    _ => raise @json.JsonError("expected number for PrepareSupportDefaultBehavior")
  }
}

pub(all) enum TokenFormat {
  Relative
}

///|
pub impl @json.ToJson for TokenFormat with to_json(self) {
  let s = match self {
    Relative => "relative"
  }
  @json.JsonValue::String(s)
}

///|
pub impl @json.FromJson for TokenFormat with from_json(json) {
  match json {
    @json.JsonValue::String(s) => {
      match s {
        "relative" => Relative
        _ => raise @json.JsonError("invalid TokenFormat")
      }
    }
    _ => raise @json.JsonError("expected string for TokenFormat")
  }
}

// ============ Structures ============

///| Extends: TextDocumentPositionParams
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct ImplementationParams {
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The position inside the text document.
  position : Position
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
}

///|
pub impl @json.ToJson for ImplementationParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  obj.set("position", self.position.to_json())
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ImplementationParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ImplementationParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let position = match obj.get("position") {
    Some(v) => Position::from_json(v)
    None => raise @json.JsonError("missing position")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  ImplementationParams::{ text_document, position, work_done_token, partial_result_token }
}

///| Extends: TextDocumentRegistrationOptions, ImplementationOptions
///| Mixins: StaticRegistrationOptions
pub struct ImplementationRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
  ///| The id used to register the request. The id can be used to deregister
  id : String?
}

///|
pub impl @json.ToJson for ImplementationRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.id {
    Some(v) => obj.set("id", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ImplementationRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ImplementationRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let id : String? = match obj.get("id") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  ImplementationRegistrationOptions::{ document_selector, work_done_progress, id }
}

///| Extends: TextDocumentPositionParams
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct TypeDefinitionParams {
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The position inside the text document.
  position : Position
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
}

///|
pub impl @json.ToJson for TypeDefinitionParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  obj.set("position", self.position.to_json())
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TypeDefinitionParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TypeDefinitionParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let position = match obj.get("position") {
    Some(v) => Position::from_json(v)
    None => raise @json.JsonError("missing position")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  TypeDefinitionParams::{ text_document, position, work_done_token, partial_result_token }
}

///| Extends: TextDocumentRegistrationOptions, TypeDefinitionOptions
///| Mixins: StaticRegistrationOptions
pub struct TypeDefinitionRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
  ///| The id used to register the request. The id can be used to deregister
  id : String?
}

///|
pub impl @json.ToJson for TypeDefinitionRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.id {
    Some(v) => obj.set("id", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TypeDefinitionRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TypeDefinitionRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let id : String? = match obj.get("id") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  TypeDefinitionRegistrationOptions::{ document_selector, work_done_progress, id }
}

///| A workspace folder inside a client.
pub struct WorkspaceFolder {
  ///| The associated URI for this workspace folder.
  uri : String
  ///| The name of the workspace folder. Used to refer to this
  name : String
}

///|
pub impl @json.ToJson for WorkspaceFolder with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("uri", @json.JsonValue::String(self.uri))
  obj.set("name", @json.JsonValue::String(self.name))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkspaceFolder with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkspaceFolder")
  }
  let uri = match obj.get("uri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing uri")
  }
  let name = match obj.get("name") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing name")
  }
  WorkspaceFolder::{ uri, name }
}

///| The parameters of a `workspace/didChangeWorkspaceFolders` notification.
pub struct DidChangeWorkspaceFoldersParams {
  ///| The actual workspace folder change event.
  event : WorkspaceFoldersChangeEvent
}

///|
pub impl @json.ToJson for DidChangeWorkspaceFoldersParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("event", self.event.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DidChangeWorkspaceFoldersParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DidChangeWorkspaceFoldersParams")
  }
  let event = match obj.get("event") {
    Some(v) => WorkspaceFoldersChangeEvent::from_json(v)
    None => raise @json.JsonError("missing event")
  }
  DidChangeWorkspaceFoldersParams::{ event }
}

///| The parameters of a configuration request.
pub struct ConfigurationParams {
  items : Array[ConfigurationItem]
}

///|
pub impl @json.ToJson for ConfigurationParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("items", @json.JsonValue::Array(self.items.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ConfigurationParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ConfigurationParams")
  }
  let items = match obj.get("items") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { ConfigurationItem::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing items")
  }
  ConfigurationParams::{ items }
}

///| Parameters for a {@link DocumentColorRequest}.
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct DocumentColorParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
  ///| The text document.
  text_document : TextDocumentIdentifier
}

///|
pub impl @json.ToJson for DocumentColorParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  obj.set("textDocument", self.text_document.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentColorParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentColorParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  DocumentColorParams::{ work_done_token, partial_result_token, text_document }
}

///| Represents a color range from a document.
pub struct ColorInformation {
  ///| The range in the document where this color appears.
  range : Range
  ///| The actual color value for this color range.
  color : Color
}

///|
pub impl @json.ToJson for ColorInformation with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("range", self.range.to_json())
  obj.set("color", self.color.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ColorInformation with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ColorInformation")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  let color = match obj.get("color") {
    Some(v) => Color::from_json(v)
    None => raise @json.JsonError("missing color")
  }
  ColorInformation::{ range, color }
}

///| Extends: TextDocumentRegistrationOptions, DocumentColorOptions
///| Mixins: StaticRegistrationOptions
pub struct DocumentColorRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
  ///| The id used to register the request. The id can be used to deregister
  id : String?
}

///|
pub impl @json.ToJson for DocumentColorRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.id {
    Some(v) => obj.set("id", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentColorRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentColorRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let id : String? = match obj.get("id") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  DocumentColorRegistrationOptions::{ document_selector, work_done_progress, id }
}

///| Parameters for a {@link ColorPresentationRequest}.
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct ColorPresentationParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The color to request presentations for.
  color : Color
  ///| The range where the color would be inserted. Serves as a context.
  range : Range
}

///|
pub impl @json.ToJson for ColorPresentationParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  obj.set("textDocument", self.text_document.to_json())
  obj.set("color", self.color.to_json())
  obj.set("range", self.range.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ColorPresentationParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ColorPresentationParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let color = match obj.get("color") {
    Some(v) => Color::from_json(v)
    None => raise @json.JsonError("missing color")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  ColorPresentationParams::{ work_done_token, partial_result_token, text_document, color, range }
}

pub struct ColorPresentation {
  ///| The label of this color presentation. It will be shown on the color
  label : String
  ///| An {@link TextEdit edit} which is applied to a document when selecting
  text_edit : TextEdit?
  ///| An optional array of additional {@link TextEdit text edits} that are applied when
  additional_text_edits : Array[TextEdit]?
}

///|
pub impl @json.ToJson for ColorPresentation with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("label", @json.JsonValue::String(self.label))
  match self.text_edit {
    Some(v) => obj.set("textEdit", v.to_json())
    None => ()
  }
  match self.additional_text_edits {
    Some(v) => obj.set("additionalTextEdits", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ColorPresentation with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ColorPresentation")
  }
  let label = match obj.get("label") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing label")
  }
  let text_edit : TextEdit? = match obj.get("textEdit") {
    Some(v) if not(v.is_null()) => Some(TextEdit::from_json(v))
    _ => None
  }
  let additional_text_edits : Array[TextEdit]? = match obj.get("additionalTextEdits") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { TextEdit::from_json(item) }); _ => [] })
    _ => None
  }
  ColorPresentation::{ label, text_edit, additional_text_edits }
}

pub struct WorkDoneProgressOptions {
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for WorkDoneProgressOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkDoneProgressOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkDoneProgressOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  WorkDoneProgressOptions::{ work_done_progress }
}

///| General text document registration options.
pub struct TextDocumentRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
}

///|
pub impl @json.ToJson for TextDocumentRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextDocumentRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextDocumentRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  TextDocumentRegistrationOptions::{ document_selector }
}

///| Parameters for a {@link FoldingRangeRequest}.
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct FoldingRangeParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
  ///| The text document.
  text_document : TextDocumentIdentifier
}

///|
pub impl @json.ToJson for FoldingRangeParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  obj.set("textDocument", self.text_document.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for FoldingRangeParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for FoldingRangeParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  FoldingRangeParams::{ work_done_token, partial_result_token, text_document }
}

///| Represents a folding range. To be valid, start and end line must be bigger than zero and smaller
pub struct FoldingRange {
  ///| The zero-based start line of the range to fold. The folded area starts after the line's last charact
  start_line : Int
  ///| The zero-based character offset from where the folded range starts. If not defined, defaults to the 
  start_character : Int?
  ///| The zero-based end line of the range to fold. The folded area ends with the line's last character.
  end_line : Int
  ///| The zero-based character offset before the folded range ends. If not defined, defaults to the length
  end_character : Int?
  ///| Describes the kind of the folding range such as 'comment' or 'region'. The kind
  kind : FoldingRangeKind?
  ///| The text that the client should show when the specified range is
  collapsed_text : String?
}

///|
pub impl @json.ToJson for FoldingRange with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("startLine", @json.JsonValue::Number(self.start_line.to_double()))
  match self.start_character {
    Some(v) => obj.set("startCharacter", @json.JsonValue::Number(v.to_double()))
    None => ()
  }
  obj.set("endLine", @json.JsonValue::Number(self.end_line.to_double()))
  match self.end_character {
    Some(v) => obj.set("endCharacter", @json.JsonValue::Number(v.to_double()))
    None => ()
  }
  match self.kind {
    Some(v) => obj.set("kind", v.to_json())
    None => ()
  }
  match self.collapsed_text {
    Some(v) => obj.set("collapsedText", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for FoldingRange with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for FoldingRange")
  }
  let start_line = match obj.get("startLine") {
    Some(v) => match v { @json.JsonValue::Number(n) => n.to_int(); _ => raise @json.JsonError("expected number") }
    None => raise @json.JsonError("missing startLine")
  }
  let start_character : Int? = match obj.get("startCharacter") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Number(n) => n.to_int(); _ => raise @json.JsonError("expected number") })
    _ => None
  }
  let end_line = match obj.get("endLine") {
    Some(v) => match v { @json.JsonValue::Number(n) => n.to_int(); _ => raise @json.JsonError("expected number") }
    None => raise @json.JsonError("missing endLine")
  }
  let end_character : Int? = match obj.get("endCharacter") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Number(n) => n.to_int(); _ => raise @json.JsonError("expected number") })
    _ => None
  }
  let kind : FoldingRangeKind? = match obj.get("kind") {
    Some(v) if not(v.is_null()) => Some(FoldingRangeKind::from_json(v))
    _ => None
  }
  let collapsed_text : String? = match obj.get("collapsedText") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  FoldingRange::{ start_line, start_character, end_line, end_character, kind, collapsed_text }
}

///| Extends: TextDocumentRegistrationOptions, FoldingRangeOptions
///| Mixins: StaticRegistrationOptions
pub struct FoldingRangeRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
  ///| The id used to register the request. The id can be used to deregister
  id : String?
}

///|
pub impl @json.ToJson for FoldingRangeRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.id {
    Some(v) => obj.set("id", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for FoldingRangeRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for FoldingRangeRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let id : String? = match obj.get("id") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  FoldingRangeRegistrationOptions::{ document_selector, work_done_progress, id }
}

///| Extends: TextDocumentPositionParams
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct DeclarationParams {
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The position inside the text document.
  position : Position
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
}

///|
pub impl @json.ToJson for DeclarationParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  obj.set("position", self.position.to_json())
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DeclarationParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DeclarationParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let position = match obj.get("position") {
    Some(v) => Position::from_json(v)
    None => raise @json.JsonError("missing position")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  DeclarationParams::{ text_document, position, work_done_token, partial_result_token }
}

///| Extends: DeclarationOptions, TextDocumentRegistrationOptions
///| Mixins: StaticRegistrationOptions
pub struct DeclarationRegistrationOptions {
  work_done_progress : Bool?
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  ///| The id used to register the request. The id can be used to deregister
  id : String?
}

///|
pub impl @json.ToJson for DeclarationRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  obj.set("documentSelector", self.document_selector)
  match self.id {
    Some(v) => obj.set("id", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DeclarationRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DeclarationRegistrationOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let id : String? = match obj.get("id") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  DeclarationRegistrationOptions::{ work_done_progress, document_selector, id }
}

///| A parameter literal used in selection range requests.
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct SelectionRangeParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The positions inside the text document.
  positions : Array[Position]
}

///|
pub impl @json.ToJson for SelectionRangeParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  obj.set("textDocument", self.text_document.to_json())
  obj.set("positions", @json.JsonValue::Array(self.positions.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SelectionRangeParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SelectionRangeParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let positions = match obj.get("positions") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { Position::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing positions")
  }
  SelectionRangeParams::{ work_done_token, partial_result_token, text_document, positions }
}

///| A selection range represents a part of a selection hierarchy. A selection range
pub struct SelectionRange {
  ///| The {@link Range range} of this selection range.
  range : Range
  ///| The parent selection range containing this range. Therefore `parent.range` must contain `this.range`
  parent : SelectionRange?
}

///|
pub impl @json.ToJson for SelectionRange with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("range", self.range.to_json())
  match self.parent {
    Some(v) => obj.set("parent", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SelectionRange with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SelectionRange")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  let parent : SelectionRange? = match obj.get("parent") {
    Some(v) if not(v.is_null()) => Some(SelectionRange::from_json(v))
    _ => None
  }
  SelectionRange::{ range, parent }
}

///| Extends: SelectionRangeOptions, TextDocumentRegistrationOptions
///| Mixins: StaticRegistrationOptions
pub struct SelectionRangeRegistrationOptions {
  work_done_progress : Bool?
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  ///| The id used to register the request. The id can be used to deregister
  id : String?
}

///|
pub impl @json.ToJson for SelectionRangeRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  obj.set("documentSelector", self.document_selector)
  match self.id {
    Some(v) => obj.set("id", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SelectionRangeRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SelectionRangeRegistrationOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let id : String? = match obj.get("id") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  SelectionRangeRegistrationOptions::{ work_done_progress, document_selector, id }
}

pub struct WorkDoneProgressCreateParams {
  ///| The token to be used to report progress.
  token : ProgressToken
}

///|
pub impl @json.ToJson for WorkDoneProgressCreateParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("token", self.token.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkDoneProgressCreateParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkDoneProgressCreateParams")
  }
  let token = match obj.get("token") {
    Some(v) => ProgressToken::from_json(v)
    None => raise @json.JsonError("missing token")
  }
  WorkDoneProgressCreateParams::{ token }
}

pub struct WorkDoneProgressCancelParams {
  ///| The token to be used to report progress.
  token : ProgressToken
}

///|
pub impl @json.ToJson for WorkDoneProgressCancelParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("token", self.token.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkDoneProgressCancelParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkDoneProgressCancelParams")
  }
  let token = match obj.get("token") {
    Some(v) => ProgressToken::from_json(v)
    None => raise @json.JsonError("missing token")
  }
  WorkDoneProgressCancelParams::{ token }
}

///| The parameter of a `textDocument/prepareCallHierarchy` request.
///| Extends: TextDocumentPositionParams
///| Mixins: WorkDoneProgressParams
pub struct CallHierarchyPrepareParams {
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The position inside the text document.
  position : Position
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
}

///|
pub impl @json.ToJson for CallHierarchyPrepareParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  obj.set("position", self.position.to_json())
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CallHierarchyPrepareParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CallHierarchyPrepareParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let position = match obj.get("position") {
    Some(v) => Position::from_json(v)
    None => raise @json.JsonError("missing position")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  CallHierarchyPrepareParams::{ text_document, position, work_done_token }
}

///| Represents programming constructs like functions or constructors in the context
pub struct CallHierarchyItem {
  ///| The name of this item.
  name : String
  ///| The kind of this item.
  kind : SymbolKind
  ///| Tags for this item.
  tags : Array[SymbolTag]?
  ///| More detail for this item, e.g. the signature of a function.
  detail : String?
  ///| The resource identifier of this item.
  uri : String
  ///| The range enclosing this symbol not including leading/trailing whitespace but everything else, e.g. 
  range : Range
  ///| The range that should be selected and revealed when this symbol is being picked, e.g. the name of a 
  selection_range : Range
  ///| A data entry field that is preserved between a call hierarchy prepare and
  data : LSPAny?
}

///|
pub impl @json.ToJson for CallHierarchyItem with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("name", @json.JsonValue::String(self.name))
  obj.set("kind", self.kind.to_json())
  match self.tags {
    Some(v) => obj.set("tags", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  match self.detail {
    Some(v) => obj.set("detail", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("uri", @json.JsonValue::String(self.uri))
  obj.set("range", self.range.to_json())
  obj.set("selectionRange", self.selection_range.to_json())
  match self.data {
    Some(v) => obj.set("data", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CallHierarchyItem with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CallHierarchyItem")
  }
  let name = match obj.get("name") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing name")
  }
  let kind = match obj.get("kind") {
    Some(v) => SymbolKind::from_json(v)
    None => raise @json.JsonError("missing kind")
  }
  let tags : Array[SymbolTag]? = match obj.get("tags") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { SymbolTag::from_json(item) }); _ => [] })
    _ => None
  }
  let detail : String? = match obj.get("detail") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let uri = match obj.get("uri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing uri")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  let selection_range = match obj.get("selectionRange") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing selectionRange")
  }
  let data : LSPAny? = match obj.get("data") {
    Some(v) if not(v.is_null()) => Some(LSPAny::from_json(v))
    _ => None
  }
  CallHierarchyItem::{ name, kind, tags, detail, uri, range, selection_range, data }
}

///| Call hierarchy options used during static or dynamic registration.
///| Extends: TextDocumentRegistrationOptions, CallHierarchyOptions
///| Mixins: StaticRegistrationOptions
pub struct CallHierarchyRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
  ///| The id used to register the request. The id can be used to deregister
  id : String?
}

///|
pub impl @json.ToJson for CallHierarchyRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.id {
    Some(v) => obj.set("id", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CallHierarchyRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CallHierarchyRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let id : String? = match obj.get("id") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  CallHierarchyRegistrationOptions::{ document_selector, work_done_progress, id }
}

///| The parameter of a `callHierarchy/incomingCalls` request.
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct CallHierarchyIncomingCallsParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
  item : CallHierarchyItem
}

///|
pub impl @json.ToJson for CallHierarchyIncomingCallsParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  obj.set("item", self.item.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CallHierarchyIncomingCallsParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CallHierarchyIncomingCallsParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let item = match obj.get("item") {
    Some(v) => CallHierarchyItem::from_json(v)
    None => raise @json.JsonError("missing item")
  }
  CallHierarchyIncomingCallsParams::{ work_done_token, partial_result_token, item }
}

///| Represents an incoming call, e.g. a caller of a method or constructor.
pub struct CallHierarchyIncomingCall {
  ///| The item that makes the call.
  from : CallHierarchyItem
  ///| The ranges at which the calls appear. This is relative to the caller
  from_ranges : Array[Range]
}

///|
pub impl @json.ToJson for CallHierarchyIncomingCall with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("from", self.from.to_json())
  obj.set("fromRanges", @json.JsonValue::Array(self.from_ranges.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CallHierarchyIncomingCall with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CallHierarchyIncomingCall")
  }
  let from = match obj.get("from") {
    Some(v) => CallHierarchyItem::from_json(v)
    None => raise @json.JsonError("missing from")
  }
  let from_ranges = match obj.get("fromRanges") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { Range::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing fromRanges")
  }
  CallHierarchyIncomingCall::{ from, from_ranges }
}

///| The parameter of a `callHierarchy/outgoingCalls` request.
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct CallHierarchyOutgoingCallsParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
  item : CallHierarchyItem
}

///|
pub impl @json.ToJson for CallHierarchyOutgoingCallsParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  obj.set("item", self.item.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CallHierarchyOutgoingCallsParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CallHierarchyOutgoingCallsParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let item = match obj.get("item") {
    Some(v) => CallHierarchyItem::from_json(v)
    None => raise @json.JsonError("missing item")
  }
  CallHierarchyOutgoingCallsParams::{ work_done_token, partial_result_token, item }
}

///| Represents an outgoing call, e.g. calling a getter from a method or a method from a constructor etc.
pub struct CallHierarchyOutgoingCall {
  ///| The item that is called.
  to : CallHierarchyItem
  ///| The range at which this item is called. This is the range relative to the caller, e.g the item
  from_ranges : Array[Range]
}

///|
pub impl @json.ToJson for CallHierarchyOutgoingCall with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("to", self.to.to_json())
  obj.set("fromRanges", @json.JsonValue::Array(self.from_ranges.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CallHierarchyOutgoingCall with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CallHierarchyOutgoingCall")
  }
  let to = match obj.get("to") {
    Some(v) => CallHierarchyItem::from_json(v)
    None => raise @json.JsonError("missing to")
  }
  let from_ranges = match obj.get("fromRanges") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { Range::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing fromRanges")
  }
  CallHierarchyOutgoingCall::{ to, from_ranges }
}

///| @since 3.16.0
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct SemanticTokensParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
  ///| The text document.
  text_document : TextDocumentIdentifier
}

///|
pub impl @json.ToJson for SemanticTokensParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  obj.set("textDocument", self.text_document.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SemanticTokensParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SemanticTokensParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  SemanticTokensParams::{ work_done_token, partial_result_token, text_document }
}

///| @since 3.16.0
pub struct SemanticTokens {
  ///| An optional result id. If provided and clients support delta updating
  result_id : String?
  ///| The actual tokens.
  data : Array[Int]
}

///|
pub impl @json.ToJson for SemanticTokens with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.result_id {
    Some(v) => obj.set("resultId", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("data", @json.JsonValue::Array(self.data.map(fn(item) { @json.JsonValue::Number(item.to_double()) })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SemanticTokens with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SemanticTokens")
  }
  let result_id : String? = match obj.get("resultId") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let data = match obj.get("data") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::Number(n) => n.to_int(); _ => 0 } }); _ => [] }
    None => raise @json.JsonError("missing data")
  }
  SemanticTokens::{ result_id, data }
}

///| @since 3.16.0
pub struct SemanticTokensPartialResult {
  data : Array[Int]
}

///|
pub impl @json.ToJson for SemanticTokensPartialResult with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("data", @json.JsonValue::Array(self.data.map(fn(item) { @json.JsonValue::Number(item.to_double()) })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SemanticTokensPartialResult with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SemanticTokensPartialResult")
  }
  let data = match obj.get("data") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::Number(n) => n.to_int(); _ => 0 } }); _ => [] }
    None => raise @json.JsonError("missing data")
  }
  SemanticTokensPartialResult::{ data }
}

///| @since 3.16.0
///| Extends: TextDocumentRegistrationOptions, SemanticTokensOptions
///| Mixins: StaticRegistrationOptions
pub struct SemanticTokensRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
  ///| The legend used by the server
  legend : SemanticTokensLegend
  ///| Server supports providing semantic tokens for a specific range
  range : @json.JsonValue?
  ///| Server supports providing semantic tokens for a full document.
  full : @json.JsonValue?
  ///| The id used to register the request. The id can be used to deregister
  id : String?
}

///|
pub impl @json.ToJson for SemanticTokensRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  obj.set("legend", self.legend.to_json())
  match self.range {
    Some(v) => obj.set("range", v)
    None => ()
  }
  match self.full {
    Some(v) => obj.set("full", v)
    None => ()
  }
  match self.id {
    Some(v) => obj.set("id", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SemanticTokensRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SemanticTokensRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let legend = match obj.get("legend") {
    Some(v) => SemanticTokensLegend::from_json(v)
    None => raise @json.JsonError("missing legend")
  }
  let range : @json.JsonValue? = obj.get("range")
  let full : @json.JsonValue? = obj.get("full")
  let id : String? = match obj.get("id") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  SemanticTokensRegistrationOptions::{ document_selector, work_done_progress, legend, range, full, id }
}

///| @since 3.16.0
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct SemanticTokensDeltaParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The result id of a previous response. The result Id can either point to a full response
  previous_result_id : String
}

///|
pub impl @json.ToJson for SemanticTokensDeltaParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  obj.set("textDocument", self.text_document.to_json())
  obj.set("previousResultId", @json.JsonValue::String(self.previous_result_id))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SemanticTokensDeltaParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SemanticTokensDeltaParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let previous_result_id = match obj.get("previousResultId") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing previousResultId")
  }
  SemanticTokensDeltaParams::{ work_done_token, partial_result_token, text_document, previous_result_id }
}

///| @since 3.16.0
pub struct SemanticTokensDelta {
  result_id : String?
  ///| The semantic token edits to transform a previous result into a new result.
  edits : Array[SemanticTokensEdit]
}

///|
pub impl @json.ToJson for SemanticTokensDelta with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.result_id {
    Some(v) => obj.set("resultId", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("edits", @json.JsonValue::Array(self.edits.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SemanticTokensDelta with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SemanticTokensDelta")
  }
  let result_id : String? = match obj.get("resultId") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let edits = match obj.get("edits") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { SemanticTokensEdit::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing edits")
  }
  SemanticTokensDelta::{ result_id, edits }
}

///| @since 3.16.0
pub struct SemanticTokensDeltaPartialResult {
  edits : Array[SemanticTokensEdit]
}

///|
pub impl @json.ToJson for SemanticTokensDeltaPartialResult with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("edits", @json.JsonValue::Array(self.edits.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SemanticTokensDeltaPartialResult with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SemanticTokensDeltaPartialResult")
  }
  let edits = match obj.get("edits") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { SemanticTokensEdit::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing edits")
  }
  SemanticTokensDeltaPartialResult::{ edits }
}

///| @since 3.16.0
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct SemanticTokensRangeParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The range the semantic tokens are requested for.
  range : Range
}

///|
pub impl @json.ToJson for SemanticTokensRangeParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  obj.set("textDocument", self.text_document.to_json())
  obj.set("range", self.range.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SemanticTokensRangeParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SemanticTokensRangeParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  SemanticTokensRangeParams::{ work_done_token, partial_result_token, text_document, range }
}

///| Params to show a resource in the UI.
pub struct ShowDocumentParams {
  ///| The uri to show.
  uri : String
  ///| Indicates to show the resource in an external program.
  external : Bool?
  ///| An optional property to indicate whether the editor
  take_focus : Bool?
  ///| An optional selection range if the document is a text
  selection : Range?
}

///|
pub impl @json.ToJson for ShowDocumentParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("uri", @json.JsonValue::String(self.uri))
  match self.external {
    Some(v) => obj.set("external", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.take_focus {
    Some(v) => obj.set("takeFocus", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.selection {
    Some(v) => obj.set("selection", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ShowDocumentParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ShowDocumentParams")
  }
  let uri = match obj.get("uri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing uri")
  }
  let external : Bool? = match obj.get("external") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let take_focus : Bool? = match obj.get("takeFocus") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let selection : Range? = match obj.get("selection") {
    Some(v) if not(v.is_null()) => Some(Range::from_json(v))
    _ => None
  }
  ShowDocumentParams::{ uri, external, take_focus, selection }
}

///| The result of a showDocument request.
pub struct ShowDocumentResult {
  ///| A boolean indicating if the show was successful.
  success : Bool
}

///|
pub impl @json.ToJson for ShowDocumentResult with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("success", @json.JsonValue::Bool(self.success))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ShowDocumentResult with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ShowDocumentResult")
  }
  let success = match obj.get("success") {
    Some(v) => match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") }
    None => raise @json.JsonError("missing success")
  }
  ShowDocumentResult::{ success }
}

///| Extends: TextDocumentPositionParams
///| Mixins: WorkDoneProgressParams
pub struct LinkedEditingRangeParams {
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The position inside the text document.
  position : Position
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
}

///|
pub impl @json.ToJson for LinkedEditingRangeParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  obj.set("position", self.position.to_json())
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for LinkedEditingRangeParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for LinkedEditingRangeParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let position = match obj.get("position") {
    Some(v) => Position::from_json(v)
    None => raise @json.JsonError("missing position")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  LinkedEditingRangeParams::{ text_document, position, work_done_token }
}

///| The result of a linked editing range request.
pub struct LinkedEditingRanges {
  ///| A list of ranges that can be edited together. The ranges must have
  ranges : Array[Range]
  ///| An optional word pattern (regular expression) that describes valid contents for
  word_pattern : String?
}

///|
pub impl @json.ToJson for LinkedEditingRanges with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("ranges", @json.JsonValue::Array(self.ranges.map(fn(item) { item.to_json() })))
  match self.word_pattern {
    Some(v) => obj.set("wordPattern", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for LinkedEditingRanges with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for LinkedEditingRanges")
  }
  let ranges = match obj.get("ranges") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { Range::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing ranges")
  }
  let word_pattern : String? = match obj.get("wordPattern") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  LinkedEditingRanges::{ ranges, word_pattern }
}

///| Extends: TextDocumentRegistrationOptions, LinkedEditingRangeOptions
///| Mixins: StaticRegistrationOptions
pub struct LinkedEditingRangeRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
  ///| The id used to register the request. The id can be used to deregister
  id : String?
}

///|
pub impl @json.ToJson for LinkedEditingRangeRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.id {
    Some(v) => obj.set("id", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for LinkedEditingRangeRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for LinkedEditingRangeRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let id : String? = match obj.get("id") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  LinkedEditingRangeRegistrationOptions::{ document_selector, work_done_progress, id }
}

///| The parameters sent in notifications/requests for user-initiated creation of
pub struct CreateFilesParams {
  ///| An array of all files/folders created in this operation.
  files : Array[FileCreate]
}

///|
pub impl @json.ToJson for CreateFilesParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("files", @json.JsonValue::Array(self.files.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CreateFilesParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CreateFilesParams")
  }
  let files = match obj.get("files") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { FileCreate::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing files")
  }
  CreateFilesParams::{ files }
}

///| A workspace edit represents changes to many resources managed in the workspace. The edit
pub struct WorkspaceEdit {
  ///| Holds changes to existing resources.
  changes : @json.JsonValue?
  ///| Depending on the client capability `workspace.workspaceEdit.resourceOperations` document changes
  document_changes : Array[@json.JsonValue]?
  ///| A map of change annotations that can be referenced in `AnnotatedTextEdit`s or create, rename and
  change_annotations : @json.JsonValue?
}

///|
pub impl @json.ToJson for WorkspaceEdit with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.changes {
    Some(v) => obj.set("changes", v)
    None => ()
  }
  match self.document_changes {
    Some(v) => obj.set("documentChanges", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  match self.change_annotations {
    Some(v) => obj.set("changeAnnotations", v)
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkspaceEdit with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkspaceEdit")
  }
  let changes : @json.JsonValue? = obj.get("changes")
  let document_changes : Array[@json.JsonValue]? = match obj.get("documentChanges") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items; _ => [] })
    _ => None
  }
  let change_annotations : @json.JsonValue? = obj.get("changeAnnotations")
  WorkspaceEdit::{ changes, document_changes, change_annotations }
}

///| The options to register for file operations.
pub struct FileOperationRegistrationOptions {
  ///| The actual filters.
  filters : Array[FileOperationFilter]
}

///|
pub impl @json.ToJson for FileOperationRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("filters", @json.JsonValue::Array(self.filters.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for FileOperationRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for FileOperationRegistrationOptions")
  }
  let filters = match obj.get("filters") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { FileOperationFilter::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing filters")
  }
  FileOperationRegistrationOptions::{ filters }
}

///| The parameters sent in notifications/requests for user-initiated renames of
pub struct RenameFilesParams {
  ///| An array of all files/folders renamed in this operation. When a folder is renamed, only
  files : Array[FileRename]
}

///|
pub impl @json.ToJson for RenameFilesParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("files", @json.JsonValue::Array(self.files.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for RenameFilesParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for RenameFilesParams")
  }
  let files = match obj.get("files") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { FileRename::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing files")
  }
  RenameFilesParams::{ files }
}

///| The parameters sent in notifications/requests for user-initiated deletes of
pub struct DeleteFilesParams {
  ///| An array of all files/folders deleted in this operation.
  files : Array[FileDelete]
}

///|
pub impl @json.ToJson for DeleteFilesParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("files", @json.JsonValue::Array(self.files.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DeleteFilesParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DeleteFilesParams")
  }
  let files = match obj.get("files") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { FileDelete::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing files")
  }
  DeleteFilesParams::{ files }
}

///| Extends: TextDocumentPositionParams
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct MonikerParams {
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The position inside the text document.
  position : Position
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
}

///|
pub impl @json.ToJson for MonikerParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  obj.set("position", self.position.to_json())
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for MonikerParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for MonikerParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let position = match obj.get("position") {
    Some(v) => Position::from_json(v)
    None => raise @json.JsonError("missing position")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  MonikerParams::{ text_document, position, work_done_token, partial_result_token }
}

///| Moniker definition to match LSIF 0.5 moniker definition.
pub struct Moniker {
  ///| The scheme of the moniker. For example tsc or .Net
  scheme : String
  ///| The identifier of the moniker. The value is opaque in LSIF however
  identifier : String
  ///| The scope in which the moniker is unique
  unique : UniquenessLevel
  ///| The moniker kind if known.
  kind : MonikerKind?
}

///|
pub impl @json.ToJson for Moniker with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("scheme", @json.JsonValue::String(self.scheme))
  obj.set("identifier", @json.JsonValue::String(self.identifier))
  obj.set("unique", self.unique.to_json())
  match self.kind {
    Some(v) => obj.set("kind", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for Moniker with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for Moniker")
  }
  let scheme = match obj.get("scheme") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing scheme")
  }
  let identifier = match obj.get("identifier") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing identifier")
  }
  let unique = match obj.get("unique") {
    Some(v) => UniquenessLevel::from_json(v)
    None => raise @json.JsonError("missing unique")
  }
  let kind : MonikerKind? = match obj.get("kind") {
    Some(v) if not(v.is_null()) => Some(MonikerKind::from_json(v))
    _ => None
  }
  Moniker::{ scheme, identifier, unique, kind }
}

///| Extends: TextDocumentRegistrationOptions, MonikerOptions
pub struct MonikerRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for MonikerRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for MonikerRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for MonikerRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  MonikerRegistrationOptions::{ document_selector, work_done_progress }
}

///| The parameter of a `textDocument/prepareTypeHierarchy` request.
///| Extends: TextDocumentPositionParams
///| Mixins: WorkDoneProgressParams
pub struct TypeHierarchyPrepareParams {
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The position inside the text document.
  position : Position
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
}

///|
pub impl @json.ToJson for TypeHierarchyPrepareParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  obj.set("position", self.position.to_json())
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TypeHierarchyPrepareParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TypeHierarchyPrepareParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let position = match obj.get("position") {
    Some(v) => Position::from_json(v)
    None => raise @json.JsonError("missing position")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  TypeHierarchyPrepareParams::{ text_document, position, work_done_token }
}

///| @since 3.17.0
pub struct TypeHierarchyItem {
  ///| The name of this item.
  name : String
  ///| The kind of this item.
  kind : SymbolKind
  ///| Tags for this item.
  tags : Array[SymbolTag]?
  ///| More detail for this item, e.g. the signature of a function.
  detail : String?
  ///| The resource identifier of this item.
  uri : String
  ///| The range enclosing this symbol not including leading/trailing whitespace
  range : Range
  ///| The range that should be selected and revealed when this symbol is being
  selection_range : Range
  ///| A data entry field that is preserved between a type hierarchy prepare and
  data : LSPAny?
}

///|
pub impl @json.ToJson for TypeHierarchyItem with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("name", @json.JsonValue::String(self.name))
  obj.set("kind", self.kind.to_json())
  match self.tags {
    Some(v) => obj.set("tags", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  match self.detail {
    Some(v) => obj.set("detail", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("uri", @json.JsonValue::String(self.uri))
  obj.set("range", self.range.to_json())
  obj.set("selectionRange", self.selection_range.to_json())
  match self.data {
    Some(v) => obj.set("data", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TypeHierarchyItem with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TypeHierarchyItem")
  }
  let name = match obj.get("name") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing name")
  }
  let kind = match obj.get("kind") {
    Some(v) => SymbolKind::from_json(v)
    None => raise @json.JsonError("missing kind")
  }
  let tags : Array[SymbolTag]? = match obj.get("tags") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { SymbolTag::from_json(item) }); _ => [] })
    _ => None
  }
  let detail : String? = match obj.get("detail") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let uri = match obj.get("uri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing uri")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  let selection_range = match obj.get("selectionRange") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing selectionRange")
  }
  let data : LSPAny? = match obj.get("data") {
    Some(v) if not(v.is_null()) => Some(LSPAny::from_json(v))
    _ => None
  }
  TypeHierarchyItem::{ name, kind, tags, detail, uri, range, selection_range, data }
}

///| Type hierarchy options used during static or dynamic registration.
///| Extends: TextDocumentRegistrationOptions, TypeHierarchyOptions
///| Mixins: StaticRegistrationOptions
pub struct TypeHierarchyRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
  ///| The id used to register the request. The id can be used to deregister
  id : String?
}

///|
pub impl @json.ToJson for TypeHierarchyRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.id {
    Some(v) => obj.set("id", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TypeHierarchyRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TypeHierarchyRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let id : String? = match obj.get("id") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  TypeHierarchyRegistrationOptions::{ document_selector, work_done_progress, id }
}

///| The parameter of a `typeHierarchy/supertypes` request.
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct TypeHierarchySupertypesParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
  item : TypeHierarchyItem
}

///|
pub impl @json.ToJson for TypeHierarchySupertypesParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  obj.set("item", self.item.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TypeHierarchySupertypesParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TypeHierarchySupertypesParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let item = match obj.get("item") {
    Some(v) => TypeHierarchyItem::from_json(v)
    None => raise @json.JsonError("missing item")
  }
  TypeHierarchySupertypesParams::{ work_done_token, partial_result_token, item }
}

///| The parameter of a `typeHierarchy/subtypes` request.
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct TypeHierarchySubtypesParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
  item : TypeHierarchyItem
}

///|
pub impl @json.ToJson for TypeHierarchySubtypesParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  obj.set("item", self.item.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TypeHierarchySubtypesParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TypeHierarchySubtypesParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let item = match obj.get("item") {
    Some(v) => TypeHierarchyItem::from_json(v)
    None => raise @json.JsonError("missing item")
  }
  TypeHierarchySubtypesParams::{ work_done_token, partial_result_token, item }
}

///| A parameter literal used in inline value requests.
///| Mixins: WorkDoneProgressParams
pub struct InlineValueParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The document range for which inline values should be computed.
  range : Range
  ///| Additional information about the context in which inline values were
  context : InlineValueContext
}

///|
pub impl @json.ToJson for InlineValueParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  obj.set("textDocument", self.text_document.to_json())
  obj.set("range", self.range.to_json())
  obj.set("context", self.context.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlineValueParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlineValueParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  let context = match obj.get("context") {
    Some(v) => InlineValueContext::from_json(v)
    None => raise @json.JsonError("missing context")
  }
  InlineValueParams::{ work_done_token, text_document, range, context }
}

///| Inline value options used during static or dynamic registration.
///| Extends: InlineValueOptions, TextDocumentRegistrationOptions
///| Mixins: StaticRegistrationOptions
pub struct InlineValueRegistrationOptions {
  work_done_progress : Bool?
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  ///| The id used to register the request. The id can be used to deregister
  id : String?
}

///|
pub impl @json.ToJson for InlineValueRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  obj.set("documentSelector", self.document_selector)
  match self.id {
    Some(v) => obj.set("id", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlineValueRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlineValueRegistrationOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let id : String? = match obj.get("id") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  InlineValueRegistrationOptions::{ work_done_progress, document_selector, id }
}

///| A parameter literal used in inlay hint requests.
///| Mixins: WorkDoneProgressParams
pub struct InlayHintParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The document range for which inlay hints should be computed.
  range : Range
}

///|
pub impl @json.ToJson for InlayHintParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  obj.set("textDocument", self.text_document.to_json())
  obj.set("range", self.range.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlayHintParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlayHintParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  InlayHintParams::{ work_done_token, text_document, range }
}

///| Inlay hint information.
pub struct InlayHint {
  ///| The position of this hint.
  position : Position
  ///| The label of this hint. A human readable string or an array of
  label : @json.JsonValue
  ///| The kind of this hint. Can be omitted in which case the client
  kind : InlayHintKind?
  ///| Optional text edits that are performed when accepting this inlay hint.
  text_edits : Array[TextEdit]?
  ///| The tooltip text when you hover over this item.
  tooltip : @json.JsonValue?
  ///| Render padding before the hint.
  padding_left : Bool?
  ///| Render padding after the hint.
  padding_right : Bool?
  ///| A data entry field that is preserved on an inlay hint between
  data : LSPAny?
}

///|
pub impl @json.ToJson for InlayHint with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("position", self.position.to_json())
  obj.set("label", self.label)
  match self.kind {
    Some(v) => obj.set("kind", v.to_json())
    None => ()
  }
  match self.text_edits {
    Some(v) => obj.set("textEdits", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  match self.tooltip {
    Some(v) => obj.set("tooltip", v)
    None => ()
  }
  match self.padding_left {
    Some(v) => obj.set("paddingLeft", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.padding_right {
    Some(v) => obj.set("paddingRight", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.data {
    Some(v) => obj.set("data", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlayHint with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlayHint")
  }
  let position = match obj.get("position") {
    Some(v) => Position::from_json(v)
    None => raise @json.JsonError("missing position")
  }
  let label = match obj.get("label") {
    Some(v) => v
    None => raise @json.JsonError("missing label")
  }
  let kind : InlayHintKind? = match obj.get("kind") {
    Some(v) if not(v.is_null()) => Some(InlayHintKind::from_json(v))
    _ => None
  }
  let text_edits : Array[TextEdit]? = match obj.get("textEdits") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { TextEdit::from_json(item) }); _ => [] })
    _ => None
  }
  let tooltip : @json.JsonValue? = obj.get("tooltip")
  let padding_left : Bool? = match obj.get("paddingLeft") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let padding_right : Bool? = match obj.get("paddingRight") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let data : LSPAny? = match obj.get("data") {
    Some(v) if not(v.is_null()) => Some(LSPAny::from_json(v))
    _ => None
  }
  InlayHint::{ position, label, kind, text_edits, tooltip, padding_left, padding_right, data }
}

///| Inlay hint options used during static or dynamic registration.
///| Extends: InlayHintOptions, TextDocumentRegistrationOptions
///| Mixins: StaticRegistrationOptions
pub struct InlayHintRegistrationOptions {
  work_done_progress : Bool?
  ///| The server provides support to resolve additional
  resolve_provider : Bool?
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  ///| The id used to register the request. The id can be used to deregister
  id : String?
}

///|
pub impl @json.ToJson for InlayHintRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.resolve_provider {
    Some(v) => obj.set("resolveProvider", @json.JsonValue::Bool(v))
    None => ()
  }
  obj.set("documentSelector", self.document_selector)
  match self.id {
    Some(v) => obj.set("id", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlayHintRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlayHintRegistrationOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let resolve_provider : Bool? = match obj.get("resolveProvider") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let id : String? = match obj.get("id") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  InlayHintRegistrationOptions::{ work_done_progress, resolve_provider, document_selector, id }
}

///| Parameters of the document diagnostic request.
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct DocumentDiagnosticParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The additional identifier  provided during registration.
  identifier : String?
  ///| The result id of a previous response if provided.
  previous_result_id : String?
}

///|
pub impl @json.ToJson for DocumentDiagnosticParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  obj.set("textDocument", self.text_document.to_json())
  match self.identifier {
    Some(v) => obj.set("identifier", @json.JsonValue::String(v))
    None => ()
  }
  match self.previous_result_id {
    Some(v) => obj.set("previousResultId", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentDiagnosticParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentDiagnosticParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let identifier : String? = match obj.get("identifier") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let previous_result_id : String? = match obj.get("previousResultId") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  DocumentDiagnosticParams::{ work_done_token, partial_result_token, text_document, identifier, previous_result_id }
}

///| A partial result for a document diagnostic report.
pub struct DocumentDiagnosticReportPartialResult {
  related_documents : @json.JsonValue
}

///|
pub impl @json.ToJson for DocumentDiagnosticReportPartialResult with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("relatedDocuments", self.related_documents)
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentDiagnosticReportPartialResult with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentDiagnosticReportPartialResult")
  }
  let related_documents = match obj.get("relatedDocuments") {
    Some(v) => v
    None => raise @json.JsonError("missing relatedDocuments")
  }
  DocumentDiagnosticReportPartialResult::{ related_documents }
}

///| Cancellation data returned from a diagnostic request.
pub struct DiagnosticServerCancellationData {
  retrigger_request : Bool
}

///|
pub impl @json.ToJson for DiagnosticServerCancellationData with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("retriggerRequest", @json.JsonValue::Bool(self.retrigger_request))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DiagnosticServerCancellationData with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DiagnosticServerCancellationData")
  }
  let retrigger_request = match obj.get("retriggerRequest") {
    Some(v) => match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") }
    None => raise @json.JsonError("missing retriggerRequest")
  }
  DiagnosticServerCancellationData::{ retrigger_request }
}

///| Diagnostic registration options.
///| Extends: TextDocumentRegistrationOptions, DiagnosticOptions
///| Mixins: StaticRegistrationOptions
pub struct DiagnosticRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
  ///| An optional identifier under which the diagnostics are
  identifier : String?
  ///| Whether the language has inter file dependencies meaning that
  inter_file_dependencies : Bool
  ///| The server provides support for workspace diagnostics as well.
  workspace_diagnostics : Bool
  ///| The id used to register the request. The id can be used to deregister
  id : String?
}

///|
pub impl @json.ToJson for DiagnosticRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.identifier {
    Some(v) => obj.set("identifier", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("interFileDependencies", @json.JsonValue::Bool(self.inter_file_dependencies))
  obj.set("workspaceDiagnostics", @json.JsonValue::Bool(self.workspace_diagnostics))
  match self.id {
    Some(v) => obj.set("id", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DiagnosticRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DiagnosticRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let identifier : String? = match obj.get("identifier") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let inter_file_dependencies = match obj.get("interFileDependencies") {
    Some(v) => match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") }
    None => raise @json.JsonError("missing interFileDependencies")
  }
  let workspace_diagnostics = match obj.get("workspaceDiagnostics") {
    Some(v) => match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") }
    None => raise @json.JsonError("missing workspaceDiagnostics")
  }
  let id : String? = match obj.get("id") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  DiagnosticRegistrationOptions::{ document_selector, work_done_progress, identifier, inter_file_dependencies, workspace_diagnostics, id }
}

///| Parameters of the workspace diagnostic request.
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct WorkspaceDiagnosticParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
  ///| The additional identifier provided during registration.
  identifier : String?
  ///| The currently known diagnostic reports with their
  previous_result_ids : Array[PreviousResultId]
}

///|
pub impl @json.ToJson for WorkspaceDiagnosticParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  match self.identifier {
    Some(v) => obj.set("identifier", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("previousResultIds", @json.JsonValue::Array(self.previous_result_ids.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkspaceDiagnosticParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkspaceDiagnosticParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let identifier : String? = match obj.get("identifier") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let previous_result_ids = match obj.get("previousResultIds") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { PreviousResultId::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing previousResultIds")
  }
  WorkspaceDiagnosticParams::{ work_done_token, partial_result_token, identifier, previous_result_ids }
}

///| A workspace diagnostic report.
pub struct WorkspaceDiagnosticReport {
  items : Array[WorkspaceDocumentDiagnosticReport]
}

///|
pub impl @json.ToJson for WorkspaceDiagnosticReport with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("items", @json.JsonValue::Array(self.items.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkspaceDiagnosticReport with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkspaceDiagnosticReport")
  }
  let items = match obj.get("items") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { WorkspaceDocumentDiagnosticReport::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing items")
  }
  WorkspaceDiagnosticReport::{ items }
}

///| A partial result for a workspace diagnostic report.
pub struct WorkspaceDiagnosticReportPartialResult {
  items : Array[WorkspaceDocumentDiagnosticReport]
}

///|
pub impl @json.ToJson for WorkspaceDiagnosticReportPartialResult with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("items", @json.JsonValue::Array(self.items.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkspaceDiagnosticReportPartialResult with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkspaceDiagnosticReportPartialResult")
  }
  let items = match obj.get("items") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { WorkspaceDocumentDiagnosticReport::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing items")
  }
  WorkspaceDiagnosticReportPartialResult::{ items }
}

///| The params sent in an open notebook document notification.
pub struct DidOpenNotebookDocumentParams {
  ///| The notebook document that got opened.
  notebook_document : NotebookDocument
  ///| The text documents that represent the content
  cell_text_documents : Array[TextDocumentItem]
}

///|
pub impl @json.ToJson for DidOpenNotebookDocumentParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("notebookDocument", self.notebook_document.to_json())
  obj.set("cellTextDocuments", @json.JsonValue::Array(self.cell_text_documents.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DidOpenNotebookDocumentParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DidOpenNotebookDocumentParams")
  }
  let notebook_document = match obj.get("notebookDocument") {
    Some(v) => NotebookDocument::from_json(v)
    None => raise @json.JsonError("missing notebookDocument")
  }
  let cell_text_documents = match obj.get("cellTextDocuments") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { TextDocumentItem::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing cellTextDocuments")
  }
  DidOpenNotebookDocumentParams::{ notebook_document, cell_text_documents }
}

///| Registration options specific to a notebook.
///| Extends: NotebookDocumentSyncOptions
///| Mixins: StaticRegistrationOptions
pub struct NotebookDocumentSyncRegistrationOptions {
  ///| The notebooks to be synced
  notebook_selector : Array[@json.JsonValue]
  ///| Whether save notification should be forwarded to
  save : Bool?
  ///| The id used to register the request. The id can be used to deregister
  id : String?
}

///|
pub impl @json.ToJson for NotebookDocumentSyncRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("notebookSelector", @json.JsonValue::Array(self.notebook_selector.map(fn(item) { item.to_json() })))
  match self.save {
    Some(v) => obj.set("save", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.id {
    Some(v) => obj.set("id", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for NotebookDocumentSyncRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for NotebookDocumentSyncRegistrationOptions")
  }
  let notebook_selector = match obj.get("notebookSelector") {
    Some(v) => match v { @json.JsonValue::Array(items) => items; _ => [] }
    None => raise @json.JsonError("missing notebookSelector")
  }
  let save : Bool? = match obj.get("save") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let id : String? = match obj.get("id") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  NotebookDocumentSyncRegistrationOptions::{ notebook_selector, save, id }
}

///| The params sent in a change notebook document notification.
pub struct DidChangeNotebookDocumentParams {
  ///| The notebook document that did change. The version number points
  notebook_document : VersionedNotebookDocumentIdentifier
  ///| The actual changes to the notebook document.
  change : NotebookDocumentChangeEvent
}

///|
pub impl @json.ToJson for DidChangeNotebookDocumentParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("notebookDocument", self.notebook_document.to_json())
  obj.set("change", self.change.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DidChangeNotebookDocumentParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DidChangeNotebookDocumentParams")
  }
  let notebook_document = match obj.get("notebookDocument") {
    Some(v) => VersionedNotebookDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing notebookDocument")
  }
  let change = match obj.get("change") {
    Some(v) => NotebookDocumentChangeEvent::from_json(v)
    None => raise @json.JsonError("missing change")
  }
  DidChangeNotebookDocumentParams::{ notebook_document, change }
}

///| The params sent in a save notebook document notification.
pub struct DidSaveNotebookDocumentParams {
  ///| The notebook document that got saved.
  notebook_document : NotebookDocumentIdentifier
}

///|
pub impl @json.ToJson for DidSaveNotebookDocumentParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("notebookDocument", self.notebook_document.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DidSaveNotebookDocumentParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DidSaveNotebookDocumentParams")
  }
  let notebook_document = match obj.get("notebookDocument") {
    Some(v) => NotebookDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing notebookDocument")
  }
  DidSaveNotebookDocumentParams::{ notebook_document }
}

///| The params sent in a close notebook document notification.
pub struct DidCloseNotebookDocumentParams {
  ///| The notebook document that got closed.
  notebook_document : NotebookDocumentIdentifier
  ///| The text documents that represent the content
  cell_text_documents : Array[TextDocumentIdentifier]
}

///|
pub impl @json.ToJson for DidCloseNotebookDocumentParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("notebookDocument", self.notebook_document.to_json())
  obj.set("cellTextDocuments", @json.JsonValue::Array(self.cell_text_documents.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DidCloseNotebookDocumentParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DidCloseNotebookDocumentParams")
  }
  let notebook_document = match obj.get("notebookDocument") {
    Some(v) => NotebookDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing notebookDocument")
  }
  let cell_text_documents = match obj.get("cellTextDocuments") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { TextDocumentIdentifier::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing cellTextDocuments")
  }
  DidCloseNotebookDocumentParams::{ notebook_document, cell_text_documents }
}

///| A parameter literal used in inline completion requests.
///| Extends: TextDocumentPositionParams
///| Mixins: WorkDoneProgressParams
pub struct InlineCompletionParams {
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The position inside the text document.
  position : Position
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| Additional information about the context in which inline completions were
  context : InlineCompletionContext
}

///|
pub impl @json.ToJson for InlineCompletionParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  obj.set("position", self.position.to_json())
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  obj.set("context", self.context.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlineCompletionParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlineCompletionParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let position = match obj.get("position") {
    Some(v) => Position::from_json(v)
    None => raise @json.JsonError("missing position")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let context = match obj.get("context") {
    Some(v) => InlineCompletionContext::from_json(v)
    None => raise @json.JsonError("missing context")
  }
  InlineCompletionParams::{ text_document, position, work_done_token, context }
}

///| Represents a collection of {@link InlineCompletionItem inline completion items} to be presented in t
pub struct InlineCompletionList {
  ///| The inline completion items
  items : Array[InlineCompletionItem]
}

///|
pub impl @json.ToJson for InlineCompletionList with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("items", @json.JsonValue::Array(self.items.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlineCompletionList with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlineCompletionList")
  }
  let items = match obj.get("items") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { InlineCompletionItem::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing items")
  }
  InlineCompletionList::{ items }
}

///| An inline completion item represents a text snippet that is proposed inline to complete text that is
pub struct InlineCompletionItem {
  ///| The text to replace the range with. Must be set.
  insert_text : @json.JsonValue
  ///| A text that is used to decide if this inline completion should be shown. When `falsy` the {@link Inl
  filter_text : String?
  ///| The range to replace. Must begin and end on the same line.
  range : Range?
  ///| An optional {@link Command} that is executed *after* inserting this completion.
  command : Command?
}

///|
pub impl @json.ToJson for InlineCompletionItem with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("insertText", self.insert_text)
  match self.filter_text {
    Some(v) => obj.set("filterText", @json.JsonValue::String(v))
    None => ()
  }
  match self.range {
    Some(v) => obj.set("range", v.to_json())
    None => ()
  }
  match self.command {
    Some(v) => obj.set("command", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlineCompletionItem with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlineCompletionItem")
  }
  let insert_text = match obj.get("insertText") {
    Some(v) => v
    None => raise @json.JsonError("missing insertText")
  }
  let filter_text : String? = match obj.get("filterText") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let range : Range? = match obj.get("range") {
    Some(v) if not(v.is_null()) => Some(Range::from_json(v))
    _ => None
  }
  let command : Command? = match obj.get("command") {
    Some(v) if not(v.is_null()) => Some(Command::from_json(v))
    _ => None
  }
  InlineCompletionItem::{ insert_text, filter_text, range, command }
}

///| Inline completion options used during static or dynamic registration.
///| Extends: InlineCompletionOptions, TextDocumentRegistrationOptions
///| Mixins: StaticRegistrationOptions
pub struct InlineCompletionRegistrationOptions {
  work_done_progress : Bool?
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  ///| The id used to register the request. The id can be used to deregister
  id : String?
}

///|
pub impl @json.ToJson for InlineCompletionRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  obj.set("documentSelector", self.document_selector)
  match self.id {
    Some(v) => obj.set("id", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlineCompletionRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlineCompletionRegistrationOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let id : String? = match obj.get("id") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  InlineCompletionRegistrationOptions::{ work_done_progress, document_selector, id }
}

///| Parameters for the `workspace/textDocumentContent` request.
pub struct TextDocumentContentParams {
  ///| The uri of the text document.
  uri : String
}

///|
pub impl @json.ToJson for TextDocumentContentParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("uri", @json.JsonValue::String(self.uri))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextDocumentContentParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextDocumentContentParams")
  }
  let uri = match obj.get("uri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing uri")
  }
  TextDocumentContentParams::{ uri }
}

///| Result of the `workspace/textDocumentContent` request.
pub struct TextDocumentContentResult {
  ///| The text content of the text document. Please note, that the content of
  text : String
}

///|
pub impl @json.ToJson for TextDocumentContentResult with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("text", @json.JsonValue::String(self.text))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextDocumentContentResult with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextDocumentContentResult")
  }
  let text = match obj.get("text") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing text")
  }
  TextDocumentContentResult::{ text }
}

///| Text document content provider registration options.
///| Extends: TextDocumentContentOptions
///| Mixins: StaticRegistrationOptions
pub struct TextDocumentContentRegistrationOptions {
  ///| The schemes for which the server provides content.
  schemes : Array[String]
  ///| The id used to register the request. The id can be used to deregister
  id : String?
}

///|
pub impl @json.ToJson for TextDocumentContentRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("schemes", @json.JsonValue::Array(self.schemes.map(fn(item) { @json.JsonValue::String(item) })))
  match self.id {
    Some(v) => obj.set("id", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextDocumentContentRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextDocumentContentRegistrationOptions")
  }
  let schemes = match obj.get("schemes") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] }
    None => raise @json.JsonError("missing schemes")
  }
  let id : String? = match obj.get("id") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  TextDocumentContentRegistrationOptions::{ schemes, id }
}

///| Parameters for the `workspace/textDocumentContent/refresh` request.
pub struct TextDocumentContentRefreshParams {
  ///| The uri of the text document to refresh.
  uri : String
}

///|
pub impl @json.ToJson for TextDocumentContentRefreshParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("uri", @json.JsonValue::String(self.uri))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextDocumentContentRefreshParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextDocumentContentRefreshParams")
  }
  let uri = match obj.get("uri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing uri")
  }
  TextDocumentContentRefreshParams::{ uri }
}

pub struct RegistrationParams {
  registrations : Array[Registration]
}

///|
pub impl @json.ToJson for RegistrationParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("registrations", @json.JsonValue::Array(self.registrations.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for RegistrationParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for RegistrationParams")
  }
  let registrations = match obj.get("registrations") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { Registration::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing registrations")
  }
  RegistrationParams::{ registrations }
}

pub struct UnregistrationParams {
  unregisterations : Array[Unregistration]
}

///|
pub impl @json.ToJson for UnregistrationParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("unregisterations", @json.JsonValue::Array(self.unregisterations.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for UnregistrationParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for UnregistrationParams")
  }
  let unregisterations = match obj.get("unregisterations") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { Unregistration::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing unregisterations")
  }
  UnregistrationParams::{ unregisterations }
}

///| Extends: InitializeParams, WorkspaceFoldersInitializeParams
pub struct InitializeParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| The process Id of the parent process that started
  process_id : @json.JsonValue
  ///| Information about the client
  client_info : ClientInfo?
  ///| The locale the client is currently showing the user interface
  locale : String?
  ///| The rootPath of the workspace. Is null
  root_path : @json.JsonValue?
  ///| The rootUri of the workspace. Is null if no
  root_uri : @json.JsonValue
  ///| The capabilities provided by the client (editor or tool)
  capabilities : ClientCapabilities
  ///| User provided initialization options.
  initialization_options : LSPAny?
  ///| The initial trace setting. If omitted trace is disabled ('off').
  trace : TraceValue?
  ///| The workspace folders configured in the client when the server starts.
  workspace_folders : @json.JsonValue?
}

///|
pub impl @json.ToJson for InitializeParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  obj.set("processId", self.process_id)
  match self.client_info {
    Some(v) => obj.set("clientInfo", v.to_json())
    None => ()
  }
  match self.locale {
    Some(v) => obj.set("locale", @json.JsonValue::String(v))
    None => ()
  }
  match self.root_path {
    Some(v) => obj.set("rootPath", v)
    None => ()
  }
  obj.set("rootUri", self.root_uri)
  obj.set("capabilities", self.capabilities.to_json())
  match self.initialization_options {
    Some(v) => obj.set("initializationOptions", v.to_json())
    None => ()
  }
  match self.trace {
    Some(v) => obj.set("trace", v.to_json())
    None => ()
  }
  match self.workspace_folders {
    Some(v) => obj.set("workspaceFolders", v)
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InitializeParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InitializeParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let process_id = match obj.get("processId") {
    Some(v) => v
    None => raise @json.JsonError("missing processId")
  }
  let client_info : ClientInfo? = match obj.get("clientInfo") {
    Some(v) if not(v.is_null()) => Some(ClientInfo::from_json(v))
    _ => None
  }
  let locale : String? = match obj.get("locale") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let root_path : @json.JsonValue? = obj.get("rootPath")
  let root_uri = match obj.get("rootUri") {
    Some(v) => v
    None => raise @json.JsonError("missing rootUri")
  }
  let capabilities = match obj.get("capabilities") {
    Some(v) => ClientCapabilities::from_json(v)
    None => raise @json.JsonError("missing capabilities")
  }
  let initialization_options : LSPAny? = match obj.get("initializationOptions") {
    Some(v) if not(v.is_null()) => Some(LSPAny::from_json(v))
    _ => None
  }
  let trace : TraceValue? = match obj.get("trace") {
    Some(v) if not(v.is_null()) => Some(TraceValue::from_json(v))
    _ => None
  }
  let workspace_folders : @json.JsonValue? = obj.get("workspaceFolders")
  InitializeParams::{ work_done_token, process_id, client_info, locale, root_path, root_uri, capabilities, initialization_options, trace, workspace_folders }
}

///| The result returned from an initialize request.
pub struct InitializeResult {
  ///| The capabilities the language server provides.
  capabilities : ServerCapabilities
  ///| Information about the server.
  server_info : ServerInfo?
}

///|
pub impl @json.ToJson for InitializeResult with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("capabilities", self.capabilities.to_json())
  match self.server_info {
    Some(v) => obj.set("serverInfo", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InitializeResult with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InitializeResult")
  }
  let capabilities = match obj.get("capabilities") {
    Some(v) => ServerCapabilities::from_json(v)
    None => raise @json.JsonError("missing capabilities")
  }
  let server_info : ServerInfo? = match obj.get("serverInfo") {
    Some(v) if not(v.is_null()) => Some(ServerInfo::from_json(v))
    _ => None
  }
  InitializeResult::{ capabilities, server_info }
}

///| The data type of the ResponseError if the
pub struct InitializeError {
  ///| Indicates whether the client execute the following retry logic:
  retry : Bool
}

///|
pub impl @json.ToJson for InitializeError with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("retry", @json.JsonValue::Bool(self.retry))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InitializeError with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InitializeError")
  }
  let retry = match obj.get("retry") {
    Some(v) => match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") }
    None => raise @json.JsonError("missing retry")
  }
  InitializeError::{ retry }
}

pub struct InitializedParams {
}

///|
pub impl @json.ToJson for InitializedParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InitializedParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InitializedParams")
  }
  InitializedParams::{  }
}

///| The parameters of a change configuration notification.
pub struct DidChangeConfigurationParams {
  ///| The actual changed settings
  settings : LSPAny
}

///|
pub impl @json.ToJson for DidChangeConfigurationParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("settings", self.settings.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DidChangeConfigurationParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DidChangeConfigurationParams")
  }
  let settings = match obj.get("settings") {
    Some(v) => LSPAny::from_json(v)
    None => raise @json.JsonError("missing settings")
  }
  DidChangeConfigurationParams::{ settings }
}

pub struct DidChangeConfigurationRegistrationOptions {
  section : @json.JsonValue?
}

///|
pub impl @json.ToJson for DidChangeConfigurationRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.section {
    Some(v) => obj.set("section", v)
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DidChangeConfigurationRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DidChangeConfigurationRegistrationOptions")
  }
  let section : @json.JsonValue? = obj.get("section")
  DidChangeConfigurationRegistrationOptions::{ section }
}

///| The parameters of a notification message.
pub struct ShowMessageParams {
  ///| The message type. See {@link MessageType}
  type_ : MessageType
  ///| The actual message.
  message : String
}

///|
pub impl @json.ToJson for ShowMessageParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("type", self.type_.to_json())
  obj.set("message", @json.JsonValue::String(self.message))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ShowMessageParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ShowMessageParams")
  }
  let type_ = match obj.get("type") {
    Some(v) => MessageType::from_json(v)
    None => raise @json.JsonError("missing type")
  }
  let message = match obj.get("message") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing message")
  }
  ShowMessageParams::{ type_, message }
}

pub struct ShowMessageRequestParams {
  ///| The message type. See {@link MessageType}
  type_ : MessageType
  ///| The actual message.
  message : String
  ///| The message action items to present.
  actions : Array[MessageActionItem]?
}

///|
pub impl @json.ToJson for ShowMessageRequestParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("type", self.type_.to_json())
  obj.set("message", @json.JsonValue::String(self.message))
  match self.actions {
    Some(v) => obj.set("actions", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ShowMessageRequestParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ShowMessageRequestParams")
  }
  let type_ = match obj.get("type") {
    Some(v) => MessageType::from_json(v)
    None => raise @json.JsonError("missing type")
  }
  let message = match obj.get("message") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing message")
  }
  let actions : Array[MessageActionItem]? = match obj.get("actions") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { MessageActionItem::from_json(item) }); _ => [] })
    _ => None
  }
  ShowMessageRequestParams::{ type_, message, actions }
}

pub struct MessageActionItem {
  ///| A short title like 'Retry', 'Open Log' etc.
  title : String
}

///|
pub impl @json.ToJson for MessageActionItem with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("title", @json.JsonValue::String(self.title))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for MessageActionItem with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for MessageActionItem")
  }
  let title = match obj.get("title") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing title")
  }
  MessageActionItem::{ title }
}

///| The log message parameters.
pub struct LogMessageParams {
  ///| The message type. See {@link MessageType}
  type_ : MessageType
  ///| The actual message.
  message : String
}

///|
pub impl @json.ToJson for LogMessageParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("type", self.type_.to_json())
  obj.set("message", @json.JsonValue::String(self.message))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for LogMessageParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for LogMessageParams")
  }
  let type_ = match obj.get("type") {
    Some(v) => MessageType::from_json(v)
    None => raise @json.JsonError("missing type")
  }
  let message = match obj.get("message") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing message")
  }
  LogMessageParams::{ type_, message }
}

///| The parameters sent in an open text document notification
pub struct DidOpenTextDocumentParams {
  ///| The document that was opened.
  text_document : TextDocumentItem
}

///|
pub impl @json.ToJson for DidOpenTextDocumentParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DidOpenTextDocumentParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DidOpenTextDocumentParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentItem::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  DidOpenTextDocumentParams::{ text_document }
}

///| The change text document notification's parameters.
pub struct DidChangeTextDocumentParams {
  ///| The document that did change. The version number points
  text_document : VersionedTextDocumentIdentifier
  ///| The actual content changes. The content changes describe single state changes
  content_changes : Array[TextDocumentContentChangeEvent]
}

///|
pub impl @json.ToJson for DidChangeTextDocumentParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  obj.set("contentChanges", @json.JsonValue::Array(self.content_changes.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DidChangeTextDocumentParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DidChangeTextDocumentParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => VersionedTextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let content_changes = match obj.get("contentChanges") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { TextDocumentContentChangeEvent::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing contentChanges")
  }
  DidChangeTextDocumentParams::{ text_document, content_changes }
}

///| Describe options to be used when registered for text document change events.
///| Extends: TextDocumentRegistrationOptions
pub struct TextDocumentChangeRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  ///| How documents are synced to the server.
  sync_kind : TextDocumentSyncKind
}

///|
pub impl @json.ToJson for TextDocumentChangeRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  obj.set("syncKind", self.sync_kind.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextDocumentChangeRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextDocumentChangeRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let sync_kind = match obj.get("syncKind") {
    Some(v) => TextDocumentSyncKind::from_json(v)
    None => raise @json.JsonError("missing syncKind")
  }
  TextDocumentChangeRegistrationOptions::{ document_selector, sync_kind }
}

///| The parameters sent in a close text document notification
pub struct DidCloseTextDocumentParams {
  ///| The document that was closed.
  text_document : TextDocumentIdentifier
}

///|
pub impl @json.ToJson for DidCloseTextDocumentParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DidCloseTextDocumentParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DidCloseTextDocumentParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  DidCloseTextDocumentParams::{ text_document }
}

///| The parameters sent in a save text document notification
pub struct DidSaveTextDocumentParams {
  ///| The document that was saved.
  text_document : TextDocumentIdentifier
  ///| Optional the content when saved. Depends on the includeText value
  text : String?
}

///|
pub impl @json.ToJson for DidSaveTextDocumentParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  match self.text {
    Some(v) => obj.set("text", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DidSaveTextDocumentParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DidSaveTextDocumentParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let text : String? = match obj.get("text") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  DidSaveTextDocumentParams::{ text_document, text }
}

///| Save registration options.
///| Extends: TextDocumentRegistrationOptions, SaveOptions
pub struct TextDocumentSaveRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  ///| The client is supposed to include the content on save.
  include_text : Bool?
}

///|
pub impl @json.ToJson for TextDocumentSaveRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.include_text {
    Some(v) => obj.set("includeText", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextDocumentSaveRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextDocumentSaveRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let include_text : Bool? = match obj.get("includeText") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  TextDocumentSaveRegistrationOptions::{ document_selector, include_text }
}

///| The parameters sent in a will save text document notification.
pub struct WillSaveTextDocumentParams {
  ///| The document that will be saved.
  text_document : TextDocumentIdentifier
  ///| The 'TextDocumentSaveReason'.
  reason : TextDocumentSaveReason
}

///|
pub impl @json.ToJson for WillSaveTextDocumentParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  obj.set("reason", self.reason.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WillSaveTextDocumentParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WillSaveTextDocumentParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let reason = match obj.get("reason") {
    Some(v) => TextDocumentSaveReason::from_json(v)
    None => raise @json.JsonError("missing reason")
  }
  WillSaveTextDocumentParams::{ text_document, reason }
}

///| A text edit applicable to a text document.
pub struct TextEdit {
  ///| The range of the text document to be manipulated. To insert
  range : Range
  ///| The string to be inserted. For delete operations use an
  new_text : String
}

///|
pub impl @json.ToJson for TextEdit with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("range", self.range.to_json())
  obj.set("newText", @json.JsonValue::String(self.new_text))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextEdit with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextEdit")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  let new_text = match obj.get("newText") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing newText")
  }
  TextEdit::{ range, new_text }
}

///| The watched files change notification's parameters.
pub struct DidChangeWatchedFilesParams {
  ///| The actual file events.
  changes : Array[FileEvent]
}

///|
pub impl @json.ToJson for DidChangeWatchedFilesParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("changes", @json.JsonValue::Array(self.changes.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DidChangeWatchedFilesParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DidChangeWatchedFilesParams")
  }
  let changes = match obj.get("changes") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { FileEvent::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing changes")
  }
  DidChangeWatchedFilesParams::{ changes }
}

///| Describe options to be used when registered for text document change events.
pub struct DidChangeWatchedFilesRegistrationOptions {
  ///| The watchers to register.
  watchers : Array[FileSystemWatcher]
}

///|
pub impl @json.ToJson for DidChangeWatchedFilesRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("watchers", @json.JsonValue::Array(self.watchers.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DidChangeWatchedFilesRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DidChangeWatchedFilesRegistrationOptions")
  }
  let watchers = match obj.get("watchers") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { FileSystemWatcher::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing watchers")
  }
  DidChangeWatchedFilesRegistrationOptions::{ watchers }
}

///| Completion parameters
///| Extends: TextDocumentPositionParams
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct CompletionParams {
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The position inside the text document.
  position : Position
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
  ///| The completion context. This is only available it the client specifies
  context : CompletionContext?
}

///|
pub impl @json.ToJson for CompletionParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  obj.set("position", self.position.to_json())
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  match self.context {
    Some(v) => obj.set("context", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CompletionParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CompletionParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let position = match obj.get("position") {
    Some(v) => Position::from_json(v)
    None => raise @json.JsonError("missing position")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let context : CompletionContext? = match obj.get("context") {
    Some(v) if not(v.is_null()) => Some(CompletionContext::from_json(v))
    _ => None
  }
  CompletionParams::{ text_document, position, work_done_token, partial_result_token, context }
}

///| A completion item represents a text snippet that is
pub struct CompletionItem {
  ///| The label of this completion item.
  label : String
  ///| Additional details for the label
  label_details : CompletionItemLabelDetails?
  ///| The kind of this completion item. Based of the kind
  kind : CompletionItemKind?
  ///| Tags for this completion item.
  tags : Array[CompletionItemTag]?
  ///| A human-readable string with additional information
  detail : String?
  ///| A human-readable string that represents a doc-comment.
  documentation : @json.JsonValue?
  ///| Indicates if this item is deprecated.
  deprecated : Bool?
  ///| Select this item when showing.
  preselect : Bool?
  ///| A string that should be used when comparing this item
  sort_text : String?
  ///| A string that should be used when filtering a set of
  filter_text : String?
  ///| A string that should be inserted into a document when selecting
  insert_text : String?
  ///| The format of the insert text. The format applies to both the
  insert_text_format : InsertTextFormat?
  ///| How whitespace and indentation is handled during completion
  insert_text_mode : InsertTextMode?
  ///| An {@link TextEdit edit} which is applied to a document when selecting
  text_edit : @json.JsonValue?
  ///| The edit text used if the completion item is part of a CompletionList and
  text_edit_text : String?
  ///| An optional array of additional {@link TextEdit text edits} that are applied when
  additional_text_edits : Array[TextEdit]?
  ///| An optional set of characters that when pressed while this completion is active will accept it first
  commit_characters : Array[String]?
  ///| An optional {@link Command command} that is executed *after* inserting this completion. *Note* that
  command : Command?
  ///| A data entry field that is preserved on a completion item between a
  data : LSPAny?
}

///|
pub impl @json.ToJson for CompletionItem with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("label", @json.JsonValue::String(self.label))
  match self.label_details {
    Some(v) => obj.set("labelDetails", v.to_json())
    None => ()
  }
  match self.kind {
    Some(v) => obj.set("kind", v.to_json())
    None => ()
  }
  match self.tags {
    Some(v) => obj.set("tags", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  match self.detail {
    Some(v) => obj.set("detail", @json.JsonValue::String(v))
    None => ()
  }
  match self.documentation {
    Some(v) => obj.set("documentation", v)
    None => ()
  }
  match self.deprecated {
    Some(v) => obj.set("deprecated", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.preselect {
    Some(v) => obj.set("preselect", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.sort_text {
    Some(v) => obj.set("sortText", @json.JsonValue::String(v))
    None => ()
  }
  match self.filter_text {
    Some(v) => obj.set("filterText", @json.JsonValue::String(v))
    None => ()
  }
  match self.insert_text {
    Some(v) => obj.set("insertText", @json.JsonValue::String(v))
    None => ()
  }
  match self.insert_text_format {
    Some(v) => obj.set("insertTextFormat", v.to_json())
    None => ()
  }
  match self.insert_text_mode {
    Some(v) => obj.set("insertTextMode", v.to_json())
    None => ()
  }
  match self.text_edit {
    Some(v) => obj.set("textEdit", v)
    None => ()
  }
  match self.text_edit_text {
    Some(v) => obj.set("textEditText", @json.JsonValue::String(v))
    None => ()
  }
  match self.additional_text_edits {
    Some(v) => obj.set("additionalTextEdits", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  match self.commit_characters {
    Some(v) => obj.set("commitCharacters", @json.JsonValue::Array(v.map(fn(item) { @json.JsonValue::String(item) })))
    None => ()
  }
  match self.command {
    Some(v) => obj.set("command", v.to_json())
    None => ()
  }
  match self.data {
    Some(v) => obj.set("data", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CompletionItem with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CompletionItem")
  }
  let label = match obj.get("label") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing label")
  }
  let label_details : CompletionItemLabelDetails? = match obj.get("labelDetails") {
    Some(v) if not(v.is_null()) => Some(CompletionItemLabelDetails::from_json(v))
    _ => None
  }
  let kind : CompletionItemKind? = match obj.get("kind") {
    Some(v) if not(v.is_null()) => Some(CompletionItemKind::from_json(v))
    _ => None
  }
  let tags : Array[CompletionItemTag]? = match obj.get("tags") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { CompletionItemTag::from_json(item) }); _ => [] })
    _ => None
  }
  let detail : String? = match obj.get("detail") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let documentation : @json.JsonValue? = obj.get("documentation")
  let deprecated : Bool? = match obj.get("deprecated") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let preselect : Bool? = match obj.get("preselect") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let sort_text : String? = match obj.get("sortText") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let filter_text : String? = match obj.get("filterText") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let insert_text : String? = match obj.get("insertText") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let insert_text_format : InsertTextFormat? = match obj.get("insertTextFormat") {
    Some(v) if not(v.is_null()) => Some(InsertTextFormat::from_json(v))
    _ => None
  }
  let insert_text_mode : InsertTextMode? = match obj.get("insertTextMode") {
    Some(v) if not(v.is_null()) => Some(InsertTextMode::from_json(v))
    _ => None
  }
  let text_edit : @json.JsonValue? = obj.get("textEdit")
  let text_edit_text : String? = match obj.get("textEditText") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let additional_text_edits : Array[TextEdit]? = match obj.get("additionalTextEdits") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { TextEdit::from_json(item) }); _ => [] })
    _ => None
  }
  let commit_characters : Array[String]? = match obj.get("commitCharacters") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] })
    _ => None
  }
  let command : Command? = match obj.get("command") {
    Some(v) if not(v.is_null()) => Some(Command::from_json(v))
    _ => None
  }
  let data : LSPAny? = match obj.get("data") {
    Some(v) if not(v.is_null()) => Some(LSPAny::from_json(v))
    _ => None
  }
  CompletionItem::{ label, label_details, kind, tags, detail, documentation, deprecated, preselect, sort_text, filter_text, insert_text, insert_text_format, insert_text_mode, text_edit, text_edit_text, additional_text_edits, commit_characters, command, data }
}

///| Represents a collection of {@link CompletionItem completion items} to be presented
pub struct CompletionList {
  ///| This list it not complete. Further typing results in recomputing this list.
  is_incomplete : Bool
  ///| In many cases the items of an actual completion result share the same
  item_defaults : CompletionItemDefaults?
  ///| Specifies how fields from a completion item should be combined with those
  apply_kind : CompletionItemApplyKinds?
  ///| The completion items.
  items : Array[CompletionItem]
}

///|
pub impl @json.ToJson for CompletionList with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("isIncomplete", @json.JsonValue::Bool(self.is_incomplete))
  match self.item_defaults {
    Some(v) => obj.set("itemDefaults", v.to_json())
    None => ()
  }
  match self.apply_kind {
    Some(v) => obj.set("applyKind", v.to_json())
    None => ()
  }
  obj.set("items", @json.JsonValue::Array(self.items.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CompletionList with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CompletionList")
  }
  let is_incomplete = match obj.get("isIncomplete") {
    Some(v) => match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") }
    None => raise @json.JsonError("missing isIncomplete")
  }
  let item_defaults : CompletionItemDefaults? = match obj.get("itemDefaults") {
    Some(v) if not(v.is_null()) => Some(CompletionItemDefaults::from_json(v))
    _ => None
  }
  let apply_kind : CompletionItemApplyKinds? = match obj.get("applyKind") {
    Some(v) if not(v.is_null()) => Some(CompletionItemApplyKinds::from_json(v))
    _ => None
  }
  let items = match obj.get("items") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { CompletionItem::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing items")
  }
  CompletionList::{ is_incomplete, item_defaults, apply_kind, items }
}

///| Registration options for a {@link CompletionRequest}.
///| Extends: TextDocumentRegistrationOptions, CompletionOptions
pub struct CompletionRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
  ///| Most tools trigger completion request automatically without explicitly requesting
  trigger_characters : Array[String]?
  ///| The list of all possible characters that commit a completion. This field can be used
  all_commit_characters : Array[String]?
  ///| The server provides support to resolve additional
  resolve_provider : Bool?
  ///| The server supports the following `CompletionItem` specific
  completion_item : ServerCompletionItemOptions?
}

///|
pub impl @json.ToJson for CompletionRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.trigger_characters {
    Some(v) => obj.set("triggerCharacters", @json.JsonValue::Array(v.map(fn(item) { @json.JsonValue::String(item) })))
    None => ()
  }
  match self.all_commit_characters {
    Some(v) => obj.set("allCommitCharacters", @json.JsonValue::Array(v.map(fn(item) { @json.JsonValue::String(item) })))
    None => ()
  }
  match self.resolve_provider {
    Some(v) => obj.set("resolveProvider", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.completion_item {
    Some(v) => obj.set("completionItem", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CompletionRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CompletionRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let trigger_characters : Array[String]? = match obj.get("triggerCharacters") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] })
    _ => None
  }
  let all_commit_characters : Array[String]? = match obj.get("allCommitCharacters") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] })
    _ => None
  }
  let resolve_provider : Bool? = match obj.get("resolveProvider") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let completion_item : ServerCompletionItemOptions? = match obj.get("completionItem") {
    Some(v) if not(v.is_null()) => Some(ServerCompletionItemOptions::from_json(v))
    _ => None
  }
  CompletionRegistrationOptions::{ document_selector, work_done_progress, trigger_characters, all_commit_characters, resolve_provider, completion_item }
}

///| Parameters for a {@link HoverRequest}.
///| Extends: TextDocumentPositionParams
///| Mixins: WorkDoneProgressParams
pub struct HoverParams {
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The position inside the text document.
  position : Position
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
}

///|
pub impl @json.ToJson for HoverParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  obj.set("position", self.position.to_json())
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for HoverParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for HoverParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let position = match obj.get("position") {
    Some(v) => Position::from_json(v)
    None => raise @json.JsonError("missing position")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  HoverParams::{ text_document, position, work_done_token }
}

///| The result of a hover request.
pub struct Hover {
  ///| The hover's content
  contents : @json.JsonValue
  ///| An optional range inside the text document that is used to
  range : Range?
}

///|
pub impl @json.ToJson for Hover with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("contents", self.contents)
  match self.range {
    Some(v) => obj.set("range", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for Hover with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for Hover")
  }
  let contents = match obj.get("contents") {
    Some(v) => v
    None => raise @json.JsonError("missing contents")
  }
  let range : Range? = match obj.get("range") {
    Some(v) if not(v.is_null()) => Some(Range::from_json(v))
    _ => None
  }
  Hover::{ contents, range }
}

///| Registration options for a {@link HoverRequest}.
///| Extends: TextDocumentRegistrationOptions, HoverOptions
pub struct HoverRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for HoverRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for HoverRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for HoverRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  HoverRegistrationOptions::{ document_selector, work_done_progress }
}

///| Parameters for a {@link SignatureHelpRequest}.
///| Extends: TextDocumentPositionParams
///| Mixins: WorkDoneProgressParams
pub struct SignatureHelpParams {
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The position inside the text document.
  position : Position
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| The signature help context. This is only available if the client specifies
  context : SignatureHelpContext?
}

///|
pub impl @json.ToJson for SignatureHelpParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  obj.set("position", self.position.to_json())
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.context {
    Some(v) => obj.set("context", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SignatureHelpParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SignatureHelpParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let position = match obj.get("position") {
    Some(v) => Position::from_json(v)
    None => raise @json.JsonError("missing position")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let context : SignatureHelpContext? = match obj.get("context") {
    Some(v) if not(v.is_null()) => Some(SignatureHelpContext::from_json(v))
    _ => None
  }
  SignatureHelpParams::{ text_document, position, work_done_token, context }
}

///| Signature help represents the signature of something
pub struct SignatureHelp {
  ///| One or more signatures.
  signatures : Array[SignatureInformation]
  ///| The active signature. If omitted or the value lies outside the
  active_signature : Int?
  ///| The active parameter of the active signature.
  active_parameter : @json.JsonValue?
}

///|
pub impl @json.ToJson for SignatureHelp with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("signatures", @json.JsonValue::Array(self.signatures.map(fn(item) { item.to_json() })))
  match self.active_signature {
    Some(v) => obj.set("activeSignature", @json.JsonValue::Number(v.to_double()))
    None => ()
  }
  match self.active_parameter {
    Some(v) => obj.set("activeParameter", v)
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SignatureHelp with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SignatureHelp")
  }
  let signatures = match obj.get("signatures") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { SignatureInformation::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing signatures")
  }
  let active_signature : Int? = match obj.get("activeSignature") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Number(n) => n.to_int(); _ => raise @json.JsonError("expected number") })
    _ => None
  }
  let active_parameter : @json.JsonValue? = obj.get("activeParameter")
  SignatureHelp::{ signatures, active_signature, active_parameter }
}

///| Registration options for a {@link SignatureHelpRequest}.
///| Extends: TextDocumentRegistrationOptions, SignatureHelpOptions
pub struct SignatureHelpRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
  ///| List of characters that trigger signature help automatically.
  trigger_characters : Array[String]?
  ///| List of characters that re-trigger signature help.
  retrigger_characters : Array[String]?
}

///|
pub impl @json.ToJson for SignatureHelpRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.trigger_characters {
    Some(v) => obj.set("triggerCharacters", @json.JsonValue::Array(v.map(fn(item) { @json.JsonValue::String(item) })))
    None => ()
  }
  match self.retrigger_characters {
    Some(v) => obj.set("retriggerCharacters", @json.JsonValue::Array(v.map(fn(item) { @json.JsonValue::String(item) })))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SignatureHelpRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SignatureHelpRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let trigger_characters : Array[String]? = match obj.get("triggerCharacters") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] })
    _ => None
  }
  let retrigger_characters : Array[String]? = match obj.get("retriggerCharacters") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] })
    _ => None
  }
  SignatureHelpRegistrationOptions::{ document_selector, work_done_progress, trigger_characters, retrigger_characters }
}

///| Parameters for a {@link DefinitionRequest}.
///| Extends: TextDocumentPositionParams
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct DefinitionParams {
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The position inside the text document.
  position : Position
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
}

///|
pub impl @json.ToJson for DefinitionParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  obj.set("position", self.position.to_json())
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DefinitionParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DefinitionParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let position = match obj.get("position") {
    Some(v) => Position::from_json(v)
    None => raise @json.JsonError("missing position")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  DefinitionParams::{ text_document, position, work_done_token, partial_result_token }
}

///| Registration options for a {@link DefinitionRequest}.
///| Extends: TextDocumentRegistrationOptions, DefinitionOptions
pub struct DefinitionRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for DefinitionRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DefinitionRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DefinitionRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DefinitionRegistrationOptions::{ document_selector, work_done_progress }
}

///| Parameters for a {@link ReferencesRequest}.
///| Extends: TextDocumentPositionParams
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct ReferenceParams {
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The position inside the text document.
  position : Position
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
  context : ReferenceContext
}

///|
pub impl @json.ToJson for ReferenceParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  obj.set("position", self.position.to_json())
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  obj.set("context", self.context.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ReferenceParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ReferenceParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let position = match obj.get("position") {
    Some(v) => Position::from_json(v)
    None => raise @json.JsonError("missing position")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let context = match obj.get("context") {
    Some(v) => ReferenceContext::from_json(v)
    None => raise @json.JsonError("missing context")
  }
  ReferenceParams::{ text_document, position, work_done_token, partial_result_token, context }
}

///| Registration options for a {@link ReferencesRequest}.
///| Extends: TextDocumentRegistrationOptions, ReferenceOptions
pub struct ReferenceRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for ReferenceRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ReferenceRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ReferenceRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  ReferenceRegistrationOptions::{ document_selector, work_done_progress }
}

///| Parameters for a {@link DocumentHighlightRequest}.
///| Extends: TextDocumentPositionParams
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct DocumentHighlightParams {
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The position inside the text document.
  position : Position
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
}

///|
pub impl @json.ToJson for DocumentHighlightParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  obj.set("position", self.position.to_json())
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentHighlightParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentHighlightParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let position = match obj.get("position") {
    Some(v) => Position::from_json(v)
    None => raise @json.JsonError("missing position")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  DocumentHighlightParams::{ text_document, position, work_done_token, partial_result_token }
}

///| A document highlight is a range inside a text document which deserves
pub struct DocumentHighlight {
  ///| The range this highlight applies to.
  range : Range
  ///| The highlight kind, default is {@link DocumentHighlightKind.Text text}.
  kind : DocumentHighlightKind?
}

///|
pub impl @json.ToJson for DocumentHighlight with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("range", self.range.to_json())
  match self.kind {
    Some(v) => obj.set("kind", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentHighlight with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentHighlight")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  let kind : DocumentHighlightKind? = match obj.get("kind") {
    Some(v) if not(v.is_null()) => Some(DocumentHighlightKind::from_json(v))
    _ => None
  }
  DocumentHighlight::{ range, kind }
}

///| Registration options for a {@link DocumentHighlightRequest}.
///| Extends: TextDocumentRegistrationOptions, DocumentHighlightOptions
pub struct DocumentHighlightRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for DocumentHighlightRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentHighlightRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentHighlightRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DocumentHighlightRegistrationOptions::{ document_selector, work_done_progress }
}

///| Parameters for a {@link DocumentSymbolRequest}.
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct DocumentSymbolParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
  ///| The text document.
  text_document : TextDocumentIdentifier
}

///|
pub impl @json.ToJson for DocumentSymbolParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  obj.set("textDocument", self.text_document.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentSymbolParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentSymbolParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  DocumentSymbolParams::{ work_done_token, partial_result_token, text_document }
}

///| Represents information about programming constructs like variables, classes,
///| Extends: BaseSymbolInformation
pub struct SymbolInformation {
  ///| The name of this symbol.
  name : String
  ///| The kind of this symbol.
  kind : SymbolKind
  ///| Tags for this symbol.
  tags : Array[SymbolTag]?
  ///| The name of the symbol containing this symbol. This information is for
  container_name : String?
  ///| Indicates if this symbol is deprecated.
  deprecated : Bool?
  ///| The location of this symbol. The location's range is used by a tool
  location : Location
}

///|
pub impl @json.ToJson for SymbolInformation with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("name", @json.JsonValue::String(self.name))
  obj.set("kind", self.kind.to_json())
  match self.tags {
    Some(v) => obj.set("tags", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  match self.container_name {
    Some(v) => obj.set("containerName", @json.JsonValue::String(v))
    None => ()
  }
  match self.deprecated {
    Some(v) => obj.set("deprecated", @json.JsonValue::Bool(v))
    None => ()
  }
  obj.set("location", self.location.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SymbolInformation with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SymbolInformation")
  }
  let name = match obj.get("name") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing name")
  }
  let kind = match obj.get("kind") {
    Some(v) => SymbolKind::from_json(v)
    None => raise @json.JsonError("missing kind")
  }
  let tags : Array[SymbolTag]? = match obj.get("tags") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { SymbolTag::from_json(item) }); _ => [] })
    _ => None
  }
  let container_name : String? = match obj.get("containerName") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let deprecated : Bool? = match obj.get("deprecated") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let location = match obj.get("location") {
    Some(v) => Location::from_json(v)
    None => raise @json.JsonError("missing location")
  }
  SymbolInformation::{ name, kind, tags, container_name, deprecated, location }
}

///| Represents programming constructs like variables, classes, interfaces etc.
pub struct DocumentSymbol {
  ///| The name of this symbol. Will be displayed in the user interface and therefore must not be
  name : String
  ///| More detail for this symbol, e.g the signature of a function.
  detail : String?
  ///| The kind of this symbol.
  kind : SymbolKind
  ///| Tags for this document symbol.
  tags : Array[SymbolTag]?
  ///| Indicates if this symbol is deprecated.
  deprecated : Bool?
  ///| The range enclosing this symbol not including leading/trailing whitespace but everything else
  range : Range
  ///| The range that should be selected and revealed when this symbol is being picked, e.g the name of a f
  selection_range : Range
  ///| Children of this symbol, e.g. properties of a class.
  children : Array[DocumentSymbol]?
}

///|
pub impl @json.ToJson for DocumentSymbol with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("name", @json.JsonValue::String(self.name))
  match self.detail {
    Some(v) => obj.set("detail", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("kind", self.kind.to_json())
  match self.tags {
    Some(v) => obj.set("tags", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  match self.deprecated {
    Some(v) => obj.set("deprecated", @json.JsonValue::Bool(v))
    None => ()
  }
  obj.set("range", self.range.to_json())
  obj.set("selectionRange", self.selection_range.to_json())
  match self.children {
    Some(v) => obj.set("children", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentSymbol with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentSymbol")
  }
  let name = match obj.get("name") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing name")
  }
  let detail : String? = match obj.get("detail") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let kind = match obj.get("kind") {
    Some(v) => SymbolKind::from_json(v)
    None => raise @json.JsonError("missing kind")
  }
  let tags : Array[SymbolTag]? = match obj.get("tags") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { SymbolTag::from_json(item) }); _ => [] })
    _ => None
  }
  let deprecated : Bool? = match obj.get("deprecated") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  let selection_range = match obj.get("selectionRange") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing selectionRange")
  }
  let children : Array[DocumentSymbol]? = match obj.get("children") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { DocumentSymbol::from_json(item) }); _ => [] })
    _ => None
  }
  DocumentSymbol::{ name, detail, kind, tags, deprecated, range, selection_range, children }
}

///| Registration options for a {@link DocumentSymbolRequest}.
///| Extends: TextDocumentRegistrationOptions, DocumentSymbolOptions
pub struct DocumentSymbolRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
  ///| A human-readable string that is shown when multiple outlines trees
  label : String?
}

///|
pub impl @json.ToJson for DocumentSymbolRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.label {
    Some(v) => obj.set("label", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentSymbolRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentSymbolRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let label : String? = match obj.get("label") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  DocumentSymbolRegistrationOptions::{ document_selector, work_done_progress, label }
}

///| The parameters of a {@link CodeActionRequest}.
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct CodeActionParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
  ///| The document in which the command was invoked.
  text_document : TextDocumentIdentifier
  ///| The range for which the command was invoked.
  range : Range
  ///| Context carrying additional information.
  context : CodeActionContext
}

///|
pub impl @json.ToJson for CodeActionParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  obj.set("textDocument", self.text_document.to_json())
  obj.set("range", self.range.to_json())
  obj.set("context", self.context.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CodeActionParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CodeActionParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  let context = match obj.get("context") {
    Some(v) => CodeActionContext::from_json(v)
    None => raise @json.JsonError("missing context")
  }
  CodeActionParams::{ work_done_token, partial_result_token, text_document, range, context }
}

///| Represents a reference to a command. Provides a title which
pub struct Command {
  ///| Title of the command, like `save`.
  title : String
  ///| An optional tooltip.
  tooltip : String?
  ///| The identifier of the actual command handler.
  command : String
  ///| Arguments that the command handler should be
  arguments : Array[LSPAny]?
}

///|
pub impl @json.ToJson for Command with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("title", @json.JsonValue::String(self.title))
  match self.tooltip {
    Some(v) => obj.set("tooltip", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("command", @json.JsonValue::String(self.command))
  match self.arguments {
    Some(v) => obj.set("arguments", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for Command with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for Command")
  }
  let title = match obj.get("title") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing title")
  }
  let tooltip : String? = match obj.get("tooltip") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let command = match obj.get("command") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing command")
  }
  let arguments : Array[LSPAny]? = match obj.get("arguments") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { LSPAny::from_json(item) }); _ => [] })
    _ => None
  }
  Command::{ title, tooltip, command, arguments }
}

///| A code action represents a change that can be performed in code, e.g. to fix a problem or
pub struct CodeAction {
  ///| A short, human-readable, title for this code action.
  title : String
  ///| The kind of the code action.
  kind : CodeActionKind?
  ///| The diagnostics that this code action resolves.
  diagnostics : Array[Diagnostic]?
  ///| Marks this as a preferred action. Preferred actions are used by the `auto fix` command and can be ta
  is_preferred : Bool?
  ///| Marks that the code action cannot currently be applied.
  disabled : CodeActionDisabled?
  ///| The workspace edit this code action performs.
  edit : WorkspaceEdit?
  ///| A command this code action executes. If a code action
  command : Command?
  ///| A data entry field that is preserved on a code action between
  data : LSPAny?
  ///| Tags for this code action.
  tags : Array[CodeActionTag]?
}

///|
pub impl @json.ToJson for CodeAction with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("title", @json.JsonValue::String(self.title))
  match self.kind {
    Some(v) => obj.set("kind", v.to_json())
    None => ()
  }
  match self.diagnostics {
    Some(v) => obj.set("diagnostics", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  match self.is_preferred {
    Some(v) => obj.set("isPreferred", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.disabled {
    Some(v) => obj.set("disabled", v.to_json())
    None => ()
  }
  match self.edit {
    Some(v) => obj.set("edit", v.to_json())
    None => ()
  }
  match self.command {
    Some(v) => obj.set("command", v.to_json())
    None => ()
  }
  match self.data {
    Some(v) => obj.set("data", v.to_json())
    None => ()
  }
  match self.tags {
    Some(v) => obj.set("tags", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CodeAction with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CodeAction")
  }
  let title = match obj.get("title") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing title")
  }
  let kind : CodeActionKind? = match obj.get("kind") {
    Some(v) if not(v.is_null()) => Some(CodeActionKind::from_json(v))
    _ => None
  }
  let diagnostics : Array[Diagnostic]? = match obj.get("diagnostics") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { Diagnostic::from_json(item) }); _ => [] })
    _ => None
  }
  let is_preferred : Bool? = match obj.get("isPreferred") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let disabled : CodeActionDisabled? = match obj.get("disabled") {
    Some(v) if not(v.is_null()) => Some(CodeActionDisabled::from_json(v))
    _ => None
  }
  let edit : WorkspaceEdit? = match obj.get("edit") {
    Some(v) if not(v.is_null()) => Some(WorkspaceEdit::from_json(v))
    _ => None
  }
  let command : Command? = match obj.get("command") {
    Some(v) if not(v.is_null()) => Some(Command::from_json(v))
    _ => None
  }
  let data : LSPAny? = match obj.get("data") {
    Some(v) if not(v.is_null()) => Some(LSPAny::from_json(v))
    _ => None
  }
  let tags : Array[CodeActionTag]? = match obj.get("tags") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { CodeActionTag::from_json(item) }); _ => [] })
    _ => None
  }
  CodeAction::{ title, kind, diagnostics, is_preferred, disabled, edit, command, data, tags }
}

///| Registration options for a {@link CodeActionRequest}.
///| Extends: TextDocumentRegistrationOptions, CodeActionOptions
pub struct CodeActionRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
  ///| CodeActionKinds that this server may return.
  code_action_kinds : Array[CodeActionKind]?
  ///| Static documentation for a class of code actions.
  documentation : Array[CodeActionKindDocumentation]?
  ///| The server provides support to resolve additional
  resolve_provider : Bool?
}

///|
pub impl @json.ToJson for CodeActionRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.code_action_kinds {
    Some(v) => obj.set("codeActionKinds", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  match self.documentation {
    Some(v) => obj.set("documentation", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  match self.resolve_provider {
    Some(v) => obj.set("resolveProvider", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CodeActionRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CodeActionRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let code_action_kinds : Array[CodeActionKind]? = match obj.get("codeActionKinds") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { CodeActionKind::from_json(item) }); _ => [] })
    _ => None
  }
  let documentation : Array[CodeActionKindDocumentation]? = match obj.get("documentation") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { CodeActionKindDocumentation::from_json(item) }); _ => [] })
    _ => None
  }
  let resolve_provider : Bool? = match obj.get("resolveProvider") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  CodeActionRegistrationOptions::{ document_selector, work_done_progress, code_action_kinds, documentation, resolve_provider }
}

///| The parameters of a {@link WorkspaceSymbolRequest}.
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct WorkspaceSymbolParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
  ///| A query string to filter symbols by. Clients may send an empty
  query : String
}

///|
pub impl @json.ToJson for WorkspaceSymbolParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  obj.set("query", @json.JsonValue::String(self.query))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkspaceSymbolParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkspaceSymbolParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let query = match obj.get("query") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing query")
  }
  WorkspaceSymbolParams::{ work_done_token, partial_result_token, query }
}

///| A special workspace symbol that supports locations without a range.
///| Extends: BaseSymbolInformation
pub struct WorkspaceSymbol {
  ///| The name of this symbol.
  name : String
  ///| The kind of this symbol.
  kind : SymbolKind
  ///| Tags for this symbol.
  tags : Array[SymbolTag]?
  ///| The name of the symbol containing this symbol. This information is for
  container_name : String?
  ///| The location of the symbol. Whether a server is allowed to
  location : @json.JsonValue
  ///| A data entry field that is preserved on a workspace symbol between a
  data : LSPAny?
}

///|
pub impl @json.ToJson for WorkspaceSymbol with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("name", @json.JsonValue::String(self.name))
  obj.set("kind", self.kind.to_json())
  match self.tags {
    Some(v) => obj.set("tags", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  match self.container_name {
    Some(v) => obj.set("containerName", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("location", self.location)
  match self.data {
    Some(v) => obj.set("data", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkspaceSymbol with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkspaceSymbol")
  }
  let name = match obj.get("name") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing name")
  }
  let kind = match obj.get("kind") {
    Some(v) => SymbolKind::from_json(v)
    None => raise @json.JsonError("missing kind")
  }
  let tags : Array[SymbolTag]? = match obj.get("tags") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { SymbolTag::from_json(item) }); _ => [] })
    _ => None
  }
  let container_name : String? = match obj.get("containerName") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let location = match obj.get("location") {
    Some(v) => v
    None => raise @json.JsonError("missing location")
  }
  let data : LSPAny? = match obj.get("data") {
    Some(v) if not(v.is_null()) => Some(LSPAny::from_json(v))
    _ => None
  }
  WorkspaceSymbol::{ name, kind, tags, container_name, location, data }
}

///| Registration options for a {@link WorkspaceSymbolRequest}.
///| Extends: WorkspaceSymbolOptions
pub struct WorkspaceSymbolRegistrationOptions {
  work_done_progress : Bool?
  ///| The server provides support to resolve additional
  resolve_provider : Bool?
}

///|
pub impl @json.ToJson for WorkspaceSymbolRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.resolve_provider {
    Some(v) => obj.set("resolveProvider", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkspaceSymbolRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkspaceSymbolRegistrationOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let resolve_provider : Bool? = match obj.get("resolveProvider") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  WorkspaceSymbolRegistrationOptions::{ work_done_progress, resolve_provider }
}

///| The parameters of a {@link CodeLensRequest}.
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct CodeLensParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
  ///| The document to request code lens for.
  text_document : TextDocumentIdentifier
}

///|
pub impl @json.ToJson for CodeLensParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  obj.set("textDocument", self.text_document.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CodeLensParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CodeLensParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  CodeLensParams::{ work_done_token, partial_result_token, text_document }
}

///| A code lens represents a {@link Command command} that should be shown along with
pub struct CodeLens {
  ///| The range in which this code lens is valid. Should only span a single line.
  range : Range
  ///| The command this code lens represents.
  command : Command?
  ///| A data entry field that is preserved on a code lens item between
  data : LSPAny?
}

///|
pub impl @json.ToJson for CodeLens with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("range", self.range.to_json())
  match self.command {
    Some(v) => obj.set("command", v.to_json())
    None => ()
  }
  match self.data {
    Some(v) => obj.set("data", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CodeLens with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CodeLens")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  let command : Command? = match obj.get("command") {
    Some(v) if not(v.is_null()) => Some(Command::from_json(v))
    _ => None
  }
  let data : LSPAny? = match obj.get("data") {
    Some(v) if not(v.is_null()) => Some(LSPAny::from_json(v))
    _ => None
  }
  CodeLens::{ range, command, data }
}

///| Registration options for a {@link CodeLensRequest}.
///| Extends: TextDocumentRegistrationOptions, CodeLensOptions
pub struct CodeLensRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
  ///| Code lens has a resolve provider as well.
  resolve_provider : Bool?
}

///|
pub impl @json.ToJson for CodeLensRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.resolve_provider {
    Some(v) => obj.set("resolveProvider", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CodeLensRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CodeLensRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let resolve_provider : Bool? = match obj.get("resolveProvider") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  CodeLensRegistrationOptions::{ document_selector, work_done_progress, resolve_provider }
}

///| The parameters of a {@link DocumentLinkRequest}.
///| Mixins: WorkDoneProgressParams, PartialResultParams
pub struct DocumentLinkParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
  ///| The document to provide document links for.
  text_document : TextDocumentIdentifier
}

///|
pub impl @json.ToJson for DocumentLinkParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  obj.set("textDocument", self.text_document.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentLinkParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentLinkParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  DocumentLinkParams::{ work_done_token, partial_result_token, text_document }
}

///| A document link is a range in a text document that links to an internal or external resource, like a
pub struct DocumentLink {
  ///| The range this link applies to.
  range : Range
  ///| The uri this link points to. If missing a resolve request is sent later.
  target : String?
  ///| The tooltip text when you hover over this link.
  tooltip : String?
  ///| A data entry field that is preserved on a document link between a
  data : LSPAny?
}

///|
pub impl @json.ToJson for DocumentLink with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("range", self.range.to_json())
  match self.target {
    Some(v) => obj.set("target", @json.JsonValue::String(v))
    None => ()
  }
  match self.tooltip {
    Some(v) => obj.set("tooltip", @json.JsonValue::String(v))
    None => ()
  }
  match self.data {
    Some(v) => obj.set("data", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentLink with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentLink")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  let target : String? = match obj.get("target") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let tooltip : String? = match obj.get("tooltip") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let data : LSPAny? = match obj.get("data") {
    Some(v) if not(v.is_null()) => Some(LSPAny::from_json(v))
    _ => None
  }
  DocumentLink::{ range, target, tooltip, data }
}

///| Registration options for a {@link DocumentLinkRequest}.
///| Extends: TextDocumentRegistrationOptions, DocumentLinkOptions
pub struct DocumentLinkRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
  ///| Document links have a resolve provider as well.
  resolve_provider : Bool?
}

///|
pub impl @json.ToJson for DocumentLinkRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.resolve_provider {
    Some(v) => obj.set("resolveProvider", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentLinkRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentLinkRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let resolve_provider : Bool? = match obj.get("resolveProvider") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DocumentLinkRegistrationOptions::{ document_selector, work_done_progress, resolve_provider }
}

///| The parameters of a {@link DocumentFormattingRequest}.
///| Mixins: WorkDoneProgressParams
pub struct DocumentFormattingParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| The document to format.
  text_document : TextDocumentIdentifier
  ///| The format options.
  options : FormattingOptions
}

///|
pub impl @json.ToJson for DocumentFormattingParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  obj.set("textDocument", self.text_document.to_json())
  obj.set("options", self.options.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentFormattingParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentFormattingParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let options = match obj.get("options") {
    Some(v) => FormattingOptions::from_json(v)
    None => raise @json.JsonError("missing options")
  }
  DocumentFormattingParams::{ work_done_token, text_document, options }
}

///| Registration options for a {@link DocumentFormattingRequest}.
///| Extends: TextDocumentRegistrationOptions, DocumentFormattingOptions
pub struct DocumentFormattingRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for DocumentFormattingRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentFormattingRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentFormattingRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DocumentFormattingRegistrationOptions::{ document_selector, work_done_progress }
}

///| The parameters of a {@link DocumentRangeFormattingRequest}.
///| Mixins: WorkDoneProgressParams
pub struct DocumentRangeFormattingParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| The document to format.
  text_document : TextDocumentIdentifier
  ///| The range to format
  range : Range
  ///| The format options
  options : FormattingOptions
}

///|
pub impl @json.ToJson for DocumentRangeFormattingParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  obj.set("textDocument", self.text_document.to_json())
  obj.set("range", self.range.to_json())
  obj.set("options", self.options.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentRangeFormattingParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentRangeFormattingParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  let options = match obj.get("options") {
    Some(v) => FormattingOptions::from_json(v)
    None => raise @json.JsonError("missing options")
  }
  DocumentRangeFormattingParams::{ work_done_token, text_document, range, options }
}

///| Registration options for a {@link DocumentRangeFormattingRequest}.
///| Extends: TextDocumentRegistrationOptions, DocumentRangeFormattingOptions
pub struct DocumentRangeFormattingRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
  ///| Whether the server supports formatting multiple ranges at once.
  ranges_support : Bool?
}

///|
pub impl @json.ToJson for DocumentRangeFormattingRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.ranges_support {
    Some(v) => obj.set("rangesSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentRangeFormattingRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentRangeFormattingRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let ranges_support : Bool? = match obj.get("rangesSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DocumentRangeFormattingRegistrationOptions::{ document_selector, work_done_progress, ranges_support }
}

///| The parameters of a {@link DocumentRangesFormattingRequest}.
///| Mixins: WorkDoneProgressParams
pub struct DocumentRangesFormattingParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| The document to format.
  text_document : TextDocumentIdentifier
  ///| The ranges to format
  ranges : Array[Range]
  ///| The format options
  options : FormattingOptions
}

///|
pub impl @json.ToJson for DocumentRangesFormattingParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  obj.set("textDocument", self.text_document.to_json())
  obj.set("ranges", @json.JsonValue::Array(self.ranges.map(fn(item) { item.to_json() })))
  obj.set("options", self.options.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentRangesFormattingParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentRangesFormattingParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let ranges = match obj.get("ranges") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { Range::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing ranges")
  }
  let options = match obj.get("options") {
    Some(v) => FormattingOptions::from_json(v)
    None => raise @json.JsonError("missing options")
  }
  DocumentRangesFormattingParams::{ work_done_token, text_document, ranges, options }
}

///| The parameters of a {@link DocumentOnTypeFormattingRequest}.
pub struct DocumentOnTypeFormattingParams {
  ///| The document to format.
  text_document : TextDocumentIdentifier
  ///| The position around which the on type formatting should happen.
  position : Position
  ///| The character that has been typed that triggered the formatting
  ch : String
  ///| The formatting options.
  options : FormattingOptions
}

///|
pub impl @json.ToJson for DocumentOnTypeFormattingParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  obj.set("position", self.position.to_json())
  obj.set("ch", @json.JsonValue::String(self.ch))
  obj.set("options", self.options.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentOnTypeFormattingParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentOnTypeFormattingParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let position = match obj.get("position") {
    Some(v) => Position::from_json(v)
    None => raise @json.JsonError("missing position")
  }
  let ch = match obj.get("ch") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing ch")
  }
  let options = match obj.get("options") {
    Some(v) => FormattingOptions::from_json(v)
    None => raise @json.JsonError("missing options")
  }
  DocumentOnTypeFormattingParams::{ text_document, position, ch, options }
}

///| Registration options for a {@link DocumentOnTypeFormattingRequest}.
///| Extends: TextDocumentRegistrationOptions, DocumentOnTypeFormattingOptions
pub struct DocumentOnTypeFormattingRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  ///| A character on which formatting should be triggered, like `{`.
  first_trigger_character : String
  ///| More trigger characters.
  more_trigger_character : Array[String]?
}

///|
pub impl @json.ToJson for DocumentOnTypeFormattingRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  obj.set("firstTriggerCharacter", @json.JsonValue::String(self.first_trigger_character))
  match self.more_trigger_character {
    Some(v) => obj.set("moreTriggerCharacter", @json.JsonValue::Array(v.map(fn(item) { @json.JsonValue::String(item) })))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentOnTypeFormattingRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentOnTypeFormattingRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let first_trigger_character = match obj.get("firstTriggerCharacter") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing firstTriggerCharacter")
  }
  let more_trigger_character : Array[String]? = match obj.get("moreTriggerCharacter") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] })
    _ => None
  }
  DocumentOnTypeFormattingRegistrationOptions::{ document_selector, first_trigger_character, more_trigger_character }
}

///| The parameters of a {@link RenameRequest}.
///| Extends: TextDocumentPositionParams
///| Mixins: WorkDoneProgressParams
pub struct RenameParams {
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The position inside the text document.
  position : Position
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| The new name of the symbol. If the given name is not valid the
  new_name : String
}

///|
pub impl @json.ToJson for RenameParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  obj.set("position", self.position.to_json())
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  obj.set("newName", @json.JsonValue::String(self.new_name))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for RenameParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for RenameParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let position = match obj.get("position") {
    Some(v) => Position::from_json(v)
    None => raise @json.JsonError("missing position")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let new_name = match obj.get("newName") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing newName")
  }
  RenameParams::{ text_document, position, work_done_token, new_name }
}

///| Registration options for a {@link RenameRequest}.
///| Extends: TextDocumentRegistrationOptions, RenameOptions
pub struct RenameRegistrationOptions {
  ///| A document selector to identify the scope of the registration. If set to null
  document_selector : @json.JsonValue
  work_done_progress : Bool?
  ///| Renames should be checked and tested before being executed.
  prepare_provider : Bool?
}

///|
pub impl @json.ToJson for RenameRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("documentSelector", self.document_selector)
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.prepare_provider {
    Some(v) => obj.set("prepareProvider", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for RenameRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for RenameRegistrationOptions")
  }
  let document_selector = match obj.get("documentSelector") {
    Some(v) => v
    None => raise @json.JsonError("missing documentSelector")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let prepare_provider : Bool? = match obj.get("prepareProvider") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  RenameRegistrationOptions::{ document_selector, work_done_progress, prepare_provider }
}

///| Extends: TextDocumentPositionParams
///| Mixins: WorkDoneProgressParams
pub struct PrepareRenameParams {
  ///| The text document.
  text_document : TextDocumentIdentifier
  ///| The position inside the text document.
  position : Position
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
}

///|
pub impl @json.ToJson for PrepareRenameParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  obj.set("position", self.position.to_json())
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for PrepareRenameParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for PrepareRenameParams")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => TextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let position = match obj.get("position") {
    Some(v) => Position::from_json(v)
    None => raise @json.JsonError("missing position")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  PrepareRenameParams::{ text_document, position, work_done_token }
}

///| The parameters of a {@link ExecuteCommandRequest}.
///| Mixins: WorkDoneProgressParams
pub struct ExecuteCommandParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
  ///| The identifier of the actual command handler.
  command : String
  ///| Arguments that the command should be invoked with.
  arguments : Array[LSPAny]?
}

///|
pub impl @json.ToJson for ExecuteCommandParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  obj.set("command", @json.JsonValue::String(self.command))
  match self.arguments {
    Some(v) => obj.set("arguments", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ExecuteCommandParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ExecuteCommandParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  let command = match obj.get("command") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing command")
  }
  let arguments : Array[LSPAny]? = match obj.get("arguments") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { LSPAny::from_json(item) }); _ => [] })
    _ => None
  }
  ExecuteCommandParams::{ work_done_token, command, arguments }
}

///| Registration options for a {@link ExecuteCommandRequest}.
///| Extends: ExecuteCommandOptions
pub struct ExecuteCommandRegistrationOptions {
  work_done_progress : Bool?
  ///| The commands to be executed on the server
  commands : Array[String]
}

///|
pub impl @json.ToJson for ExecuteCommandRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  obj.set("commands", @json.JsonValue::Array(self.commands.map(fn(item) { @json.JsonValue::String(item) })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ExecuteCommandRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ExecuteCommandRegistrationOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let commands = match obj.get("commands") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] }
    None => raise @json.JsonError("missing commands")
  }
  ExecuteCommandRegistrationOptions::{ work_done_progress, commands }
}

///| The parameters passed via an apply workspace edit request.
pub struct ApplyWorkspaceEditParams {
  ///| An optional label of the workspace edit. This label is
  label : String?
  ///| The edits to apply.
  edit : WorkspaceEdit
  ///| Additional data about the edit.
  metadata : WorkspaceEditMetadata?
}

///|
pub impl @json.ToJson for ApplyWorkspaceEditParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.label {
    Some(v) => obj.set("label", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("edit", self.edit.to_json())
  match self.metadata {
    Some(v) => obj.set("metadata", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ApplyWorkspaceEditParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ApplyWorkspaceEditParams")
  }
  let label : String? = match obj.get("label") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let edit = match obj.get("edit") {
    Some(v) => WorkspaceEdit::from_json(v)
    None => raise @json.JsonError("missing edit")
  }
  let metadata : WorkspaceEditMetadata? = match obj.get("metadata") {
    Some(v) if not(v.is_null()) => Some(WorkspaceEditMetadata::from_json(v))
    _ => None
  }
  ApplyWorkspaceEditParams::{ label, edit, metadata }
}

///| The result returned from the apply workspace edit request.
pub struct ApplyWorkspaceEditResult {
  ///| Indicates whether the edit was applied or not.
  applied : Bool
  ///| An optional textual description for why the edit was not applied.
  failure_reason : String?
  ///| Depending on the client's failure handling strategy `failedChange` might
  failed_change : Int?
}

///|
pub impl @json.ToJson for ApplyWorkspaceEditResult with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("applied", @json.JsonValue::Bool(self.applied))
  match self.failure_reason {
    Some(v) => obj.set("failureReason", @json.JsonValue::String(v))
    None => ()
  }
  match self.failed_change {
    Some(v) => obj.set("failedChange", @json.JsonValue::Number(v.to_double()))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ApplyWorkspaceEditResult with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ApplyWorkspaceEditResult")
  }
  let applied = match obj.get("applied") {
    Some(v) => match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") }
    None => raise @json.JsonError("missing applied")
  }
  let failure_reason : String? = match obj.get("failureReason") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let failed_change : Int? = match obj.get("failedChange") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Number(n) => n.to_int(); _ => raise @json.JsonError("expected number") })
    _ => None
  }
  ApplyWorkspaceEditResult::{ applied, failure_reason, failed_change }
}

pub struct WorkDoneProgressBegin {
  kind : String
  ///| Mandatory title of the progress operation. Used to briefly inform about
  title : String
  ///| Controls if a cancel button should show to allow the user to cancel the
  cancellable : Bool?
  ///| Optional, more detailed associated progress message. Contains
  message : String?
  ///| Optional progress percentage to display (value 100 is considered 100%).
  percentage : Int?
}

///|
pub impl @json.ToJson for WorkDoneProgressBegin with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("kind", @json.JsonValue::String(self.kind))
  obj.set("title", @json.JsonValue::String(self.title))
  match self.cancellable {
    Some(v) => obj.set("cancellable", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.message {
    Some(v) => obj.set("message", @json.JsonValue::String(v))
    None => ()
  }
  match self.percentage {
    Some(v) => obj.set("percentage", @json.JsonValue::Number(v.to_double()))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkDoneProgressBegin with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkDoneProgressBegin")
  }
  let kind = match obj.get("kind") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing kind")
  }
  let title = match obj.get("title") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing title")
  }
  let cancellable : Bool? = match obj.get("cancellable") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let message : String? = match obj.get("message") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let percentage : Int? = match obj.get("percentage") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Number(n) => n.to_int(); _ => raise @json.JsonError("expected number") })
    _ => None
  }
  WorkDoneProgressBegin::{ kind, title, cancellable, message, percentage }
}

pub struct WorkDoneProgressReport {
  kind : String
  ///| Controls enablement state of a cancel button.
  cancellable : Bool?
  ///| Optional, more detailed associated progress message. Contains
  message : String?
  ///| Optional progress percentage to display (value 100 is considered 100%).
  percentage : Int?
}

///|
pub impl @json.ToJson for WorkDoneProgressReport with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("kind", @json.JsonValue::String(self.kind))
  match self.cancellable {
    Some(v) => obj.set("cancellable", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.message {
    Some(v) => obj.set("message", @json.JsonValue::String(v))
    None => ()
  }
  match self.percentage {
    Some(v) => obj.set("percentage", @json.JsonValue::Number(v.to_double()))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkDoneProgressReport with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkDoneProgressReport")
  }
  let kind = match obj.get("kind") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing kind")
  }
  let cancellable : Bool? = match obj.get("cancellable") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let message : String? = match obj.get("message") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let percentage : Int? = match obj.get("percentage") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Number(n) => n.to_int(); _ => raise @json.JsonError("expected number") })
    _ => None
  }
  WorkDoneProgressReport::{ kind, cancellable, message, percentage }
}

pub struct WorkDoneProgressEnd {
  kind : String
  ///| Optional, a final message indicating to for example indicate the outcome
  message : String?
}

///|
pub impl @json.ToJson for WorkDoneProgressEnd with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("kind", @json.JsonValue::String(self.kind))
  match self.message {
    Some(v) => obj.set("message", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkDoneProgressEnd with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkDoneProgressEnd")
  }
  let kind = match obj.get("kind") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing kind")
  }
  let message : String? = match obj.get("message") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  WorkDoneProgressEnd::{ kind, message }
}

pub struct SetTraceParams {
  value : TraceValue
}

///|
pub impl @json.ToJson for SetTraceParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("value", self.value.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SetTraceParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SetTraceParams")
  }
  let value = match obj.get("value") {
    Some(v) => TraceValue::from_json(v)
    None => raise @json.JsonError("missing value")
  }
  SetTraceParams::{ value }
}

pub struct LogTraceParams {
  message : String
  verbose : String?
}

///|
pub impl @json.ToJson for LogTraceParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("message", @json.JsonValue::String(self.message))
  match self.verbose {
    Some(v) => obj.set("verbose", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for LogTraceParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for LogTraceParams")
  }
  let message = match obj.get("message") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing message")
  }
  let verbose : String? = match obj.get("verbose") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  LogTraceParams::{ message, verbose }
}

pub struct CancelParams {
  ///| The request id to cancel.
  id : @json.JsonValue
}

///|
pub impl @json.ToJson for CancelParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("id", self.id)
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CancelParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CancelParams")
  }
  let id = match obj.get("id") {
    Some(v) => v
    None => raise @json.JsonError("missing id")
  }
  CancelParams::{ id }
}

pub struct ProgressParams {
  ///| The progress token provided by the client or server.
  token : ProgressToken
  ///| The progress data.
  value : LSPAny
}

///|
pub impl @json.ToJson for ProgressParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("token", self.token.to_json())
  obj.set("value", self.value.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ProgressParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ProgressParams")
  }
  let token = match obj.get("token") {
    Some(v) => ProgressToken::from_json(v)
    None => raise @json.JsonError("missing token")
  }
  let value = match obj.get("value") {
    Some(v) => LSPAny::from_json(v)
    None => raise @json.JsonError("missing value")
  }
  ProgressParams::{ token, value }
}

pub struct WorkDoneProgressParams {
  ///| An optional token that a server can use to report work done progress.
  work_done_token : ProgressToken?
}

///|
pub impl @json.ToJson for WorkDoneProgressParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_token {
    Some(v) => obj.set("workDoneToken", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkDoneProgressParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkDoneProgressParams")
  }
  let work_done_token : ProgressToken? = match obj.get("workDoneToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  WorkDoneProgressParams::{ work_done_token }
}

pub struct PartialResultParams {
  ///| An optional token that a server can use to report partial results (e.g. streaming) to
  partial_result_token : ProgressToken?
}

///|
pub impl @json.ToJson for PartialResultParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.partial_result_token {
    Some(v) => obj.set("partialResultToken", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for PartialResultParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for PartialResultParams")
  }
  let partial_result_token : ProgressToken? = match obj.get("partialResultToken") {
    Some(v) if not(v.is_null()) => Some(ProgressToken::from_json(v))
    _ => None
  }
  PartialResultParams::{ partial_result_token }
}

///| Represents the connection of two locations. Provides additional metadata over normal {@link Location
pub struct LocationLink {
  ///| Span of the origin of this link.
  origin_selection_range : Range?
  ///| The target resource identifier of this link.
  target_uri : String
  ///| The full target range of this link. If the target for example is a symbol then target range is the
  target_range : Range
  ///| The range that should be selected and revealed when this link is being followed, e.g the name of a f
  target_selection_range : Range
}

///|
pub impl @json.ToJson for LocationLink with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.origin_selection_range {
    Some(v) => obj.set("originSelectionRange", v.to_json())
    None => ()
  }
  obj.set("targetUri", @json.JsonValue::String(self.target_uri))
  obj.set("targetRange", self.target_range.to_json())
  obj.set("targetSelectionRange", self.target_selection_range.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for LocationLink with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for LocationLink")
  }
  let origin_selection_range : Range? = match obj.get("originSelectionRange") {
    Some(v) if not(v.is_null()) => Some(Range::from_json(v))
    _ => None
  }
  let target_uri = match obj.get("targetUri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing targetUri")
  }
  let target_range = match obj.get("targetRange") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing targetRange")
  }
  let target_selection_range = match obj.get("targetSelectionRange") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing targetSelectionRange")
  }
  LocationLink::{ origin_selection_range, target_uri, target_range, target_selection_range }
}

///| Mixins: WorkDoneProgressOptions
pub struct ImplementationOptions {
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for ImplementationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ImplementationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ImplementationOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  ImplementationOptions::{ work_done_progress }
}

///| Static registration options to be returned in the initialize
pub struct StaticRegistrationOptions {
  ///| The id used to register the request. The id can be used to deregister
  id : String?
}

///|
pub impl @json.ToJson for StaticRegistrationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.id {
    Some(v) => obj.set("id", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for StaticRegistrationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for StaticRegistrationOptions")
  }
  let id : String? = match obj.get("id") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  StaticRegistrationOptions::{ id }
}

///| Mixins: WorkDoneProgressOptions
pub struct TypeDefinitionOptions {
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for TypeDefinitionOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TypeDefinitionOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TypeDefinitionOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  TypeDefinitionOptions::{ work_done_progress }
}

///| The workspace folder change event.
pub struct WorkspaceFoldersChangeEvent {
  ///| The array of added workspace folders
  added : Array[WorkspaceFolder]
  ///| The array of the removed workspace folders
  removed : Array[WorkspaceFolder]
}

///|
pub impl @json.ToJson for WorkspaceFoldersChangeEvent with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("added", @json.JsonValue::Array(self.added.map(fn(item) { item.to_json() })))
  obj.set("removed", @json.JsonValue::Array(self.removed.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkspaceFoldersChangeEvent with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkspaceFoldersChangeEvent")
  }
  let added = match obj.get("added") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { WorkspaceFolder::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing added")
  }
  let removed = match obj.get("removed") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { WorkspaceFolder::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing removed")
  }
  WorkspaceFoldersChangeEvent::{ added, removed }
}

pub struct ConfigurationItem {
  ///| The scope to get the configuration section for.
  scope_uri : String?
  ///| The configuration section asked for.
  section : String?
}

///|
pub impl @json.ToJson for ConfigurationItem with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.scope_uri {
    Some(v) => obj.set("scopeUri", @json.JsonValue::String(v))
    None => ()
  }
  match self.section {
    Some(v) => obj.set("section", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ConfigurationItem with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ConfigurationItem")
  }
  let scope_uri : String? = match obj.get("scopeUri") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let section : String? = match obj.get("section") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  ConfigurationItem::{ scope_uri, section }
}

///| Represents a color in RGBA space.
pub struct Color {
  ///| The red component of this color in the range [0-1].
  red : Double
  ///| The green component of this color in the range [0-1].
  green : Double
  ///| The blue component of this color in the range [0-1].
  blue : Double
  ///| The alpha component of this color in the range [0-1].
  alpha : Double
}

///|
pub impl @json.ToJson for Color with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("red", @json.JsonValue::Number(self.red))
  obj.set("green", @json.JsonValue::Number(self.green))
  obj.set("blue", @json.JsonValue::Number(self.blue))
  obj.set("alpha", @json.JsonValue::Number(self.alpha))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for Color with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for Color")
  }
  let red = match obj.get("red") {
    Some(v) => match v { @json.JsonValue::Number(n) => n; _ => raise @json.JsonError("expected number") }
    None => raise @json.JsonError("missing red")
  }
  let green = match obj.get("green") {
    Some(v) => match v { @json.JsonValue::Number(n) => n; _ => raise @json.JsonError("expected number") }
    None => raise @json.JsonError("missing green")
  }
  let blue = match obj.get("blue") {
    Some(v) => match v { @json.JsonValue::Number(n) => n; _ => raise @json.JsonError("expected number") }
    None => raise @json.JsonError("missing blue")
  }
  let alpha = match obj.get("alpha") {
    Some(v) => match v { @json.JsonValue::Number(n) => n; _ => raise @json.JsonError("expected number") }
    None => raise @json.JsonError("missing alpha")
  }
  Color::{ red, green, blue, alpha }
}

///| Mixins: WorkDoneProgressOptions
pub struct DocumentColorOptions {
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for DocumentColorOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentColorOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentColorOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DocumentColorOptions::{ work_done_progress }
}

///| Mixins: WorkDoneProgressOptions
pub struct FoldingRangeOptions {
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for FoldingRangeOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for FoldingRangeOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for FoldingRangeOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  FoldingRangeOptions::{ work_done_progress }
}

///| Mixins: WorkDoneProgressOptions
pub struct DeclarationOptions {
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for DeclarationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DeclarationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DeclarationOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DeclarationOptions::{ work_done_progress }
}

///| Mixins: WorkDoneProgressOptions
pub struct SelectionRangeOptions {
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for SelectionRangeOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SelectionRangeOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SelectionRangeOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  SelectionRangeOptions::{ work_done_progress }
}

///| Call hierarchy options used during static registration.
///| Mixins: WorkDoneProgressOptions
pub struct CallHierarchyOptions {
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for CallHierarchyOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CallHierarchyOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CallHierarchyOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  CallHierarchyOptions::{ work_done_progress }
}

///| @since 3.16.0
///| Mixins: WorkDoneProgressOptions
pub struct SemanticTokensOptions {
  work_done_progress : Bool?
  ///| The legend used by the server
  legend : SemanticTokensLegend
  ///| Server supports providing semantic tokens for a specific range
  range : @json.JsonValue?
  ///| Server supports providing semantic tokens for a full document.
  full : @json.JsonValue?
}

///|
pub impl @json.ToJson for SemanticTokensOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  obj.set("legend", self.legend.to_json())
  match self.range {
    Some(v) => obj.set("range", v)
    None => ()
  }
  match self.full {
    Some(v) => obj.set("full", v)
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SemanticTokensOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SemanticTokensOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let legend = match obj.get("legend") {
    Some(v) => SemanticTokensLegend::from_json(v)
    None => raise @json.JsonError("missing legend")
  }
  let range : @json.JsonValue? = obj.get("range")
  let full : @json.JsonValue? = obj.get("full")
  SemanticTokensOptions::{ work_done_progress, legend, range, full }
}

///| @since 3.16.0
pub struct SemanticTokensEdit {
  ///| The start offset of the edit.
  start : Int
  ///| The count of elements to remove.
  delete_count : Int
  ///| The elements to insert.
  data : Array[Int]?
}

///|
pub impl @json.ToJson for SemanticTokensEdit with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("start", @json.JsonValue::Number(self.start.to_double()))
  obj.set("deleteCount", @json.JsonValue::Number(self.delete_count.to_double()))
  match self.data {
    Some(v) => obj.set("data", @json.JsonValue::Array(v.map(fn(item) { @json.JsonValue::Number(item.to_double()) })))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SemanticTokensEdit with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SemanticTokensEdit")
  }
  let start = match obj.get("start") {
    Some(v) => match v { @json.JsonValue::Number(n) => n.to_int(); _ => raise @json.JsonError("expected number") }
    None => raise @json.JsonError("missing start")
  }
  let delete_count = match obj.get("deleteCount") {
    Some(v) => match v { @json.JsonValue::Number(n) => n.to_int(); _ => raise @json.JsonError("expected number") }
    None => raise @json.JsonError("missing deleteCount")
  }
  let data : Array[Int]? = match obj.get("data") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::Number(n) => n.to_int(); _ => 0 } }); _ => [] })
    _ => None
  }
  SemanticTokensEdit::{ start, delete_count, data }
}

///| Mixins: WorkDoneProgressOptions
pub struct LinkedEditingRangeOptions {
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for LinkedEditingRangeOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for LinkedEditingRangeOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for LinkedEditingRangeOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  LinkedEditingRangeOptions::{ work_done_progress }
}

///| Represents information on a file/folder create.
pub struct FileCreate {
  ///| A file:// URI for the location of the file/folder being created.
  uri : String
}

///|
pub impl @json.ToJson for FileCreate with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("uri", @json.JsonValue::String(self.uri))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for FileCreate with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for FileCreate")
  }
  let uri = match obj.get("uri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing uri")
  }
  FileCreate::{ uri }
}

///| Describes textual changes on a text document. A TextDocumentEdit describes all changes
pub struct TextDocumentEdit {
  ///| The text document to change.
  text_document : OptionalVersionedTextDocumentIdentifier
  ///| The edits to be applied.
  edits : Array[@json.JsonValue]
}

///|
pub impl @json.ToJson for TextDocumentEdit with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("textDocument", self.text_document.to_json())
  obj.set("edits", @json.JsonValue::Array(self.edits.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextDocumentEdit with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextDocumentEdit")
  }
  let text_document = match obj.get("textDocument") {
    Some(v) => OptionalVersionedTextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing textDocument")
  }
  let edits = match obj.get("edits") {
    Some(v) => match v { @json.JsonValue::Array(items) => items; _ => [] }
    None => raise @json.JsonError("missing edits")
  }
  TextDocumentEdit::{ text_document, edits }
}

///| Create file operation.
///| Extends: ResourceOperation
pub struct CreateFile {
  ///| The resource operation kind.
  kind : String
  ///| An optional annotation identifier describing the operation.
  annotation_id : ChangeAnnotationIdentifier?
  ///| The resource to create.
  uri : String
  ///| Additional options
  options : CreateFileOptions?
}

///|
pub impl @json.ToJson for CreateFile with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("kind", @json.JsonValue::String(self.kind))
  match self.annotation_id {
    Some(v) => obj.set("annotationId", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("uri", @json.JsonValue::String(self.uri))
  match self.options {
    Some(v) => obj.set("options", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CreateFile with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CreateFile")
  }
  let kind = match obj.get("kind") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing kind")
  }
  let annotation_id : ChangeAnnotationIdentifier? = match obj.get("annotationId") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let uri = match obj.get("uri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing uri")
  }
  let options : CreateFileOptions? = match obj.get("options") {
    Some(v) if not(v.is_null()) => Some(CreateFileOptions::from_json(v))
    _ => None
  }
  CreateFile::{ kind, annotation_id, uri, options }
}

///| Rename file operation
///| Extends: ResourceOperation
pub struct RenameFile {
  ///| The resource operation kind.
  kind : String
  ///| An optional annotation identifier describing the operation.
  annotation_id : ChangeAnnotationIdentifier?
  ///| The old (existing) location.
  old_uri : String
  ///| The new location.
  new_uri : String
  ///| Rename options.
  options : RenameFileOptions?
}

///|
pub impl @json.ToJson for RenameFile with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("kind", @json.JsonValue::String(self.kind))
  match self.annotation_id {
    Some(v) => obj.set("annotationId", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("oldUri", @json.JsonValue::String(self.old_uri))
  obj.set("newUri", @json.JsonValue::String(self.new_uri))
  match self.options {
    Some(v) => obj.set("options", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for RenameFile with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for RenameFile")
  }
  let kind = match obj.get("kind") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing kind")
  }
  let annotation_id : ChangeAnnotationIdentifier? = match obj.get("annotationId") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let old_uri = match obj.get("oldUri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing oldUri")
  }
  let new_uri = match obj.get("newUri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing newUri")
  }
  let options : RenameFileOptions? = match obj.get("options") {
    Some(v) if not(v.is_null()) => Some(RenameFileOptions::from_json(v))
    _ => None
  }
  RenameFile::{ kind, annotation_id, old_uri, new_uri, options }
}

///| Delete file operation
///| Extends: ResourceOperation
pub struct DeleteFile {
  ///| The resource operation kind.
  kind : String
  ///| An optional annotation identifier describing the operation.
  annotation_id : ChangeAnnotationIdentifier?
  ///| The file to delete.
  uri : String
  ///| Delete options.
  options : DeleteFileOptions?
}

///|
pub impl @json.ToJson for DeleteFile with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("kind", @json.JsonValue::String(self.kind))
  match self.annotation_id {
    Some(v) => obj.set("annotationId", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("uri", @json.JsonValue::String(self.uri))
  match self.options {
    Some(v) => obj.set("options", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DeleteFile with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DeleteFile")
  }
  let kind = match obj.get("kind") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing kind")
  }
  let annotation_id : ChangeAnnotationIdentifier? = match obj.get("annotationId") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let uri = match obj.get("uri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing uri")
  }
  let options : DeleteFileOptions? = match obj.get("options") {
    Some(v) if not(v.is_null()) => Some(DeleteFileOptions::from_json(v))
    _ => None
  }
  DeleteFile::{ kind, annotation_id, uri, options }
}

///| Additional information that describes document changes.
pub struct ChangeAnnotation {
  ///| A human-readable string describing the actual change. The string
  label : String
  ///| A flag which indicates that user confirmation is needed
  needs_confirmation : Bool?
  ///| A human-readable string which is rendered less prominent in
  description : String?
}

///|
pub impl @json.ToJson for ChangeAnnotation with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("label", @json.JsonValue::String(self.label))
  match self.needs_confirmation {
    Some(v) => obj.set("needsConfirmation", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.description {
    Some(v) => obj.set("description", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ChangeAnnotation with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ChangeAnnotation")
  }
  let label = match obj.get("label") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing label")
  }
  let needs_confirmation : Bool? = match obj.get("needsConfirmation") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let description : String? = match obj.get("description") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  ChangeAnnotation::{ label, needs_confirmation, description }
}

///| A filter to describe in which file operation requests or notifications
pub struct FileOperationFilter {
  ///| A Uri scheme like `file` or `untitled`.
  scheme : String?
  ///| The actual file operation pattern.
  pattern : FileOperationPattern
}

///|
pub impl @json.ToJson for FileOperationFilter with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.scheme {
    Some(v) => obj.set("scheme", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("pattern", self.pattern.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for FileOperationFilter with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for FileOperationFilter")
  }
  let scheme : String? = match obj.get("scheme") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let pattern = match obj.get("pattern") {
    Some(v) => FileOperationPattern::from_json(v)
    None => raise @json.JsonError("missing pattern")
  }
  FileOperationFilter::{ scheme, pattern }
}

///| Represents information on a file/folder rename.
pub struct FileRename {
  ///| A file:// URI for the original location of the file/folder being renamed.
  old_uri : String
  ///| A file:// URI for the new location of the file/folder being renamed.
  new_uri : String
}

///|
pub impl @json.ToJson for FileRename with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("oldUri", @json.JsonValue::String(self.old_uri))
  obj.set("newUri", @json.JsonValue::String(self.new_uri))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for FileRename with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for FileRename")
  }
  let old_uri = match obj.get("oldUri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing oldUri")
  }
  let new_uri = match obj.get("newUri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing newUri")
  }
  FileRename::{ old_uri, new_uri }
}

///| Represents information on a file/folder delete.
pub struct FileDelete {
  ///| A file:// URI for the location of the file/folder being deleted.
  uri : String
}

///|
pub impl @json.ToJson for FileDelete with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("uri", @json.JsonValue::String(self.uri))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for FileDelete with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for FileDelete")
  }
  let uri = match obj.get("uri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing uri")
  }
  FileDelete::{ uri }
}

///| Mixins: WorkDoneProgressOptions
pub struct MonikerOptions {
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for MonikerOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for MonikerOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for MonikerOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  MonikerOptions::{ work_done_progress }
}

///| Type hierarchy options used during static registration.
///| Mixins: WorkDoneProgressOptions
pub struct TypeHierarchyOptions {
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for TypeHierarchyOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TypeHierarchyOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TypeHierarchyOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  TypeHierarchyOptions::{ work_done_progress }
}

///| @since 3.17.0
pub struct InlineValueContext {
  ///| The stack frame (as a DAP Id) where the execution has stopped.
  frame_id : Int
  ///| The document range where execution has stopped.
  stopped_location : Range
}

///|
pub impl @json.ToJson for InlineValueContext with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("frameId", @json.JsonValue::Number(self.frame_id.to_double()))
  obj.set("stoppedLocation", self.stopped_location.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlineValueContext with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlineValueContext")
  }
  let frame_id = match obj.get("frameId") {
    Some(v) => match v { @json.JsonValue::Number(n) => n.to_int(); _ => raise @json.JsonError("expected number") }
    None => raise @json.JsonError("missing frameId")
  }
  let stopped_location = match obj.get("stoppedLocation") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing stoppedLocation")
  }
  InlineValueContext::{ frame_id, stopped_location }
}

///| Provide inline value as text.
pub struct InlineValueText {
  ///| The document range for which the inline value applies.
  range : Range
  ///| The text of the inline value.
  text : String
}

///|
pub impl @json.ToJson for InlineValueText with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("range", self.range.to_json())
  obj.set("text", @json.JsonValue::String(self.text))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlineValueText with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlineValueText")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  let text = match obj.get("text") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing text")
  }
  InlineValueText::{ range, text }
}

///| Provide inline value through a variable lookup.
pub struct InlineValueVariableLookup {
  ///| The document range for which the inline value applies.
  range : Range
  ///| If specified the name of the variable to look up.
  variable_name : String?
  ///| How to perform the lookup.
  case_sensitive_lookup : Bool
}

///|
pub impl @json.ToJson for InlineValueVariableLookup with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("range", self.range.to_json())
  match self.variable_name {
    Some(v) => obj.set("variableName", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("caseSensitiveLookup", @json.JsonValue::Bool(self.case_sensitive_lookup))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlineValueVariableLookup with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlineValueVariableLookup")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  let variable_name : String? = match obj.get("variableName") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let case_sensitive_lookup = match obj.get("caseSensitiveLookup") {
    Some(v) => match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") }
    None => raise @json.JsonError("missing caseSensitiveLookup")
  }
  InlineValueVariableLookup::{ range, variable_name, case_sensitive_lookup }
}

///| Provide an inline value through an expression evaluation.
pub struct InlineValueEvaluatableExpression {
  ///| The document range for which the inline value applies.
  range : Range
  ///| If specified the expression overrides the extracted expression.
  expression : String?
}

///|
pub impl @json.ToJson for InlineValueEvaluatableExpression with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("range", self.range.to_json())
  match self.expression {
    Some(v) => obj.set("expression", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlineValueEvaluatableExpression with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlineValueEvaluatableExpression")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  let expression : String? = match obj.get("expression") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  InlineValueEvaluatableExpression::{ range, expression }
}

///| Inline value options used during static registration.
///| Mixins: WorkDoneProgressOptions
pub struct InlineValueOptions {
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for InlineValueOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlineValueOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlineValueOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  InlineValueOptions::{ work_done_progress }
}

///| An inlay hint label part allows for interactive and composite labels
pub struct InlayHintLabelPart {
  ///| The value of this label part.
  value : String
  ///| The tooltip text when you hover over this label part. Depending on
  tooltip : @json.JsonValue?
  ///| An optional source code location that represents this
  location : Location?
  ///| An optional command for this label part.
  command : Command?
}

///|
pub impl @json.ToJson for InlayHintLabelPart with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("value", @json.JsonValue::String(self.value))
  match self.tooltip {
    Some(v) => obj.set("tooltip", v)
    None => ()
  }
  match self.location {
    Some(v) => obj.set("location", v.to_json())
    None => ()
  }
  match self.command {
    Some(v) => obj.set("command", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlayHintLabelPart with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlayHintLabelPart")
  }
  let value = match obj.get("value") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing value")
  }
  let tooltip : @json.JsonValue? = obj.get("tooltip")
  let location : Location? = match obj.get("location") {
    Some(v) if not(v.is_null()) => Some(Location::from_json(v))
    _ => None
  }
  let command : Command? = match obj.get("command") {
    Some(v) if not(v.is_null()) => Some(Command::from_json(v))
    _ => None
  }
  InlayHintLabelPart::{ value, tooltip, location, command }
}

///| A `MarkupContent` literal represents a string value which content is interpreted base on its
pub struct MarkupContent {
  ///| The type of the Markup
  kind : MarkupKind
  ///| The content itself
  value : String
}

///|
pub impl @json.ToJson for MarkupContent with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("kind", self.kind.to_json())
  obj.set("value", @json.JsonValue::String(self.value))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for MarkupContent with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for MarkupContent")
  }
  let kind = match obj.get("kind") {
    Some(v) => MarkupKind::from_json(v)
    None => raise @json.JsonError("missing kind")
  }
  let value = match obj.get("value") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing value")
  }
  MarkupContent::{ kind, value }
}

///| Inlay hint options used during static registration.
///| Mixins: WorkDoneProgressOptions
pub struct InlayHintOptions {
  work_done_progress : Bool?
  ///| The server provides support to resolve additional
  resolve_provider : Bool?
}

///|
pub impl @json.ToJson for InlayHintOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.resolve_provider {
    Some(v) => obj.set("resolveProvider", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlayHintOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlayHintOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let resolve_provider : Bool? = match obj.get("resolveProvider") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  InlayHintOptions::{ work_done_progress, resolve_provider }
}

///| A full diagnostic report with a set of related documents.
///| Extends: FullDocumentDiagnosticReport
pub struct RelatedFullDocumentDiagnosticReport {
  ///| A full document diagnostic report.
  kind : String
  ///| An optional result id. If provided it will
  result_id : String?
  ///| The actual items.
  items : Array[Diagnostic]
  ///| Diagnostics of related documents. This information is useful
  related_documents : @json.JsonValue?
}

///|
pub impl @json.ToJson for RelatedFullDocumentDiagnosticReport with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("kind", @json.JsonValue::String(self.kind))
  match self.result_id {
    Some(v) => obj.set("resultId", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("items", @json.JsonValue::Array(self.items.map(fn(item) { item.to_json() })))
  match self.related_documents {
    Some(v) => obj.set("relatedDocuments", v)
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for RelatedFullDocumentDiagnosticReport with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for RelatedFullDocumentDiagnosticReport")
  }
  let kind = match obj.get("kind") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing kind")
  }
  let result_id : String? = match obj.get("resultId") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let items = match obj.get("items") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { Diagnostic::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing items")
  }
  let related_documents : @json.JsonValue? = obj.get("relatedDocuments")
  RelatedFullDocumentDiagnosticReport::{ kind, result_id, items, related_documents }
}

///| An unchanged diagnostic report with a set of related documents.
///| Extends: UnchangedDocumentDiagnosticReport
pub struct RelatedUnchangedDocumentDiagnosticReport {
  ///| A document diagnostic report indicating
  kind : String
  ///| A result id which will be sent on the next
  result_id : String
  ///| Diagnostics of related documents. This information is useful
  related_documents : @json.JsonValue?
}

///|
pub impl @json.ToJson for RelatedUnchangedDocumentDiagnosticReport with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("kind", @json.JsonValue::String(self.kind))
  obj.set("resultId", @json.JsonValue::String(self.result_id))
  match self.related_documents {
    Some(v) => obj.set("relatedDocuments", v)
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for RelatedUnchangedDocumentDiagnosticReport with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for RelatedUnchangedDocumentDiagnosticReport")
  }
  let kind = match obj.get("kind") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing kind")
  }
  let result_id = match obj.get("resultId") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing resultId")
  }
  let related_documents : @json.JsonValue? = obj.get("relatedDocuments")
  RelatedUnchangedDocumentDiagnosticReport::{ kind, result_id, related_documents }
}

///| A diagnostic report with a full set of problems.
pub struct FullDocumentDiagnosticReport {
  ///| A full document diagnostic report.
  kind : String
  ///| An optional result id. If provided it will
  result_id : String?
  ///| The actual items.
  items : Array[Diagnostic]
}

///|
pub impl @json.ToJson for FullDocumentDiagnosticReport with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("kind", @json.JsonValue::String(self.kind))
  match self.result_id {
    Some(v) => obj.set("resultId", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("items", @json.JsonValue::Array(self.items.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for FullDocumentDiagnosticReport with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for FullDocumentDiagnosticReport")
  }
  let kind = match obj.get("kind") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing kind")
  }
  let result_id : String? = match obj.get("resultId") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let items = match obj.get("items") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { Diagnostic::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing items")
  }
  FullDocumentDiagnosticReport::{ kind, result_id, items }
}

///| A diagnostic report indicating that the last returned
pub struct UnchangedDocumentDiagnosticReport {
  ///| A document diagnostic report indicating
  kind : String
  ///| A result id which will be sent on the next
  result_id : String
}

///|
pub impl @json.ToJson for UnchangedDocumentDiagnosticReport with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("kind", @json.JsonValue::String(self.kind))
  obj.set("resultId", @json.JsonValue::String(self.result_id))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for UnchangedDocumentDiagnosticReport with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for UnchangedDocumentDiagnosticReport")
  }
  let kind = match obj.get("kind") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing kind")
  }
  let result_id = match obj.get("resultId") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing resultId")
  }
  UnchangedDocumentDiagnosticReport::{ kind, result_id }
}

///| Diagnostic options.
///| Mixins: WorkDoneProgressOptions
pub struct DiagnosticOptions {
  work_done_progress : Bool?
  ///| An optional identifier under which the diagnostics are
  identifier : String?
  ///| Whether the language has inter file dependencies meaning that
  inter_file_dependencies : Bool
  ///| The server provides support for workspace diagnostics as well.
  workspace_diagnostics : Bool
}

///|
pub impl @json.ToJson for DiagnosticOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.identifier {
    Some(v) => obj.set("identifier", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("interFileDependencies", @json.JsonValue::Bool(self.inter_file_dependencies))
  obj.set("workspaceDiagnostics", @json.JsonValue::Bool(self.workspace_diagnostics))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DiagnosticOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DiagnosticOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let identifier : String? = match obj.get("identifier") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let inter_file_dependencies = match obj.get("interFileDependencies") {
    Some(v) => match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") }
    None => raise @json.JsonError("missing interFileDependencies")
  }
  let workspace_diagnostics = match obj.get("workspaceDiagnostics") {
    Some(v) => match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") }
    None => raise @json.JsonError("missing workspaceDiagnostics")
  }
  DiagnosticOptions::{ work_done_progress, identifier, inter_file_dependencies, workspace_diagnostics }
}

///| A previous result id in a workspace pull request.
pub struct PreviousResultId {
  ///| The URI for which the client knowns a
  uri : String
  ///| The value of the previous result id.
  value : String
}

///|
pub impl @json.ToJson for PreviousResultId with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("uri", @json.JsonValue::String(self.uri))
  obj.set("value", @json.JsonValue::String(self.value))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for PreviousResultId with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for PreviousResultId")
  }
  let uri = match obj.get("uri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing uri")
  }
  let value = match obj.get("value") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing value")
  }
  PreviousResultId::{ uri, value }
}

///| A notebook document.
pub struct NotebookDocument {
  ///| The notebook document's uri.
  uri : String
  ///| The type of the notebook.
  notebook_type : String
  ///| The version number of this document (it will increase after each
  version : Int
  ///| Additional metadata stored with the notebook
  metadata : LSPObject?
  ///| The cells of a notebook.
  cells : Array[NotebookCell]
}

///|
pub impl @json.ToJson for NotebookDocument with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("uri", @json.JsonValue::String(self.uri))
  obj.set("notebookType", @json.JsonValue::String(self.notebook_type))
  obj.set("version", @json.JsonValue::Number(self.version.to_double()))
  match self.metadata {
    Some(v) => obj.set("metadata", v.to_json())
    None => ()
  }
  obj.set("cells", @json.JsonValue::Array(self.cells.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for NotebookDocument with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for NotebookDocument")
  }
  let uri = match obj.get("uri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing uri")
  }
  let notebook_type = match obj.get("notebookType") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing notebookType")
  }
  let version = match obj.get("version") {
    Some(v) => match v { @json.JsonValue::Number(n) => n.to_int(); _ => raise @json.JsonError("expected number") }
    None => raise @json.JsonError("missing version")
  }
  let metadata : LSPObject? = match obj.get("metadata") {
    Some(v) if not(v.is_null()) => Some(LSPObject::from_json(v))
    _ => None
  }
  let cells = match obj.get("cells") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { NotebookCell::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing cells")
  }
  NotebookDocument::{ uri, notebook_type, version, metadata, cells }
}

///| Options specific to a notebook plus its cells
pub struct NotebookDocumentSyncOptions {
  ///| The notebooks to be synced
  notebook_selector : Array[@json.JsonValue]
  ///| Whether save notification should be forwarded to
  save : Bool?
}

///|
pub impl @json.ToJson for NotebookDocumentSyncOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("notebookSelector", @json.JsonValue::Array(self.notebook_selector.map(fn(item) { item.to_json() })))
  match self.save {
    Some(v) => obj.set("save", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for NotebookDocumentSyncOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for NotebookDocumentSyncOptions")
  }
  let notebook_selector = match obj.get("notebookSelector") {
    Some(v) => match v { @json.JsonValue::Array(items) => items; _ => [] }
    None => raise @json.JsonError("missing notebookSelector")
  }
  let save : Bool? = match obj.get("save") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  NotebookDocumentSyncOptions::{ notebook_selector, save }
}

///| A versioned notebook document identifier.
pub struct VersionedNotebookDocumentIdentifier {
  ///| The version number of this notebook document.
  version : Int
  ///| The notebook document's uri.
  uri : String
}

///|
pub impl @json.ToJson for VersionedNotebookDocumentIdentifier with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("version", @json.JsonValue::Number(self.version.to_double()))
  obj.set("uri", @json.JsonValue::String(self.uri))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for VersionedNotebookDocumentIdentifier with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for VersionedNotebookDocumentIdentifier")
  }
  let version = match obj.get("version") {
    Some(v) => match v { @json.JsonValue::Number(n) => n.to_int(); _ => raise @json.JsonError("expected number") }
    None => raise @json.JsonError("missing version")
  }
  let uri = match obj.get("uri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing uri")
  }
  VersionedNotebookDocumentIdentifier::{ version, uri }
}

///| A change event for a notebook document.
pub struct NotebookDocumentChangeEvent {
  ///| The changed meta data if any.
  metadata : LSPObject?
  ///| Changes to cells
  cells : NotebookDocumentCellChanges?
}

///|
pub impl @json.ToJson for NotebookDocumentChangeEvent with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.metadata {
    Some(v) => obj.set("metadata", v.to_json())
    None => ()
  }
  match self.cells {
    Some(v) => obj.set("cells", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for NotebookDocumentChangeEvent with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for NotebookDocumentChangeEvent")
  }
  let metadata : LSPObject? = match obj.get("metadata") {
    Some(v) if not(v.is_null()) => Some(LSPObject::from_json(v))
    _ => None
  }
  let cells : NotebookDocumentCellChanges? = match obj.get("cells") {
    Some(v) if not(v.is_null()) => Some(NotebookDocumentCellChanges::from_json(v))
    _ => None
  }
  NotebookDocumentChangeEvent::{ metadata, cells }
}

///| A literal to identify a notebook document in the client.
pub struct NotebookDocumentIdentifier {
  ///| The notebook document's uri.
  uri : String
}

///|
pub impl @json.ToJson for NotebookDocumentIdentifier with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("uri", @json.JsonValue::String(self.uri))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for NotebookDocumentIdentifier with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for NotebookDocumentIdentifier")
  }
  let uri = match obj.get("uri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing uri")
  }
  NotebookDocumentIdentifier::{ uri }
}

///| Provides information about the context in which an inline completion was requested.
pub struct InlineCompletionContext {
  ///| Describes how the inline completion was triggered.
  trigger_kind : InlineCompletionTriggerKind
  ///| Provides information about the currently selected item in the autocomplete widget if it is visible.
  selected_completion_info : SelectedCompletionInfo?
}

///|
pub impl @json.ToJson for InlineCompletionContext with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("triggerKind", self.trigger_kind.to_json())
  match self.selected_completion_info {
    Some(v) => obj.set("selectedCompletionInfo", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlineCompletionContext with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlineCompletionContext")
  }
  let trigger_kind = match obj.get("triggerKind") {
    Some(v) => InlineCompletionTriggerKind::from_json(v)
    None => raise @json.JsonError("missing triggerKind")
  }
  let selected_completion_info : SelectedCompletionInfo? = match obj.get("selectedCompletionInfo") {
    Some(v) if not(v.is_null()) => Some(SelectedCompletionInfo::from_json(v))
    _ => None
  }
  InlineCompletionContext::{ trigger_kind, selected_completion_info }
}

///| A string value used as a snippet is a template which allows to insert text
pub struct StringValue {
  ///| The kind of string value.
  kind : String
  ///| The snippet string.
  value : String
}

///|
pub impl @json.ToJson for StringValue with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("kind", @json.JsonValue::String(self.kind))
  obj.set("value", @json.JsonValue::String(self.value))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for StringValue with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for StringValue")
  }
  let kind = match obj.get("kind") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing kind")
  }
  let value = match obj.get("value") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing value")
  }
  StringValue::{ kind, value }
}

///| Inline completion options used during static registration.
///| Mixins: WorkDoneProgressOptions
pub struct InlineCompletionOptions {
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for InlineCompletionOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlineCompletionOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlineCompletionOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  InlineCompletionOptions::{ work_done_progress }
}

///| Text document content provider options.
pub struct TextDocumentContentOptions {
  ///| The schemes for which the server provides content.
  schemes : Array[String]
}

///|
pub impl @json.ToJson for TextDocumentContentOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("schemes", @json.JsonValue::Array(self.schemes.map(fn(item) { @json.JsonValue::String(item) })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextDocumentContentOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextDocumentContentOptions")
  }
  let schemes = match obj.get("schemes") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] }
    None => raise @json.JsonError("missing schemes")
  }
  TextDocumentContentOptions::{ schemes }
}

///| General parameters to register for a notification or to register a provider.
pub struct Registration {
  ///| The id used to register the request. The id can be used to deregister
  id : String
  ///| The method / capability to register for.
  method : String
  ///| Options necessary for the registration.
  register_options : LSPAny?
}

///|
pub impl @json.ToJson for Registration with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("id", @json.JsonValue::String(self.id))
  obj.set("method", @json.JsonValue::String(self.method))
  match self.register_options {
    Some(v) => obj.set("registerOptions", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for Registration with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for Registration")
  }
  let id = match obj.get("id") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing id")
  }
  let method = match obj.get("method") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing method")
  }
  let register_options : LSPAny? = match obj.get("registerOptions") {
    Some(v) if not(v.is_null()) => Some(LSPAny::from_json(v))
    _ => None
  }
  Registration::{ id, method, register_options }
}

///| General parameters to unregister a request or notification.
pub struct Unregistration {
  ///| The id used to unregister the request or notification. Usually an id
  id : String
  ///| The method to unregister for.
  method : String
}

///|
pub impl @json.ToJson for Unregistration with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("id", @json.JsonValue::String(self.id))
  obj.set("method", @json.JsonValue::String(self.method))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for Unregistration with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for Unregistration")
  }
  let id = match obj.get("id") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing id")
  }
  let method = match obj.get("method") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing method")
  }
  Unregistration::{ id, method }
}

pub struct WorkspaceFoldersInitializeParams {
  ///| The workspace folders configured in the client when the server starts.
  workspace_folders : @json.JsonValue?
}

///|
pub impl @json.ToJson for WorkspaceFoldersInitializeParams with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.workspace_folders {
    Some(v) => obj.set("workspaceFolders", v)
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkspaceFoldersInitializeParams with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkspaceFoldersInitializeParams")
  }
  let workspace_folders : @json.JsonValue? = obj.get("workspaceFolders")
  WorkspaceFoldersInitializeParams::{ workspace_folders }
}

///| Defines the capabilities provided by a language
pub struct ServerCapabilities {
  ///| The position encoding the server picked from the encodings offered
  position_encoding : PositionEncodingKind?
  ///| Defines how text documents are synced. Is either a detailed structure
  text_document_sync : @json.JsonValue?
  ///| Defines how notebook documents are synced.
  notebook_document_sync : @json.JsonValue?
  ///| The server provides completion support.
  completion_provider : CompletionOptions?
  ///| The server provides hover support.
  hover_provider : @json.JsonValue?
  ///| The server provides signature help support.
  signature_help_provider : SignatureHelpOptions?
  ///| The server provides Goto Declaration support.
  declaration_provider : @json.JsonValue?
  ///| The server provides goto definition support.
  definition_provider : @json.JsonValue?
  ///| The server provides Goto Type Definition support.
  type_definition_provider : @json.JsonValue?
  ///| The server provides Goto Implementation support.
  implementation_provider : @json.JsonValue?
  ///| The server provides find references support.
  references_provider : @json.JsonValue?
  ///| The server provides document highlight support.
  document_highlight_provider : @json.JsonValue?
  ///| The server provides document symbol support.
  document_symbol_provider : @json.JsonValue?
  ///| The server provides code actions. CodeActionOptions may only be
  code_action_provider : @json.JsonValue?
  ///| The server provides code lens.
  code_lens_provider : CodeLensOptions?
  ///| The server provides document link support.
  document_link_provider : DocumentLinkOptions?
  ///| The server provides color provider support.
  color_provider : @json.JsonValue?
  ///| The server provides workspace symbol support.
  workspace_symbol_provider : @json.JsonValue?
  ///| The server provides document formatting.
  document_formatting_provider : @json.JsonValue?
  ///| The server provides document range formatting.
  document_range_formatting_provider : @json.JsonValue?
  ///| The server provides document formatting on typing.
  document_on_type_formatting_provider : DocumentOnTypeFormattingOptions?
  ///| The server provides rename support. RenameOptions may only be
  rename_provider : @json.JsonValue?
  ///| The server provides folding provider support.
  folding_range_provider : @json.JsonValue?
  ///| The server provides selection range support.
  selection_range_provider : @json.JsonValue?
  ///| The server provides execute command support.
  execute_command_provider : ExecuteCommandOptions?
  ///| The server provides call hierarchy support.
  call_hierarchy_provider : @json.JsonValue?
  ///| The server provides linked editing range support.
  linked_editing_range_provider : @json.JsonValue?
  ///| The server provides semantic tokens support.
  semantic_tokens_provider : @json.JsonValue?
  ///| The server provides moniker support.
  moniker_provider : @json.JsonValue?
  ///| The server provides type hierarchy support.
  type_hierarchy_provider : @json.JsonValue?
  ///| The server provides inline values.
  inline_value_provider : @json.JsonValue?
  ///| The server provides inlay hints.
  inlay_hint_provider : @json.JsonValue?
  ///| The server has support for pull model diagnostics.
  diagnostic_provider : @json.JsonValue?
  ///| Inline completion options used during static registration.
  inline_completion_provider : @json.JsonValue?
  ///| Workspace specific server capabilities.
  workspace : WorkspaceOptions?
  ///| Experimental server capabilities.
  experimental : LSPAny?
}

///|
pub impl @json.ToJson for ServerCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.position_encoding {
    Some(v) => obj.set("positionEncoding", v.to_json())
    None => ()
  }
  match self.text_document_sync {
    Some(v) => obj.set("textDocumentSync", v)
    None => ()
  }
  match self.notebook_document_sync {
    Some(v) => obj.set("notebookDocumentSync", v)
    None => ()
  }
  match self.completion_provider {
    Some(v) => obj.set("completionProvider", v.to_json())
    None => ()
  }
  match self.hover_provider {
    Some(v) => obj.set("hoverProvider", v)
    None => ()
  }
  match self.signature_help_provider {
    Some(v) => obj.set("signatureHelpProvider", v.to_json())
    None => ()
  }
  match self.declaration_provider {
    Some(v) => obj.set("declarationProvider", v)
    None => ()
  }
  match self.definition_provider {
    Some(v) => obj.set("definitionProvider", v)
    None => ()
  }
  match self.type_definition_provider {
    Some(v) => obj.set("typeDefinitionProvider", v)
    None => ()
  }
  match self.implementation_provider {
    Some(v) => obj.set("implementationProvider", v)
    None => ()
  }
  match self.references_provider {
    Some(v) => obj.set("referencesProvider", v)
    None => ()
  }
  match self.document_highlight_provider {
    Some(v) => obj.set("documentHighlightProvider", v)
    None => ()
  }
  match self.document_symbol_provider {
    Some(v) => obj.set("documentSymbolProvider", v)
    None => ()
  }
  match self.code_action_provider {
    Some(v) => obj.set("codeActionProvider", v)
    None => ()
  }
  match self.code_lens_provider {
    Some(v) => obj.set("codeLensProvider", v.to_json())
    None => ()
  }
  match self.document_link_provider {
    Some(v) => obj.set("documentLinkProvider", v.to_json())
    None => ()
  }
  match self.color_provider {
    Some(v) => obj.set("colorProvider", v)
    None => ()
  }
  match self.workspace_symbol_provider {
    Some(v) => obj.set("workspaceSymbolProvider", v)
    None => ()
  }
  match self.document_formatting_provider {
    Some(v) => obj.set("documentFormattingProvider", v)
    None => ()
  }
  match self.document_range_formatting_provider {
    Some(v) => obj.set("documentRangeFormattingProvider", v)
    None => ()
  }
  match self.document_on_type_formatting_provider {
    Some(v) => obj.set("documentOnTypeFormattingProvider", v.to_json())
    None => ()
  }
  match self.rename_provider {
    Some(v) => obj.set("renameProvider", v)
    None => ()
  }
  match self.folding_range_provider {
    Some(v) => obj.set("foldingRangeProvider", v)
    None => ()
  }
  match self.selection_range_provider {
    Some(v) => obj.set("selectionRangeProvider", v)
    None => ()
  }
  match self.execute_command_provider {
    Some(v) => obj.set("executeCommandProvider", v.to_json())
    None => ()
  }
  match self.call_hierarchy_provider {
    Some(v) => obj.set("callHierarchyProvider", v)
    None => ()
  }
  match self.linked_editing_range_provider {
    Some(v) => obj.set("linkedEditingRangeProvider", v)
    None => ()
  }
  match self.semantic_tokens_provider {
    Some(v) => obj.set("semanticTokensProvider", v)
    None => ()
  }
  match self.moniker_provider {
    Some(v) => obj.set("monikerProvider", v)
    None => ()
  }
  match self.type_hierarchy_provider {
    Some(v) => obj.set("typeHierarchyProvider", v)
    None => ()
  }
  match self.inline_value_provider {
    Some(v) => obj.set("inlineValueProvider", v)
    None => ()
  }
  match self.inlay_hint_provider {
    Some(v) => obj.set("inlayHintProvider", v)
    None => ()
  }
  match self.diagnostic_provider {
    Some(v) => obj.set("diagnosticProvider", v)
    None => ()
  }
  match self.inline_completion_provider {
    Some(v) => obj.set("inlineCompletionProvider", v)
    None => ()
  }
  match self.workspace {
    Some(v) => obj.set("workspace", v.to_json())
    None => ()
  }
  match self.experimental {
    Some(v) => obj.set("experimental", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ServerCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ServerCapabilities")
  }
  let position_encoding : PositionEncodingKind? = match obj.get("positionEncoding") {
    Some(v) if not(v.is_null()) => Some(PositionEncodingKind::from_json(v))
    _ => None
  }
  let text_document_sync : @json.JsonValue? = obj.get("textDocumentSync")
  let notebook_document_sync : @json.JsonValue? = obj.get("notebookDocumentSync")
  let completion_provider : CompletionOptions? = match obj.get("completionProvider") {
    Some(v) if not(v.is_null()) => Some(CompletionOptions::from_json(v))
    _ => None
  }
  let hover_provider : @json.JsonValue? = obj.get("hoverProvider")
  let signature_help_provider : SignatureHelpOptions? = match obj.get("signatureHelpProvider") {
    Some(v) if not(v.is_null()) => Some(SignatureHelpOptions::from_json(v))
    _ => None
  }
  let declaration_provider : @json.JsonValue? = obj.get("declarationProvider")
  let definition_provider : @json.JsonValue? = obj.get("definitionProvider")
  let type_definition_provider : @json.JsonValue? = obj.get("typeDefinitionProvider")
  let implementation_provider : @json.JsonValue? = obj.get("implementationProvider")
  let references_provider : @json.JsonValue? = obj.get("referencesProvider")
  let document_highlight_provider : @json.JsonValue? = obj.get("documentHighlightProvider")
  let document_symbol_provider : @json.JsonValue? = obj.get("documentSymbolProvider")
  let code_action_provider : @json.JsonValue? = obj.get("codeActionProvider")
  let code_lens_provider : CodeLensOptions? = match obj.get("codeLensProvider") {
    Some(v) if not(v.is_null()) => Some(CodeLensOptions::from_json(v))
    _ => None
  }
  let document_link_provider : DocumentLinkOptions? = match obj.get("documentLinkProvider") {
    Some(v) if not(v.is_null()) => Some(DocumentLinkOptions::from_json(v))
    _ => None
  }
  let color_provider : @json.JsonValue? = obj.get("colorProvider")
  let workspace_symbol_provider : @json.JsonValue? = obj.get("workspaceSymbolProvider")
  let document_formatting_provider : @json.JsonValue? = obj.get("documentFormattingProvider")
  let document_range_formatting_provider : @json.JsonValue? = obj.get("documentRangeFormattingProvider")
  let document_on_type_formatting_provider : DocumentOnTypeFormattingOptions? = match obj.get("documentOnTypeFormattingProvider") {
    Some(v) if not(v.is_null()) => Some(DocumentOnTypeFormattingOptions::from_json(v))
    _ => None
  }
  let rename_provider : @json.JsonValue? = obj.get("renameProvider")
  let folding_range_provider : @json.JsonValue? = obj.get("foldingRangeProvider")
  let selection_range_provider : @json.JsonValue? = obj.get("selectionRangeProvider")
  let execute_command_provider : ExecuteCommandOptions? = match obj.get("executeCommandProvider") {
    Some(v) if not(v.is_null()) => Some(ExecuteCommandOptions::from_json(v))
    _ => None
  }
  let call_hierarchy_provider : @json.JsonValue? = obj.get("callHierarchyProvider")
  let linked_editing_range_provider : @json.JsonValue? = obj.get("linkedEditingRangeProvider")
  let semantic_tokens_provider : @json.JsonValue? = obj.get("semanticTokensProvider")
  let moniker_provider : @json.JsonValue? = obj.get("monikerProvider")
  let type_hierarchy_provider : @json.JsonValue? = obj.get("typeHierarchyProvider")
  let inline_value_provider : @json.JsonValue? = obj.get("inlineValueProvider")
  let inlay_hint_provider : @json.JsonValue? = obj.get("inlayHintProvider")
  let diagnostic_provider : @json.JsonValue? = obj.get("diagnosticProvider")
  let inline_completion_provider : @json.JsonValue? = obj.get("inlineCompletionProvider")
  let workspace : WorkspaceOptions? = match obj.get("workspace") {
    Some(v) if not(v.is_null()) => Some(WorkspaceOptions::from_json(v))
    _ => None
  }
  let experimental : LSPAny? = match obj.get("experimental") {
    Some(v) if not(v.is_null()) => Some(LSPAny::from_json(v))
    _ => None
  }
  ServerCapabilities::{ position_encoding, text_document_sync, notebook_document_sync, completion_provider, hover_provider, signature_help_provider, declaration_provider, definition_provider, type_definition_provider, implementation_provider, references_provider, document_highlight_provider, document_symbol_provider, code_action_provider, code_lens_provider, document_link_provider, color_provider, workspace_symbol_provider, document_formatting_provider, document_range_formatting_provider, document_on_type_formatting_provider, rename_provider, folding_range_provider, selection_range_provider, execute_command_provider, call_hierarchy_provider, linked_editing_range_provider, semantic_tokens_provider, moniker_provider, type_hierarchy_provider, inline_value_provider, inlay_hint_provider, diagnostic_provider, inline_completion_provider, workspace, experimental }
}

///| Information about the server
pub struct ServerInfo {
  ///| The name of the server as defined by the server.
  name : String
  ///| The server's version as defined by the server.
  version : String?
}

///|
pub impl @json.ToJson for ServerInfo with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("name", @json.JsonValue::String(self.name))
  match self.version {
    Some(v) => obj.set("version", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ServerInfo with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ServerInfo")
  }
  let name = match obj.get("name") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing name")
  }
  let version : String? = match obj.get("version") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  ServerInfo::{ name, version }
}

///| Save options.
pub struct SaveOptions {
  ///| The client is supposed to include the content on save.
  include_text : Bool?
}

///|
pub impl @json.ToJson for SaveOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.include_text {
    Some(v) => obj.set("includeText", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SaveOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SaveOptions")
  }
  let include_text : Bool? = match obj.get("includeText") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  SaveOptions::{ include_text }
}

///| An event describing a file change.
pub struct FileEvent {
  ///| The file's uri.
  uri : String
  ///| The change type.
  type_ : FileChangeType
}

///|
pub impl @json.ToJson for FileEvent with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("uri", @json.JsonValue::String(self.uri))
  obj.set("type", self.type_.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for FileEvent with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for FileEvent")
  }
  let uri = match obj.get("uri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing uri")
  }
  let type_ = match obj.get("type") {
    Some(v) => FileChangeType::from_json(v)
    None => raise @json.JsonError("missing type")
  }
  FileEvent::{ uri, type_ }
}

pub struct FileSystemWatcher {
  ///| The glob pattern to watch. See {@link GlobPattern glob pattern} for more detail.
  glob_pattern : GlobPattern
  ///| The kind of events of interest. If omitted it defaults
  kind : WatchKind?
}

///|
pub impl @json.ToJson for FileSystemWatcher with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("globPattern", self.glob_pattern.to_json())
  match self.kind {
    Some(v) => obj.set("kind", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for FileSystemWatcher with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for FileSystemWatcher")
  }
  let glob_pattern = match obj.get("globPattern") {
    Some(v) => GlobPattern::from_json(v)
    None => raise @json.JsonError("missing globPattern")
  }
  let kind : WatchKind? = match obj.get("kind") {
    Some(v) if not(v.is_null()) => Some(WatchKind::from_json(v))
    _ => None
  }
  FileSystemWatcher::{ glob_pattern, kind }
}

///| Contains additional information about the context in which a completion request is triggered.
pub struct CompletionContext {
  ///| How the completion was triggered.
  trigger_kind : CompletionTriggerKind
  ///| The trigger character (a single character) that has trigger code complete.
  trigger_character : String?
}

///|
pub impl @json.ToJson for CompletionContext with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("triggerKind", self.trigger_kind.to_json())
  match self.trigger_character {
    Some(v) => obj.set("triggerCharacter", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CompletionContext with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CompletionContext")
  }
  let trigger_kind = match obj.get("triggerKind") {
    Some(v) => CompletionTriggerKind::from_json(v)
    None => raise @json.JsonError("missing triggerKind")
  }
  let trigger_character : String? = match obj.get("triggerCharacter") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  CompletionContext::{ trigger_kind, trigger_character }
}

///| Additional details for a completion item label.
pub struct CompletionItemLabelDetails {
  ///| An optional string which is rendered less prominently directly after {@link CompletionItem.label lab
  detail : String?
  ///| An optional string which is rendered less prominently after {@link CompletionItem.detail}. Should be
  description : String?
}

///|
pub impl @json.ToJson for CompletionItemLabelDetails with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.detail {
    Some(v) => obj.set("detail", @json.JsonValue::String(v))
    None => ()
  }
  match self.description {
    Some(v) => obj.set("description", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CompletionItemLabelDetails with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CompletionItemLabelDetails")
  }
  let detail : String? = match obj.get("detail") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let description : String? = match obj.get("description") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  CompletionItemLabelDetails::{ detail, description }
}

///| A special text edit to provide an insert and a replace operation.
pub struct InsertReplaceEdit {
  ///| The string to be inserted.
  new_text : String
  ///| The range if the insert is requested
  insert : Range
  ///| The range if the replace is requested.
  replace : Range
}

///|
pub impl @json.ToJson for InsertReplaceEdit with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("newText", @json.JsonValue::String(self.new_text))
  obj.set("insert", self.insert.to_json())
  obj.set("replace", self.replace.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InsertReplaceEdit with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InsertReplaceEdit")
  }
  let new_text = match obj.get("newText") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing newText")
  }
  let insert = match obj.get("insert") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing insert")
  }
  let replace = match obj.get("replace") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing replace")
  }
  InsertReplaceEdit::{ new_text, insert, replace }
}

///| In many cases the items of an actual completion result share the same
pub struct CompletionItemDefaults {
  ///| A default commit character set.
  commit_characters : Array[String]?
  ///| A default edit range.
  edit_range : @json.JsonValue?
  ///| A default insert text format.
  insert_text_format : InsertTextFormat?
  ///| A default insert text mode.
  insert_text_mode : InsertTextMode?
  ///| A default data value.
  data : LSPAny?
}

///|
pub impl @json.ToJson for CompletionItemDefaults with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.commit_characters {
    Some(v) => obj.set("commitCharacters", @json.JsonValue::Array(v.map(fn(item) { @json.JsonValue::String(item) })))
    None => ()
  }
  match self.edit_range {
    Some(v) => obj.set("editRange", v)
    None => ()
  }
  match self.insert_text_format {
    Some(v) => obj.set("insertTextFormat", v.to_json())
    None => ()
  }
  match self.insert_text_mode {
    Some(v) => obj.set("insertTextMode", v.to_json())
    None => ()
  }
  match self.data {
    Some(v) => obj.set("data", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CompletionItemDefaults with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CompletionItemDefaults")
  }
  let commit_characters : Array[String]? = match obj.get("commitCharacters") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] })
    _ => None
  }
  let edit_range : @json.JsonValue? = obj.get("editRange")
  let insert_text_format : InsertTextFormat? = match obj.get("insertTextFormat") {
    Some(v) if not(v.is_null()) => Some(InsertTextFormat::from_json(v))
    _ => None
  }
  let insert_text_mode : InsertTextMode? = match obj.get("insertTextMode") {
    Some(v) if not(v.is_null()) => Some(InsertTextMode::from_json(v))
    _ => None
  }
  let data : LSPAny? = match obj.get("data") {
    Some(v) if not(v.is_null()) => Some(LSPAny::from_json(v))
    _ => None
  }
  CompletionItemDefaults::{ commit_characters, edit_range, insert_text_format, insert_text_mode, data }
}

///| Specifies how fields from a completion item should be combined with those
pub struct CompletionItemApplyKinds {
  ///| Specifies whether commitCharacters on a completion will replace or be
  commit_characters : ApplyKind?
  ///| Specifies whether the `data` field on a completion will replace or
  data : ApplyKind?
}

///|
pub impl @json.ToJson for CompletionItemApplyKinds with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.commit_characters {
    Some(v) => obj.set("commitCharacters", v.to_json())
    None => ()
  }
  match self.data {
    Some(v) => obj.set("data", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CompletionItemApplyKinds with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CompletionItemApplyKinds")
  }
  let commit_characters : ApplyKind? = match obj.get("commitCharacters") {
    Some(v) if not(v.is_null()) => Some(ApplyKind::from_json(v))
    _ => None
  }
  let data : ApplyKind? = match obj.get("data") {
    Some(v) if not(v.is_null()) => Some(ApplyKind::from_json(v))
    _ => None
  }
  CompletionItemApplyKinds::{ commit_characters, data }
}

///| Completion options.
///| Mixins: WorkDoneProgressOptions
pub struct CompletionOptions {
  work_done_progress : Bool?
  ///| Most tools trigger completion request automatically without explicitly requesting
  trigger_characters : Array[String]?
  ///| The list of all possible characters that commit a completion. This field can be used
  all_commit_characters : Array[String]?
  ///| The server provides support to resolve additional
  resolve_provider : Bool?
  ///| The server supports the following `CompletionItem` specific
  completion_item : ServerCompletionItemOptions?
}

///|
pub impl @json.ToJson for CompletionOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.trigger_characters {
    Some(v) => obj.set("triggerCharacters", @json.JsonValue::Array(v.map(fn(item) { @json.JsonValue::String(item) })))
    None => ()
  }
  match self.all_commit_characters {
    Some(v) => obj.set("allCommitCharacters", @json.JsonValue::Array(v.map(fn(item) { @json.JsonValue::String(item) })))
    None => ()
  }
  match self.resolve_provider {
    Some(v) => obj.set("resolveProvider", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.completion_item {
    Some(v) => obj.set("completionItem", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CompletionOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CompletionOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let trigger_characters : Array[String]? = match obj.get("triggerCharacters") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] })
    _ => None
  }
  let all_commit_characters : Array[String]? = match obj.get("allCommitCharacters") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] })
    _ => None
  }
  let resolve_provider : Bool? = match obj.get("resolveProvider") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let completion_item : ServerCompletionItemOptions? = match obj.get("completionItem") {
    Some(v) if not(v.is_null()) => Some(ServerCompletionItemOptions::from_json(v))
    _ => None
  }
  CompletionOptions::{ work_done_progress, trigger_characters, all_commit_characters, resolve_provider, completion_item }
}

///| Hover options.
///| Mixins: WorkDoneProgressOptions
pub struct HoverOptions {
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for HoverOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for HoverOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for HoverOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  HoverOptions::{ work_done_progress }
}

///| Additional information about the context in which a signature help request was triggered.
pub struct SignatureHelpContext {
  ///| Action that caused signature help to be triggered.
  trigger_kind : SignatureHelpTriggerKind
  ///| Character that caused signature help to be triggered.
  trigger_character : String?
  ///| `true` if signature help was already showing when it was triggered.
  is_retrigger : Bool
  ///| The currently active `SignatureHelp`.
  active_signature_help : SignatureHelp?
}

///|
pub impl @json.ToJson for SignatureHelpContext with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("triggerKind", self.trigger_kind.to_json())
  match self.trigger_character {
    Some(v) => obj.set("triggerCharacter", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("isRetrigger", @json.JsonValue::Bool(self.is_retrigger))
  match self.active_signature_help {
    Some(v) => obj.set("activeSignatureHelp", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SignatureHelpContext with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SignatureHelpContext")
  }
  let trigger_kind = match obj.get("triggerKind") {
    Some(v) => SignatureHelpTriggerKind::from_json(v)
    None => raise @json.JsonError("missing triggerKind")
  }
  let trigger_character : String? = match obj.get("triggerCharacter") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let is_retrigger = match obj.get("isRetrigger") {
    Some(v) => match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") }
    None => raise @json.JsonError("missing isRetrigger")
  }
  let active_signature_help : SignatureHelp? = match obj.get("activeSignatureHelp") {
    Some(v) if not(v.is_null()) => Some(SignatureHelp::from_json(v))
    _ => None
  }
  SignatureHelpContext::{ trigger_kind, trigger_character, is_retrigger, active_signature_help }
}

///| Represents the signature of something callable. A signature
pub struct SignatureInformation {
  ///| The label of this signature. Will be shown in
  label : String
  ///| The human-readable doc-comment of this signature. Will be shown
  documentation : @json.JsonValue?
  ///| The parameters of this signature.
  parameters : Array[ParameterInformation]?
  ///| The index of the active parameter.
  active_parameter : @json.JsonValue?
}

///|
pub impl @json.ToJson for SignatureInformation with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("label", @json.JsonValue::String(self.label))
  match self.documentation {
    Some(v) => obj.set("documentation", v)
    None => ()
  }
  match self.parameters {
    Some(v) => obj.set("parameters", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  match self.active_parameter {
    Some(v) => obj.set("activeParameter", v)
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SignatureInformation with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SignatureInformation")
  }
  let label = match obj.get("label") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing label")
  }
  let documentation : @json.JsonValue? = obj.get("documentation")
  let parameters : Array[ParameterInformation]? = match obj.get("parameters") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { ParameterInformation::from_json(item) }); _ => [] })
    _ => None
  }
  let active_parameter : @json.JsonValue? = obj.get("activeParameter")
  SignatureInformation::{ label, documentation, parameters, active_parameter }
}

///| Server Capabilities for a {@link SignatureHelpRequest}.
///| Mixins: WorkDoneProgressOptions
pub struct SignatureHelpOptions {
  work_done_progress : Bool?
  ///| List of characters that trigger signature help automatically.
  trigger_characters : Array[String]?
  ///| List of characters that re-trigger signature help.
  retrigger_characters : Array[String]?
}

///|
pub impl @json.ToJson for SignatureHelpOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.trigger_characters {
    Some(v) => obj.set("triggerCharacters", @json.JsonValue::Array(v.map(fn(item) { @json.JsonValue::String(item) })))
    None => ()
  }
  match self.retrigger_characters {
    Some(v) => obj.set("retriggerCharacters", @json.JsonValue::Array(v.map(fn(item) { @json.JsonValue::String(item) })))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SignatureHelpOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SignatureHelpOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let trigger_characters : Array[String]? = match obj.get("triggerCharacters") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] })
    _ => None
  }
  let retrigger_characters : Array[String]? = match obj.get("retriggerCharacters") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] })
    _ => None
  }
  SignatureHelpOptions::{ work_done_progress, trigger_characters, retrigger_characters }
}

///| Server Capabilities for a {@link DefinitionRequest}.
///| Mixins: WorkDoneProgressOptions
pub struct DefinitionOptions {
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for DefinitionOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DefinitionOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DefinitionOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DefinitionOptions::{ work_done_progress }
}

///| Value-object that contains additional information when
pub struct ReferenceContext {
  ///| Include the declaration of the current symbol.
  include_declaration : Bool
}

///|
pub impl @json.ToJson for ReferenceContext with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("includeDeclaration", @json.JsonValue::Bool(self.include_declaration))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ReferenceContext with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ReferenceContext")
  }
  let include_declaration = match obj.get("includeDeclaration") {
    Some(v) => match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") }
    None => raise @json.JsonError("missing includeDeclaration")
  }
  ReferenceContext::{ include_declaration }
}

///| Reference options.
///| Mixins: WorkDoneProgressOptions
pub struct ReferenceOptions {
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for ReferenceOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ReferenceOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ReferenceOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  ReferenceOptions::{ work_done_progress }
}

///| Provider options for a {@link DocumentHighlightRequest}.
///| Mixins: WorkDoneProgressOptions
pub struct DocumentHighlightOptions {
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for DocumentHighlightOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentHighlightOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentHighlightOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DocumentHighlightOptions::{ work_done_progress }
}

///| A base for all symbol information.
pub struct BaseSymbolInformation {
  ///| The name of this symbol.
  name : String
  ///| The kind of this symbol.
  kind : SymbolKind
  ///| Tags for this symbol.
  tags : Array[SymbolTag]?
  ///| The name of the symbol containing this symbol. This information is for
  container_name : String?
}

///|
pub impl @json.ToJson for BaseSymbolInformation with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("name", @json.JsonValue::String(self.name))
  obj.set("kind", self.kind.to_json())
  match self.tags {
    Some(v) => obj.set("tags", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  match self.container_name {
    Some(v) => obj.set("containerName", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for BaseSymbolInformation with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for BaseSymbolInformation")
  }
  let name = match obj.get("name") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing name")
  }
  let kind = match obj.get("kind") {
    Some(v) => SymbolKind::from_json(v)
    None => raise @json.JsonError("missing kind")
  }
  let tags : Array[SymbolTag]? = match obj.get("tags") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { SymbolTag::from_json(item) }); _ => [] })
    _ => None
  }
  let container_name : String? = match obj.get("containerName") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  BaseSymbolInformation::{ name, kind, tags, container_name }
}

///| Provider options for a {@link DocumentSymbolRequest}.
///| Mixins: WorkDoneProgressOptions
pub struct DocumentSymbolOptions {
  work_done_progress : Bool?
  ///| A human-readable string that is shown when multiple outlines trees
  label : String?
}

///|
pub impl @json.ToJson for DocumentSymbolOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.label {
    Some(v) => obj.set("label", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentSymbolOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentSymbolOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let label : String? = match obj.get("label") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  DocumentSymbolOptions::{ work_done_progress, label }
}

///| Contains additional diagnostic information about the context in which
pub struct CodeActionContext {
  ///| An array of diagnostics known on the client side overlapping the range provided to the
  diagnostics : Array[Diagnostic]
  ///| Requested kind of actions to return.
  only : Array[CodeActionKind]?
  ///| The reason why code actions were requested.
  trigger_kind : CodeActionTriggerKind?
}

///|
pub impl @json.ToJson for CodeActionContext with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("diagnostics", @json.JsonValue::Array(self.diagnostics.map(fn(item) { item.to_json() })))
  match self.only {
    Some(v) => obj.set("only", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  match self.trigger_kind {
    Some(v) => obj.set("triggerKind", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CodeActionContext with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CodeActionContext")
  }
  let diagnostics = match obj.get("diagnostics") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { Diagnostic::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing diagnostics")
  }
  let only : Array[CodeActionKind]? = match obj.get("only") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { CodeActionKind::from_json(item) }); _ => [] })
    _ => None
  }
  let trigger_kind : CodeActionTriggerKind? = match obj.get("triggerKind") {
    Some(v) if not(v.is_null()) => Some(CodeActionTriggerKind::from_json(v))
    _ => None
  }
  CodeActionContext::{ diagnostics, only, trigger_kind }
}

///| Captures why the code action is currently disabled.
pub struct CodeActionDisabled {
  ///| Human readable description of why the code action is currently disabled.
  reason : String
}

///|
pub impl @json.ToJson for CodeActionDisabled with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("reason", @json.JsonValue::String(self.reason))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CodeActionDisabled with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CodeActionDisabled")
  }
  let reason = match obj.get("reason") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing reason")
  }
  CodeActionDisabled::{ reason }
}

///| Provider options for a {@link CodeActionRequest}.
///| Mixins: WorkDoneProgressOptions
pub struct CodeActionOptions {
  work_done_progress : Bool?
  ///| CodeActionKinds that this server may return.
  code_action_kinds : Array[CodeActionKind]?
  ///| Static documentation for a class of code actions.
  documentation : Array[CodeActionKindDocumentation]?
  ///| The server provides support to resolve additional
  resolve_provider : Bool?
}

///|
pub impl @json.ToJson for CodeActionOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.code_action_kinds {
    Some(v) => obj.set("codeActionKinds", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  match self.documentation {
    Some(v) => obj.set("documentation", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  match self.resolve_provider {
    Some(v) => obj.set("resolveProvider", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CodeActionOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CodeActionOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let code_action_kinds : Array[CodeActionKind]? = match obj.get("codeActionKinds") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { CodeActionKind::from_json(item) }); _ => [] })
    _ => None
  }
  let documentation : Array[CodeActionKindDocumentation]? = match obj.get("documentation") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { CodeActionKindDocumentation::from_json(item) }); _ => [] })
    _ => None
  }
  let resolve_provider : Bool? = match obj.get("resolveProvider") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  CodeActionOptions::{ work_done_progress, code_action_kinds, documentation, resolve_provider }
}

///| Location with only uri and does not include range.
pub struct LocationUriOnly {
  uri : String
}

///|
pub impl @json.ToJson for LocationUriOnly with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("uri", @json.JsonValue::String(self.uri))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for LocationUriOnly with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for LocationUriOnly")
  }
  let uri = match obj.get("uri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing uri")
  }
  LocationUriOnly::{ uri }
}

///| Server capabilities for a {@link WorkspaceSymbolRequest}.
///| Mixins: WorkDoneProgressOptions
pub struct WorkspaceSymbolOptions {
  work_done_progress : Bool?
  ///| The server provides support to resolve additional
  resolve_provider : Bool?
}

///|
pub impl @json.ToJson for WorkspaceSymbolOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.resolve_provider {
    Some(v) => obj.set("resolveProvider", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkspaceSymbolOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkspaceSymbolOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let resolve_provider : Bool? = match obj.get("resolveProvider") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  WorkspaceSymbolOptions::{ work_done_progress, resolve_provider }
}

///| Code Lens provider options of a {@link CodeLensRequest}.
///| Mixins: WorkDoneProgressOptions
pub struct CodeLensOptions {
  work_done_progress : Bool?
  ///| Code lens has a resolve provider as well.
  resolve_provider : Bool?
}

///|
pub impl @json.ToJson for CodeLensOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.resolve_provider {
    Some(v) => obj.set("resolveProvider", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CodeLensOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CodeLensOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let resolve_provider : Bool? = match obj.get("resolveProvider") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  CodeLensOptions::{ work_done_progress, resolve_provider }
}

///| Provider options for a {@link DocumentLinkRequest}.
///| Mixins: WorkDoneProgressOptions
pub struct DocumentLinkOptions {
  work_done_progress : Bool?
  ///| Document links have a resolve provider as well.
  resolve_provider : Bool?
}

///|
pub impl @json.ToJson for DocumentLinkOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.resolve_provider {
    Some(v) => obj.set("resolveProvider", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentLinkOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentLinkOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let resolve_provider : Bool? = match obj.get("resolveProvider") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DocumentLinkOptions::{ work_done_progress, resolve_provider }
}

///| Value-object describing what options formatting should use.
pub struct FormattingOptions {
  ///| Size of a tab in spaces.
  tab_size : Int
  ///| Prefer spaces over tabs.
  insert_spaces : Bool
  ///| Trim trailing whitespace on a line.
  trim_trailing_whitespace : Bool?
  ///| Insert a newline character at the end of the file if one does not exist.
  insert_final_newline : Bool?
  ///| Trim all newlines after the final newline at the end of the file.
  trim_final_newlines : Bool?
}

///|
pub impl @json.ToJson for FormattingOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("tabSize", @json.JsonValue::Number(self.tab_size.to_double()))
  obj.set("insertSpaces", @json.JsonValue::Bool(self.insert_spaces))
  match self.trim_trailing_whitespace {
    Some(v) => obj.set("trimTrailingWhitespace", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.insert_final_newline {
    Some(v) => obj.set("insertFinalNewline", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.trim_final_newlines {
    Some(v) => obj.set("trimFinalNewlines", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for FormattingOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for FormattingOptions")
  }
  let tab_size = match obj.get("tabSize") {
    Some(v) => match v { @json.JsonValue::Number(n) => n.to_int(); _ => raise @json.JsonError("expected number") }
    None => raise @json.JsonError("missing tabSize")
  }
  let insert_spaces = match obj.get("insertSpaces") {
    Some(v) => match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") }
    None => raise @json.JsonError("missing insertSpaces")
  }
  let trim_trailing_whitespace : Bool? = match obj.get("trimTrailingWhitespace") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let insert_final_newline : Bool? = match obj.get("insertFinalNewline") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let trim_final_newlines : Bool? = match obj.get("trimFinalNewlines") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  FormattingOptions::{ tab_size, insert_spaces, trim_trailing_whitespace, insert_final_newline, trim_final_newlines }
}

///| Provider options for a {@link DocumentFormattingRequest}.
///| Mixins: WorkDoneProgressOptions
pub struct DocumentFormattingOptions {
  work_done_progress : Bool?
}

///|
pub impl @json.ToJson for DocumentFormattingOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentFormattingOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentFormattingOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DocumentFormattingOptions::{ work_done_progress }
}

///| Provider options for a {@link DocumentRangeFormattingRequest}.
///| Mixins: WorkDoneProgressOptions
pub struct DocumentRangeFormattingOptions {
  work_done_progress : Bool?
  ///| Whether the server supports formatting multiple ranges at once.
  ranges_support : Bool?
}

///|
pub impl @json.ToJson for DocumentRangeFormattingOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.ranges_support {
    Some(v) => obj.set("rangesSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentRangeFormattingOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentRangeFormattingOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let ranges_support : Bool? = match obj.get("rangesSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DocumentRangeFormattingOptions::{ work_done_progress, ranges_support }
}

///| Provider options for a {@link DocumentOnTypeFormattingRequest}.
pub struct DocumentOnTypeFormattingOptions {
  ///| A character on which formatting should be triggered, like `{`.
  first_trigger_character : String
  ///| More trigger characters.
  more_trigger_character : Array[String]?
}

///|
pub impl @json.ToJson for DocumentOnTypeFormattingOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("firstTriggerCharacter", @json.JsonValue::String(self.first_trigger_character))
  match self.more_trigger_character {
    Some(v) => obj.set("moreTriggerCharacter", @json.JsonValue::Array(v.map(fn(item) { @json.JsonValue::String(item) })))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentOnTypeFormattingOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentOnTypeFormattingOptions")
  }
  let first_trigger_character = match obj.get("firstTriggerCharacter") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing firstTriggerCharacter")
  }
  let more_trigger_character : Array[String]? = match obj.get("moreTriggerCharacter") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] })
    _ => None
  }
  DocumentOnTypeFormattingOptions::{ first_trigger_character, more_trigger_character }
}

///| Provider options for a {@link RenameRequest}.
///| Mixins: WorkDoneProgressOptions
pub struct RenameOptions {
  work_done_progress : Bool?
  ///| Renames should be checked and tested before being executed.
  prepare_provider : Bool?
}

///|
pub impl @json.ToJson for RenameOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.prepare_provider {
    Some(v) => obj.set("prepareProvider", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for RenameOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for RenameOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let prepare_provider : Bool? = match obj.get("prepareProvider") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  RenameOptions::{ work_done_progress, prepare_provider }
}

///| @since 3.18.0
pub struct PrepareRenamePlaceholder {
  range : Range
  placeholder : String
}

///|
pub impl @json.ToJson for PrepareRenamePlaceholder with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("range", self.range.to_json())
  obj.set("placeholder", @json.JsonValue::String(self.placeholder))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for PrepareRenamePlaceholder with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for PrepareRenamePlaceholder")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  let placeholder = match obj.get("placeholder") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing placeholder")
  }
  PrepareRenamePlaceholder::{ range, placeholder }
}

///| @since 3.18.0
pub struct PrepareRenameDefaultBehavior {
  default_behavior : Bool
}

///|
pub impl @json.ToJson for PrepareRenameDefaultBehavior with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("defaultBehavior", @json.JsonValue::Bool(self.default_behavior))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for PrepareRenameDefaultBehavior with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for PrepareRenameDefaultBehavior")
  }
  let default_behavior = match obj.get("defaultBehavior") {
    Some(v) => match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") }
    None => raise @json.JsonError("missing defaultBehavior")
  }
  PrepareRenameDefaultBehavior::{ default_behavior }
}

///| The server capabilities of a {@link ExecuteCommandRequest}.
///| Mixins: WorkDoneProgressOptions
pub struct ExecuteCommandOptions {
  work_done_progress : Bool?
  ///| The commands to be executed on the server
  commands : Array[String]
}

///|
pub impl @json.ToJson for ExecuteCommandOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  obj.set("commands", @json.JsonValue::Array(self.commands.map(fn(item) { @json.JsonValue::String(item) })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ExecuteCommandOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ExecuteCommandOptions")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let commands = match obj.get("commands") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] }
    None => raise @json.JsonError("missing commands")
  }
  ExecuteCommandOptions::{ work_done_progress, commands }
}

///| Additional data about a workspace edit.
pub struct WorkspaceEditMetadata {
  ///| Signal to the editor that this edit is a refactoring.
  is_refactoring : Bool?
}

///|
pub impl @json.ToJson for WorkspaceEditMetadata with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.is_refactoring {
    Some(v) => obj.set("isRefactoring", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkspaceEditMetadata with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkspaceEditMetadata")
  }
  let is_refactoring : Bool? = match obj.get("isRefactoring") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  WorkspaceEditMetadata::{ is_refactoring }
}

///| @since 3.16.0
pub struct SemanticTokensLegend {
  ///| The token types a server uses.
  token_types : Array[String]
  ///| The token modifiers a server uses.
  token_modifiers : Array[String]
}

///|
pub impl @json.ToJson for SemanticTokensLegend with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("tokenTypes", @json.JsonValue::Array(self.token_types.map(fn(item) { @json.JsonValue::String(item) })))
  obj.set("tokenModifiers", @json.JsonValue::Array(self.token_modifiers.map(fn(item) { @json.JsonValue::String(item) })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SemanticTokensLegend with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SemanticTokensLegend")
  }
  let token_types = match obj.get("tokenTypes") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] }
    None => raise @json.JsonError("missing tokenTypes")
  }
  let token_modifiers = match obj.get("tokenModifiers") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] }
    None => raise @json.JsonError("missing tokenModifiers")
  }
  SemanticTokensLegend::{ token_types, token_modifiers }
}

///| Semantic tokens options to support deltas for full documents
pub struct SemanticTokensFullDelta {
  ///| The server supports deltas for full documents.
  delta : Bool?
}

///|
pub impl @json.ToJson for SemanticTokensFullDelta with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.delta {
    Some(v) => obj.set("delta", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SemanticTokensFullDelta with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SemanticTokensFullDelta")
  }
  let delta : Bool? = match obj.get("delta") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  SemanticTokensFullDelta::{ delta }
}

///| A text document identifier to optionally denote a specific version of a text document.
///| Extends: TextDocumentIdentifier
pub struct OptionalVersionedTextDocumentIdentifier {
  ///| The text document's uri.
  uri : String
  ///| The version number of this document. If a versioned text document identifier
  version : @json.JsonValue
}

///|
pub impl @json.ToJson for OptionalVersionedTextDocumentIdentifier with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("uri", @json.JsonValue::String(self.uri))
  obj.set("version", self.version)
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for OptionalVersionedTextDocumentIdentifier with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for OptionalVersionedTextDocumentIdentifier")
  }
  let uri = match obj.get("uri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing uri")
  }
  let version = match obj.get("version") {
    Some(v) => v
    None => raise @json.JsonError("missing version")
  }
  OptionalVersionedTextDocumentIdentifier::{ uri, version }
}

///| A special text edit with an additional change annotation.
///| Extends: TextEdit
pub struct AnnotatedTextEdit {
  ///| The range of the text document to be manipulated. To insert
  range : Range
  ///| The string to be inserted. For delete operations use an
  new_text : String
  ///| The actual identifier of the change annotation
  annotation_id : ChangeAnnotationIdentifier
}

///|
pub impl @json.ToJson for AnnotatedTextEdit with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("range", self.range.to_json())
  obj.set("newText", @json.JsonValue::String(self.new_text))
  obj.set("annotationId", @json.JsonValue::String(self.annotation_id))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for AnnotatedTextEdit with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for AnnotatedTextEdit")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  let new_text = match obj.get("newText") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing newText")
  }
  let annotation_id = match obj.get("annotationId") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing annotationId")
  }
  AnnotatedTextEdit::{ range, new_text, annotation_id }
}

///| An interactive text edit.
pub struct SnippetTextEdit {
  ///| The range of the text document to be manipulated.
  range : Range
  ///| The snippet to be inserted.
  snippet : StringValue
  ///| The actual identifier of the snippet edit.
  annotation_id : ChangeAnnotationIdentifier?
}

///|
pub impl @json.ToJson for SnippetTextEdit with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("range", self.range.to_json())
  obj.set("snippet", self.snippet.to_json())
  match self.annotation_id {
    Some(v) => obj.set("annotationId", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SnippetTextEdit with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SnippetTextEdit")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  let snippet = match obj.get("snippet") {
    Some(v) => StringValue::from_json(v)
    None => raise @json.JsonError("missing snippet")
  }
  let annotation_id : ChangeAnnotationIdentifier? = match obj.get("annotationId") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  SnippetTextEdit::{ range, snippet, annotation_id }
}

///| A generic resource operation.
pub struct ResourceOperation {
  ///| The resource operation kind.
  kind : String
  ///| An optional annotation identifier describing the operation.
  annotation_id : ChangeAnnotationIdentifier?
}

///|
pub impl @json.ToJson for ResourceOperation with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("kind", @json.JsonValue::String(self.kind))
  match self.annotation_id {
    Some(v) => obj.set("annotationId", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ResourceOperation with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ResourceOperation")
  }
  let kind = match obj.get("kind") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing kind")
  }
  let annotation_id : ChangeAnnotationIdentifier? = match obj.get("annotationId") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  ResourceOperation::{ kind, annotation_id }
}

///| Options to create a file.
pub struct CreateFileOptions {
  ///| Overwrite existing file. Overwrite wins over `ignoreIfExists`
  overwrite : Bool?
  ///| Ignore if exists.
  ignore_if_exists : Bool?
}

///|
pub impl @json.ToJson for CreateFileOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.overwrite {
    Some(v) => obj.set("overwrite", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.ignore_if_exists {
    Some(v) => obj.set("ignoreIfExists", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CreateFileOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CreateFileOptions")
  }
  let overwrite : Bool? = match obj.get("overwrite") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let ignore_if_exists : Bool? = match obj.get("ignoreIfExists") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  CreateFileOptions::{ overwrite, ignore_if_exists }
}

///| Rename file options
pub struct RenameFileOptions {
  ///| Overwrite target if existing. Overwrite wins over `ignoreIfExists`
  overwrite : Bool?
  ///| Ignores if target exists.
  ignore_if_exists : Bool?
}

///|
pub impl @json.ToJson for RenameFileOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.overwrite {
    Some(v) => obj.set("overwrite", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.ignore_if_exists {
    Some(v) => obj.set("ignoreIfExists", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for RenameFileOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for RenameFileOptions")
  }
  let overwrite : Bool? = match obj.get("overwrite") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let ignore_if_exists : Bool? = match obj.get("ignoreIfExists") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  RenameFileOptions::{ overwrite, ignore_if_exists }
}

///| Delete file options
pub struct DeleteFileOptions {
  ///| Delete the content recursively if a folder is denoted.
  recursive : Bool?
  ///| Ignore the operation if the file doesn't exist.
  ignore_if_not_exists : Bool?
}

///|
pub impl @json.ToJson for DeleteFileOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.recursive {
    Some(v) => obj.set("recursive", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.ignore_if_not_exists {
    Some(v) => obj.set("ignoreIfNotExists", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DeleteFileOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DeleteFileOptions")
  }
  let recursive : Bool? = match obj.get("recursive") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let ignore_if_not_exists : Bool? = match obj.get("ignoreIfNotExists") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DeleteFileOptions::{ recursive, ignore_if_not_exists }
}

///| A pattern to describe in which file operation requests or notifications
pub struct FileOperationPattern {
  ///| The glob pattern to match. Glob patterns can have the following syntax:
  glob : String
  ///| Whether to match files or folders with this pattern.
  matches : FileOperationPatternKind?
  ///| Additional options used during matching.
  options : FileOperationPatternOptions?
}

///|
pub impl @json.ToJson for FileOperationPattern with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("glob", @json.JsonValue::String(self.glob))
  match self.matches {
    Some(v) => obj.set("matches", v.to_json())
    None => ()
  }
  match self.options {
    Some(v) => obj.set("options", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for FileOperationPattern with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for FileOperationPattern")
  }
  let glob = match obj.get("glob") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing glob")
  }
  let matches : FileOperationPatternKind? = match obj.get("matches") {
    Some(v) if not(v.is_null()) => Some(FileOperationPatternKind::from_json(v))
    _ => None
  }
  let options : FileOperationPatternOptions? = match obj.get("options") {
    Some(v) if not(v.is_null()) => Some(FileOperationPatternOptions::from_json(v))
    _ => None
  }
  FileOperationPattern::{ glob, matches, options }
}

///| A full document diagnostic report for a workspace diagnostic result.
///| Extends: FullDocumentDiagnosticReport
pub struct WorkspaceFullDocumentDiagnosticReport {
  ///| A full document diagnostic report.
  kind : String
  ///| An optional result id. If provided it will
  result_id : String?
  ///| The actual items.
  items : Array[Diagnostic]
  ///| The URI for which diagnostic information is reported.
  uri : String
  ///| The version number for which the diagnostics are reported.
  version : @json.JsonValue
}

///|
pub impl @json.ToJson for WorkspaceFullDocumentDiagnosticReport with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("kind", @json.JsonValue::String(self.kind))
  match self.result_id {
    Some(v) => obj.set("resultId", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("items", @json.JsonValue::Array(self.items.map(fn(item) { item.to_json() })))
  obj.set("uri", @json.JsonValue::String(self.uri))
  obj.set("version", self.version)
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkspaceFullDocumentDiagnosticReport with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkspaceFullDocumentDiagnosticReport")
  }
  let kind = match obj.get("kind") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing kind")
  }
  let result_id : String? = match obj.get("resultId") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let items = match obj.get("items") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { Diagnostic::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing items")
  }
  let uri = match obj.get("uri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing uri")
  }
  let version = match obj.get("version") {
    Some(v) => v
    None => raise @json.JsonError("missing version")
  }
  WorkspaceFullDocumentDiagnosticReport::{ kind, result_id, items, uri, version }
}

///| An unchanged document diagnostic report for a workspace diagnostic result.
///| Extends: UnchangedDocumentDiagnosticReport
pub struct WorkspaceUnchangedDocumentDiagnosticReport {
  ///| A document diagnostic report indicating
  kind : String
  ///| A result id which will be sent on the next
  result_id : String
  ///| The URI for which diagnostic information is reported.
  uri : String
  ///| The version number for which the diagnostics are reported.
  version : @json.JsonValue
}

///|
pub impl @json.ToJson for WorkspaceUnchangedDocumentDiagnosticReport with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("kind", @json.JsonValue::String(self.kind))
  obj.set("resultId", @json.JsonValue::String(self.result_id))
  obj.set("uri", @json.JsonValue::String(self.uri))
  obj.set("version", self.version)
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkspaceUnchangedDocumentDiagnosticReport with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkspaceUnchangedDocumentDiagnosticReport")
  }
  let kind = match obj.get("kind") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing kind")
  }
  let result_id = match obj.get("resultId") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing resultId")
  }
  let uri = match obj.get("uri") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing uri")
  }
  let version = match obj.get("version") {
    Some(v) => v
    None => raise @json.JsonError("missing version")
  }
  WorkspaceUnchangedDocumentDiagnosticReport::{ kind, result_id, uri, version }
}

///| A notebook cell.
pub struct NotebookCell {
  ///| The cell's kind
  kind : NotebookCellKind
  ///| The URI of the cell's text document
  document : String
  ///| Additional metadata stored with the cell.
  metadata : LSPObject?
  ///| Additional execution summary information
  execution_summary : ExecutionSummary?
}

///|
pub impl @json.ToJson for NotebookCell with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("kind", self.kind.to_json())
  obj.set("document", @json.JsonValue::String(self.document))
  match self.metadata {
    Some(v) => obj.set("metadata", v.to_json())
    None => ()
  }
  match self.execution_summary {
    Some(v) => obj.set("executionSummary", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for NotebookCell with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for NotebookCell")
  }
  let kind = match obj.get("kind") {
    Some(v) => NotebookCellKind::from_json(v)
    None => raise @json.JsonError("missing kind")
  }
  let document = match obj.get("document") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing document")
  }
  let metadata : LSPObject? = match obj.get("metadata") {
    Some(v) if not(v.is_null()) => Some(LSPObject::from_json(v))
    _ => None
  }
  let execution_summary : ExecutionSummary? = match obj.get("executionSummary") {
    Some(v) if not(v.is_null()) => Some(ExecutionSummary::from_json(v))
    _ => None
  }
  NotebookCell::{ kind, document, metadata, execution_summary }
}

///| @since 3.18.0
pub struct NotebookDocumentFilterWithNotebook {
  ///| The notebook to be synced If a string
  notebook : @json.JsonValue
  ///| The cells of the matching notebook to be synced.
  cells : Array[NotebookCellLanguage]?
}

///|
pub impl @json.ToJson for NotebookDocumentFilterWithNotebook with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("notebook", self.notebook)
  match self.cells {
    Some(v) => obj.set("cells", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for NotebookDocumentFilterWithNotebook with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for NotebookDocumentFilterWithNotebook")
  }
  let notebook = match obj.get("notebook") {
    Some(v) => v
    None => raise @json.JsonError("missing notebook")
  }
  let cells : Array[NotebookCellLanguage]? = match obj.get("cells") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { NotebookCellLanguage::from_json(item) }); _ => [] })
    _ => None
  }
  NotebookDocumentFilterWithNotebook::{ notebook, cells }
}

///| @since 3.18.0
pub struct NotebookDocumentFilterWithCells {
  ///| The notebook to be synced If a string
  notebook : @json.JsonValue?
  ///| The cells of the matching notebook to be synced.
  cells : Array[NotebookCellLanguage]
}

///|
pub impl @json.ToJson for NotebookDocumentFilterWithCells with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.notebook {
    Some(v) => obj.set("notebook", v)
    None => ()
  }
  obj.set("cells", @json.JsonValue::Array(self.cells.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for NotebookDocumentFilterWithCells with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for NotebookDocumentFilterWithCells")
  }
  let notebook : @json.JsonValue? = obj.get("notebook")
  let cells = match obj.get("cells") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { NotebookCellLanguage::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing cells")
  }
  NotebookDocumentFilterWithCells::{ notebook, cells }
}

///| Cell changes to a notebook document.
pub struct NotebookDocumentCellChanges {
  ///| Changes to the cell structure to add or
  structure : NotebookDocumentCellChangeStructure?
  ///| Changes to notebook cells properties like its
  data : Array[NotebookCell]?
  ///| Changes to the text content of notebook cells.
  text_content : Array[NotebookDocumentCellContentChanges]?
}

///|
pub impl @json.ToJson for NotebookDocumentCellChanges with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.structure {
    Some(v) => obj.set("structure", v.to_json())
    None => ()
  }
  match self.data {
    Some(v) => obj.set("data", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  match self.text_content {
    Some(v) => obj.set("textContent", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for NotebookDocumentCellChanges with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for NotebookDocumentCellChanges")
  }
  let structure : NotebookDocumentCellChangeStructure? = match obj.get("structure") {
    Some(v) if not(v.is_null()) => Some(NotebookDocumentCellChangeStructure::from_json(v))
    _ => None
  }
  let data : Array[NotebookCell]? = match obj.get("data") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { NotebookCell::from_json(item) }); _ => [] })
    _ => None
  }
  let text_content : Array[NotebookDocumentCellContentChanges]? = match obj.get("textContent") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { NotebookDocumentCellContentChanges::from_json(item) }); _ => [] })
    _ => None
  }
  NotebookDocumentCellChanges::{ structure, data, text_content }
}

///| Describes the currently selected completion item.
pub struct SelectedCompletionInfo {
  ///| The range that will be replaced if this completion item is accepted.
  range : Range
  ///| The text the range will be replaced with if this completion is accepted.
  text : String
}

///|
pub impl @json.ToJson for SelectedCompletionInfo with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("range", self.range.to_json())
  obj.set("text", @json.JsonValue::String(self.text))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SelectedCompletionInfo with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SelectedCompletionInfo")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  let text = match obj.get("text") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing text")
  }
  SelectedCompletionInfo::{ range, text }
}

///| Information about the client
pub struct ClientInfo {
  ///| The name of the client as defined by the client.
  name : String
  ///| The client's version as defined by the client.
  version : String?
}

///|
pub impl @json.ToJson for ClientInfo with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("name", @json.JsonValue::String(self.name))
  match self.version {
    Some(v) => obj.set("version", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ClientInfo with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ClientInfo")
  }
  let name = match obj.get("name") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing name")
  }
  let version : String? = match obj.get("version") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  ClientInfo::{ name, version }
}

///| Defines the capabilities provided by the client.
pub struct ClientCapabilities {
  ///| Workspace specific client capabilities.
  workspace : WorkspaceClientCapabilities?
  ///| Text document specific client capabilities.
  text_document : TextDocumentClientCapabilities?
  ///| Capabilities specific to the notebook document support.
  notebook_document : NotebookDocumentClientCapabilities?
  ///| Window specific client capabilities.
  window : WindowClientCapabilities?
  ///| General client capabilities.
  general : GeneralClientCapabilities?
  ///| Experimental client capabilities.
  experimental : LSPAny?
}

///|
pub impl @json.ToJson for ClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.workspace {
    Some(v) => obj.set("workspace", v.to_json())
    None => ()
  }
  match self.text_document {
    Some(v) => obj.set("textDocument", v.to_json())
    None => ()
  }
  match self.notebook_document {
    Some(v) => obj.set("notebookDocument", v.to_json())
    None => ()
  }
  match self.window {
    Some(v) => obj.set("window", v.to_json())
    None => ()
  }
  match self.general {
    Some(v) => obj.set("general", v.to_json())
    None => ()
  }
  match self.experimental {
    Some(v) => obj.set("experimental", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ClientCapabilities")
  }
  let workspace : WorkspaceClientCapabilities? = match obj.get("workspace") {
    Some(v) if not(v.is_null()) => Some(WorkspaceClientCapabilities::from_json(v))
    _ => None
  }
  let text_document : TextDocumentClientCapabilities? = match obj.get("textDocument") {
    Some(v) if not(v.is_null()) => Some(TextDocumentClientCapabilities::from_json(v))
    _ => None
  }
  let notebook_document : NotebookDocumentClientCapabilities? = match obj.get("notebookDocument") {
    Some(v) if not(v.is_null()) => Some(NotebookDocumentClientCapabilities::from_json(v))
    _ => None
  }
  let window : WindowClientCapabilities? = match obj.get("window") {
    Some(v) if not(v.is_null()) => Some(WindowClientCapabilities::from_json(v))
    _ => None
  }
  let general : GeneralClientCapabilities? = match obj.get("general") {
    Some(v) if not(v.is_null()) => Some(GeneralClientCapabilities::from_json(v))
    _ => None
  }
  let experimental : LSPAny? = match obj.get("experimental") {
    Some(v) if not(v.is_null()) => Some(LSPAny::from_json(v))
    _ => None
  }
  ClientCapabilities::{ workspace, text_document, notebook_document, window, general, experimental }
}

pub struct TextDocumentSyncOptions {
  ///| Open and close notifications are sent to the server. If omitted open close notification should not
  open_close : Bool?
  ///| Change notifications are sent to the server. See TextDocumentSyncKind.None, TextDocumentSyncKind.Ful
  change : TextDocumentSyncKind?
  ///| If present will save notifications are sent to the server. If omitted the notification should not be
  will_save : Bool?
  ///| If present will save wait until requests are sent to the server. If omitted the request should not b
  will_save_wait_until : Bool?
  ///| If present save notifications are sent to the server. If omitted the notification should not be
  save : @json.JsonValue?
}

///|
pub impl @json.ToJson for TextDocumentSyncOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.open_close {
    Some(v) => obj.set("openClose", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.change {
    Some(v) => obj.set("change", v.to_json())
    None => ()
  }
  match self.will_save {
    Some(v) => obj.set("willSave", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.will_save_wait_until {
    Some(v) => obj.set("willSaveWaitUntil", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.save {
    Some(v) => obj.set("save", v)
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextDocumentSyncOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextDocumentSyncOptions")
  }
  let open_close : Bool? = match obj.get("openClose") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let change : TextDocumentSyncKind? = match obj.get("change") {
    Some(v) if not(v.is_null()) => Some(TextDocumentSyncKind::from_json(v))
    _ => None
  }
  let will_save : Bool? = match obj.get("willSave") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let will_save_wait_until : Bool? = match obj.get("willSaveWaitUntil") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let save : @json.JsonValue? = obj.get("save")
  TextDocumentSyncOptions::{ open_close, change, will_save, will_save_wait_until, save }
}

///| Defines workspace specific capabilities of the server.
pub struct WorkspaceOptions {
  ///| The server supports workspace folder.
  workspace_folders : WorkspaceFoldersServerCapabilities?
  ///| The server is interested in notifications/requests for operations on files.
  file_operations : FileOperationOptions?
  ///| The server supports the `workspace/textDocumentContent` request.
  text_document_content : @json.JsonValue?
}

///|
pub impl @json.ToJson for WorkspaceOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.workspace_folders {
    Some(v) => obj.set("workspaceFolders", v.to_json())
    None => ()
  }
  match self.file_operations {
    Some(v) => obj.set("fileOperations", v.to_json())
    None => ()
  }
  match self.text_document_content {
    Some(v) => obj.set("textDocumentContent", v)
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkspaceOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkspaceOptions")
  }
  let workspace_folders : WorkspaceFoldersServerCapabilities? = match obj.get("workspaceFolders") {
    Some(v) if not(v.is_null()) => Some(WorkspaceFoldersServerCapabilities::from_json(v))
    _ => None
  }
  let file_operations : FileOperationOptions? = match obj.get("fileOperations") {
    Some(v) if not(v.is_null()) => Some(FileOperationOptions::from_json(v))
    _ => None
  }
  let text_document_content : @json.JsonValue? = obj.get("textDocumentContent")
  WorkspaceOptions::{ workspace_folders, file_operations, text_document_content }
}

///| @since 3.18.0
pub struct TextDocumentContentChangePartial {
  ///| The range of the document that changed.
  range : Range
  ///| The optional length of the range that got replaced.
  range_length : Int?
  ///| The new text for the provided range.
  text : String
}

///|
pub impl @json.ToJson for TextDocumentContentChangePartial with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("range", self.range.to_json())
  match self.range_length {
    Some(v) => obj.set("rangeLength", @json.JsonValue::Number(v.to_double()))
    None => ()
  }
  obj.set("text", @json.JsonValue::String(self.text))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextDocumentContentChangePartial with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextDocumentContentChangePartial")
  }
  let range = match obj.get("range") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing range")
  }
  let range_length : Int? = match obj.get("rangeLength") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Number(n) => n.to_int(); _ => raise @json.JsonError("expected number") })
    _ => None
  }
  let text = match obj.get("text") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing text")
  }
  TextDocumentContentChangePartial::{ range, range_length, text }
}

///| @since 3.18.0
pub struct TextDocumentContentChangeWholeDocument {
  ///| The new text of the whole document.
  text : String
}

///|
pub impl @json.ToJson for TextDocumentContentChangeWholeDocument with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("text", @json.JsonValue::String(self.text))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextDocumentContentChangeWholeDocument with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextDocumentContentChangeWholeDocument")
  }
  let text = match obj.get("text") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing text")
  }
  TextDocumentContentChangeWholeDocument::{ text }
}

///| Structure to capture a description for an error code.
pub struct CodeDescription {
  ///| An URI to open with more information about the diagnostic error.
  href : String
}

///|
pub impl @json.ToJson for CodeDescription with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("href", @json.JsonValue::String(self.href))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CodeDescription with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CodeDescription")
  }
  let href = match obj.get("href") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing href")
  }
  CodeDescription::{ href }
}

///| Edit range variant that includes ranges for insert and replace operations.
pub struct EditRangeWithInsertReplace {
  insert : Range
  replace : Range
}

///|
pub impl @json.ToJson for EditRangeWithInsertReplace with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("insert", self.insert.to_json())
  obj.set("replace", self.replace.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for EditRangeWithInsertReplace with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for EditRangeWithInsertReplace")
  }
  let insert = match obj.get("insert") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing insert")
  }
  let replace = match obj.get("replace") {
    Some(v) => Range::from_json(v)
    None => raise @json.JsonError("missing replace")
  }
  EditRangeWithInsertReplace::{ insert, replace }
}

///| @since 3.18.0
pub struct ServerCompletionItemOptions {
  ///| The server has support for completion item label
  label_details_support : Bool?
}

///|
pub impl @json.ToJson for ServerCompletionItemOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.label_details_support {
    Some(v) => obj.set("labelDetailsSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ServerCompletionItemOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ServerCompletionItemOptions")
  }
  let label_details_support : Bool? = match obj.get("labelDetailsSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  ServerCompletionItemOptions::{ label_details_support }
}

///| @since 3.18.0
pub struct MarkedStringWithLanguage {
  language : String
  value : String
}

///|
pub impl @json.ToJson for MarkedStringWithLanguage with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("language", @json.JsonValue::String(self.language))
  obj.set("value", @json.JsonValue::String(self.value))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for MarkedStringWithLanguage with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for MarkedStringWithLanguage")
  }
  let language = match obj.get("language") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing language")
  }
  let value = match obj.get("value") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing value")
  }
  MarkedStringWithLanguage::{ language, value }
}

///| Represents a parameter of a callable-signature. A parameter can
pub struct ParameterInformation {
  ///| The label of this parameter information.
  label : @json.JsonValue
  ///| The human-readable doc-comment of this parameter. Will be shown
  documentation : @json.JsonValue?
}

///|
pub impl @json.ToJson for ParameterInformation with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("label", self.label)
  match self.documentation {
    Some(v) => obj.set("documentation", v)
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ParameterInformation with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ParameterInformation")
  }
  let label = match obj.get("label") {
    Some(v) => v
    None => raise @json.JsonError("missing label")
  }
  let documentation : @json.JsonValue? = obj.get("documentation")
  ParameterInformation::{ label, documentation }
}

///| Documentation for a class of code actions.
pub struct CodeActionKindDocumentation {
  ///| The kind of the code action being documented.
  kind : CodeActionKind
  ///| Command that is ued to display the documentation to the user.
  command : Command
}

///|
pub impl @json.ToJson for CodeActionKindDocumentation with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("kind", self.kind.to_json())
  obj.set("command", self.command.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CodeActionKindDocumentation with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CodeActionKindDocumentation")
  }
  let kind = match obj.get("kind") {
    Some(v) => CodeActionKind::from_json(v)
    None => raise @json.JsonError("missing kind")
  }
  let command = match obj.get("command") {
    Some(v) => Command::from_json(v)
    None => raise @json.JsonError("missing command")
  }
  CodeActionKindDocumentation::{ kind, command }
}

///| A notebook cell text document filter denotes a cell text
pub struct NotebookCellTextDocumentFilter {
  ///| A filter that matches against the notebook
  notebook : @json.JsonValue
  ///| A language id like `python`.
  language : String?
}

///|
pub impl @json.ToJson for NotebookCellTextDocumentFilter with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("notebook", self.notebook)
  match self.language {
    Some(v) => obj.set("language", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for NotebookCellTextDocumentFilter with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for NotebookCellTextDocumentFilter")
  }
  let notebook = match obj.get("notebook") {
    Some(v) => v
    None => raise @json.JsonError("missing notebook")
  }
  let language : String? = match obj.get("language") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  NotebookCellTextDocumentFilter::{ notebook, language }
}

///| Matching options for the file operation pattern.
pub struct FileOperationPatternOptions {
  ///| The pattern should be matched ignoring casing.
  ignore_case : Bool?
}

///|
pub impl @json.ToJson for FileOperationPatternOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.ignore_case {
    Some(v) => obj.set("ignoreCase", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for FileOperationPatternOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for FileOperationPatternOptions")
  }
  let ignore_case : Bool? = match obj.get("ignoreCase") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  FileOperationPatternOptions::{ ignore_case }
}

pub struct ExecutionSummary {
  ///| A strict monotonically increasing value
  execution_order : Int
  ///| Whether the execution was successful or
  success : Bool?
}

///|
pub impl @json.ToJson for ExecutionSummary with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("executionOrder", @json.JsonValue::Number(self.execution_order.to_double()))
  match self.success {
    Some(v) => obj.set("success", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ExecutionSummary with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ExecutionSummary")
  }
  let execution_order = match obj.get("executionOrder") {
    Some(v) => match v { @json.JsonValue::Number(n) => n.to_int(); _ => raise @json.JsonError("expected number") }
    None => raise @json.JsonError("missing executionOrder")
  }
  let success : Bool? = match obj.get("success") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  ExecutionSummary::{ execution_order, success }
}

///| @since 3.18.0
pub struct NotebookCellLanguage {
  language : String
}

///|
pub impl @json.ToJson for NotebookCellLanguage with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("language", @json.JsonValue::String(self.language))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for NotebookCellLanguage with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for NotebookCellLanguage")
  }
  let language = match obj.get("language") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing language")
  }
  NotebookCellLanguage::{ language }
}

///| Structural changes to cells in a notebook document.
pub struct NotebookDocumentCellChangeStructure {
  ///| The change to the cell array.
  array : NotebookCellArrayChange
  ///| Additional opened cell text documents.
  did_open : Array[TextDocumentItem]?
  ///| Additional closed cell text documents.
  did_close : Array[TextDocumentIdentifier]?
}

///|
pub impl @json.ToJson for NotebookDocumentCellChangeStructure with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("array", self.array.to_json())
  match self.did_open {
    Some(v) => obj.set("didOpen", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  match self.did_close {
    Some(v) => obj.set("didClose", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for NotebookDocumentCellChangeStructure with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for NotebookDocumentCellChangeStructure")
  }
  let array = match obj.get("array") {
    Some(v) => NotebookCellArrayChange::from_json(v)
    None => raise @json.JsonError("missing array")
  }
  let did_open : Array[TextDocumentItem]? = match obj.get("didOpen") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { TextDocumentItem::from_json(item) }); _ => [] })
    _ => None
  }
  let did_close : Array[TextDocumentIdentifier]? = match obj.get("didClose") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { TextDocumentIdentifier::from_json(item) }); _ => [] })
    _ => None
  }
  NotebookDocumentCellChangeStructure::{ array, did_open, did_close }
}

///| Content changes to a cell in a notebook document.
pub struct NotebookDocumentCellContentChanges {
  document : VersionedTextDocumentIdentifier
  changes : Array[TextDocumentContentChangeEvent]
}

///|
pub impl @json.ToJson for NotebookDocumentCellContentChanges with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("document", self.document.to_json())
  obj.set("changes", @json.JsonValue::Array(self.changes.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for NotebookDocumentCellContentChanges with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for NotebookDocumentCellContentChanges")
  }
  let document = match obj.get("document") {
    Some(v) => VersionedTextDocumentIdentifier::from_json(v)
    None => raise @json.JsonError("missing document")
  }
  let changes = match obj.get("changes") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { TextDocumentContentChangeEvent::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing changes")
  }
  NotebookDocumentCellContentChanges::{ document, changes }
}

///| Workspace specific client capabilities.
pub struct WorkspaceClientCapabilities {
  ///| The client supports applying batch edits
  apply_edit : Bool?
  ///| Capabilities specific to `WorkspaceEdit`s.
  workspace_edit : WorkspaceEditClientCapabilities?
  ///| Capabilities specific to the `workspace/didChangeConfiguration` notification.
  did_change_configuration : DidChangeConfigurationClientCapabilities?
  ///| Capabilities specific to the `workspace/didChangeWatchedFiles` notification.
  did_change_watched_files : DidChangeWatchedFilesClientCapabilities?
  ///| Capabilities specific to the `workspace/symbol` request.
  symbol : WorkspaceSymbolClientCapabilities?
  ///| Capabilities specific to the `workspace/executeCommand` request.
  execute_command : ExecuteCommandClientCapabilities?
  ///| The client has support for workspace folders.
  workspace_folders : Bool?
  ///| The client supports `workspace/configuration` requests.
  configuration : Bool?
  ///| Capabilities specific to the semantic token requests scoped to the
  semantic_tokens : SemanticTokensWorkspaceClientCapabilities?
  ///| Capabilities specific to the code lens requests scoped to the
  code_lens : CodeLensWorkspaceClientCapabilities?
  ///| The client has support for file notifications/requests for user operations on files.
  file_operations : FileOperationClientCapabilities?
  ///| Capabilities specific to the inline values requests scoped to the
  inline_value : InlineValueWorkspaceClientCapabilities?
  ///| Capabilities specific to the inlay hint requests scoped to the
  inlay_hint : InlayHintWorkspaceClientCapabilities?
  ///| Capabilities specific to the diagnostic requests scoped to the
  diagnostics : DiagnosticWorkspaceClientCapabilities?
  ///| Capabilities specific to the folding range requests scoped to the workspace.
  folding_range : FoldingRangeWorkspaceClientCapabilities?
  ///| Capabilities specific to the `workspace/textDocumentContent` request.
  text_document_content : TextDocumentContentClientCapabilities?
}

///|
pub impl @json.ToJson for WorkspaceClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.apply_edit {
    Some(v) => obj.set("applyEdit", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.workspace_edit {
    Some(v) => obj.set("workspaceEdit", v.to_json())
    None => ()
  }
  match self.did_change_configuration {
    Some(v) => obj.set("didChangeConfiguration", v.to_json())
    None => ()
  }
  match self.did_change_watched_files {
    Some(v) => obj.set("didChangeWatchedFiles", v.to_json())
    None => ()
  }
  match self.symbol {
    Some(v) => obj.set("symbol", v.to_json())
    None => ()
  }
  match self.execute_command {
    Some(v) => obj.set("executeCommand", v.to_json())
    None => ()
  }
  match self.workspace_folders {
    Some(v) => obj.set("workspaceFolders", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.configuration {
    Some(v) => obj.set("configuration", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.semantic_tokens {
    Some(v) => obj.set("semanticTokens", v.to_json())
    None => ()
  }
  match self.code_lens {
    Some(v) => obj.set("codeLens", v.to_json())
    None => ()
  }
  match self.file_operations {
    Some(v) => obj.set("fileOperations", v.to_json())
    None => ()
  }
  match self.inline_value {
    Some(v) => obj.set("inlineValue", v.to_json())
    None => ()
  }
  match self.inlay_hint {
    Some(v) => obj.set("inlayHint", v.to_json())
    None => ()
  }
  match self.diagnostics {
    Some(v) => obj.set("diagnostics", v.to_json())
    None => ()
  }
  match self.folding_range {
    Some(v) => obj.set("foldingRange", v.to_json())
    None => ()
  }
  match self.text_document_content {
    Some(v) => obj.set("textDocumentContent", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkspaceClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkspaceClientCapabilities")
  }
  let apply_edit : Bool? = match obj.get("applyEdit") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let workspace_edit : WorkspaceEditClientCapabilities? = match obj.get("workspaceEdit") {
    Some(v) if not(v.is_null()) => Some(WorkspaceEditClientCapabilities::from_json(v))
    _ => None
  }
  let did_change_configuration : DidChangeConfigurationClientCapabilities? = match obj.get("didChangeConfiguration") {
    Some(v) if not(v.is_null()) => Some(DidChangeConfigurationClientCapabilities::from_json(v))
    _ => None
  }
  let did_change_watched_files : DidChangeWatchedFilesClientCapabilities? = match obj.get("didChangeWatchedFiles") {
    Some(v) if not(v.is_null()) => Some(DidChangeWatchedFilesClientCapabilities::from_json(v))
    _ => None
  }
  let symbol : WorkspaceSymbolClientCapabilities? = match obj.get("symbol") {
    Some(v) if not(v.is_null()) => Some(WorkspaceSymbolClientCapabilities::from_json(v))
    _ => None
  }
  let execute_command : ExecuteCommandClientCapabilities? = match obj.get("executeCommand") {
    Some(v) if not(v.is_null()) => Some(ExecuteCommandClientCapabilities::from_json(v))
    _ => None
  }
  let workspace_folders : Bool? = match obj.get("workspaceFolders") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let configuration : Bool? = match obj.get("configuration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let semantic_tokens : SemanticTokensWorkspaceClientCapabilities? = match obj.get("semanticTokens") {
    Some(v) if not(v.is_null()) => Some(SemanticTokensWorkspaceClientCapabilities::from_json(v))
    _ => None
  }
  let code_lens : CodeLensWorkspaceClientCapabilities? = match obj.get("codeLens") {
    Some(v) if not(v.is_null()) => Some(CodeLensWorkspaceClientCapabilities::from_json(v))
    _ => None
  }
  let file_operations : FileOperationClientCapabilities? = match obj.get("fileOperations") {
    Some(v) if not(v.is_null()) => Some(FileOperationClientCapabilities::from_json(v))
    _ => None
  }
  let inline_value : InlineValueWorkspaceClientCapabilities? = match obj.get("inlineValue") {
    Some(v) if not(v.is_null()) => Some(InlineValueWorkspaceClientCapabilities::from_json(v))
    _ => None
  }
  let inlay_hint : InlayHintWorkspaceClientCapabilities? = match obj.get("inlayHint") {
    Some(v) if not(v.is_null()) => Some(InlayHintWorkspaceClientCapabilities::from_json(v))
    _ => None
  }
  let diagnostics : DiagnosticWorkspaceClientCapabilities? = match obj.get("diagnostics") {
    Some(v) if not(v.is_null()) => Some(DiagnosticWorkspaceClientCapabilities::from_json(v))
    _ => None
  }
  let folding_range : FoldingRangeWorkspaceClientCapabilities? = match obj.get("foldingRange") {
    Some(v) if not(v.is_null()) => Some(FoldingRangeWorkspaceClientCapabilities::from_json(v))
    _ => None
  }
  let text_document_content : TextDocumentContentClientCapabilities? = match obj.get("textDocumentContent") {
    Some(v) if not(v.is_null()) => Some(TextDocumentContentClientCapabilities::from_json(v))
    _ => None
  }
  WorkspaceClientCapabilities::{ apply_edit, workspace_edit, did_change_configuration, did_change_watched_files, symbol, execute_command, workspace_folders, configuration, semantic_tokens, code_lens, file_operations, inline_value, inlay_hint, diagnostics, folding_range, text_document_content }
}

///| Text document specific client capabilities.
pub struct TextDocumentClientCapabilities {
  ///| Defines which synchronization capabilities the client supports.
  synchronization : TextDocumentSyncClientCapabilities?
  ///| Defines which filters the client supports.
  filters : TextDocumentFilterClientCapabilities?
  ///| Capabilities specific to the `textDocument/completion` request.
  completion : CompletionClientCapabilities?
  ///| Capabilities specific to the `textDocument/hover` request.
  hover : HoverClientCapabilities?
  ///| Capabilities specific to the `textDocument/signatureHelp` request.
  signature_help : SignatureHelpClientCapabilities?
  ///| Capabilities specific to the `textDocument/declaration` request.
  declaration : DeclarationClientCapabilities?
  ///| Capabilities specific to the `textDocument/definition` request.
  definition : DefinitionClientCapabilities?
  ///| Capabilities specific to the `textDocument/typeDefinition` request.
  type_definition : TypeDefinitionClientCapabilities?
  ///| Capabilities specific to the `textDocument/implementation` request.
  implementation : ImplementationClientCapabilities?
  ///| Capabilities specific to the `textDocument/references` request.
  references : ReferenceClientCapabilities?
  ///| Capabilities specific to the `textDocument/documentHighlight` request.
  document_highlight : DocumentHighlightClientCapabilities?
  ///| Capabilities specific to the `textDocument/documentSymbol` request.
  document_symbol : DocumentSymbolClientCapabilities?
  ///| Capabilities specific to the `textDocument/codeAction` request.
  code_action : CodeActionClientCapabilities?
  ///| Capabilities specific to the `textDocument/codeLens` request.
  code_lens : CodeLensClientCapabilities?
  ///| Capabilities specific to the `textDocument/documentLink` request.
  document_link : DocumentLinkClientCapabilities?
  ///| Capabilities specific to the `textDocument/documentColor` and the
  color_provider : DocumentColorClientCapabilities?
  ///| Capabilities specific to the `textDocument/formatting` request.
  formatting : DocumentFormattingClientCapabilities?
  ///| Capabilities specific to the `textDocument/rangeFormatting` request.
  range_formatting : DocumentRangeFormattingClientCapabilities?
  ///| Capabilities specific to the `textDocument/onTypeFormatting` request.
  on_type_formatting : DocumentOnTypeFormattingClientCapabilities?
  ///| Capabilities specific to the `textDocument/rename` request.
  rename : RenameClientCapabilities?
  ///| Capabilities specific to the `textDocument/foldingRange` request.
  folding_range : FoldingRangeClientCapabilities?
  ///| Capabilities specific to the `textDocument/selectionRange` request.
  selection_range : SelectionRangeClientCapabilities?
  ///| Capabilities specific to the `textDocument/publishDiagnostics` notification.
  publish_diagnostics : PublishDiagnosticsClientCapabilities?
  ///| Capabilities specific to the various call hierarchy requests.
  call_hierarchy : CallHierarchyClientCapabilities?
  ///| Capabilities specific to the various semantic token request.
  semantic_tokens : SemanticTokensClientCapabilities?
  ///| Capabilities specific to the `textDocument/linkedEditingRange` request.
  linked_editing_range : LinkedEditingRangeClientCapabilities?
  ///| Client capabilities specific to the `textDocument/moniker` request.
  moniker : MonikerClientCapabilities?
  ///| Capabilities specific to the various type hierarchy requests.
  type_hierarchy : TypeHierarchyClientCapabilities?
  ///| Capabilities specific to the `textDocument/inlineValue` request.
  inline_value : InlineValueClientCapabilities?
  ///| Capabilities specific to the `textDocument/inlayHint` request.
  inlay_hint : InlayHintClientCapabilities?
  ///| Capabilities specific to the diagnostic pull model.
  diagnostic : DiagnosticClientCapabilities?
  ///| Client capabilities specific to inline completions.
  inline_completion : InlineCompletionClientCapabilities?
}

///|
pub impl @json.ToJson for TextDocumentClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.synchronization {
    Some(v) => obj.set("synchronization", v.to_json())
    None => ()
  }
  match self.filters {
    Some(v) => obj.set("filters", v.to_json())
    None => ()
  }
  match self.completion {
    Some(v) => obj.set("completion", v.to_json())
    None => ()
  }
  match self.hover {
    Some(v) => obj.set("hover", v.to_json())
    None => ()
  }
  match self.signature_help {
    Some(v) => obj.set("signatureHelp", v.to_json())
    None => ()
  }
  match self.declaration {
    Some(v) => obj.set("declaration", v.to_json())
    None => ()
  }
  match self.definition {
    Some(v) => obj.set("definition", v.to_json())
    None => ()
  }
  match self.type_definition {
    Some(v) => obj.set("typeDefinition", v.to_json())
    None => ()
  }
  match self.implementation {
    Some(v) => obj.set("implementation", v.to_json())
    None => ()
  }
  match self.references {
    Some(v) => obj.set("references", v.to_json())
    None => ()
  }
  match self.document_highlight {
    Some(v) => obj.set("documentHighlight", v.to_json())
    None => ()
  }
  match self.document_symbol {
    Some(v) => obj.set("documentSymbol", v.to_json())
    None => ()
  }
  match self.code_action {
    Some(v) => obj.set("codeAction", v.to_json())
    None => ()
  }
  match self.code_lens {
    Some(v) => obj.set("codeLens", v.to_json())
    None => ()
  }
  match self.document_link {
    Some(v) => obj.set("documentLink", v.to_json())
    None => ()
  }
  match self.color_provider {
    Some(v) => obj.set("colorProvider", v.to_json())
    None => ()
  }
  match self.formatting {
    Some(v) => obj.set("formatting", v.to_json())
    None => ()
  }
  match self.range_formatting {
    Some(v) => obj.set("rangeFormatting", v.to_json())
    None => ()
  }
  match self.on_type_formatting {
    Some(v) => obj.set("onTypeFormatting", v.to_json())
    None => ()
  }
  match self.rename {
    Some(v) => obj.set("rename", v.to_json())
    None => ()
  }
  match self.folding_range {
    Some(v) => obj.set("foldingRange", v.to_json())
    None => ()
  }
  match self.selection_range {
    Some(v) => obj.set("selectionRange", v.to_json())
    None => ()
  }
  match self.publish_diagnostics {
    Some(v) => obj.set("publishDiagnostics", v.to_json())
    None => ()
  }
  match self.call_hierarchy {
    Some(v) => obj.set("callHierarchy", v.to_json())
    None => ()
  }
  match self.semantic_tokens {
    Some(v) => obj.set("semanticTokens", v.to_json())
    None => ()
  }
  match self.linked_editing_range {
    Some(v) => obj.set("linkedEditingRange", v.to_json())
    None => ()
  }
  match self.moniker {
    Some(v) => obj.set("moniker", v.to_json())
    None => ()
  }
  match self.type_hierarchy {
    Some(v) => obj.set("typeHierarchy", v.to_json())
    None => ()
  }
  match self.inline_value {
    Some(v) => obj.set("inlineValue", v.to_json())
    None => ()
  }
  match self.inlay_hint {
    Some(v) => obj.set("inlayHint", v.to_json())
    None => ()
  }
  match self.diagnostic {
    Some(v) => obj.set("diagnostic", v.to_json())
    None => ()
  }
  match self.inline_completion {
    Some(v) => obj.set("inlineCompletion", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextDocumentClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextDocumentClientCapabilities")
  }
  let synchronization : TextDocumentSyncClientCapabilities? = match obj.get("synchronization") {
    Some(v) if not(v.is_null()) => Some(TextDocumentSyncClientCapabilities::from_json(v))
    _ => None
  }
  let filters : TextDocumentFilterClientCapabilities? = match obj.get("filters") {
    Some(v) if not(v.is_null()) => Some(TextDocumentFilterClientCapabilities::from_json(v))
    _ => None
  }
  let completion : CompletionClientCapabilities? = match obj.get("completion") {
    Some(v) if not(v.is_null()) => Some(CompletionClientCapabilities::from_json(v))
    _ => None
  }
  let hover : HoverClientCapabilities? = match obj.get("hover") {
    Some(v) if not(v.is_null()) => Some(HoverClientCapabilities::from_json(v))
    _ => None
  }
  let signature_help : SignatureHelpClientCapabilities? = match obj.get("signatureHelp") {
    Some(v) if not(v.is_null()) => Some(SignatureHelpClientCapabilities::from_json(v))
    _ => None
  }
  let declaration : DeclarationClientCapabilities? = match obj.get("declaration") {
    Some(v) if not(v.is_null()) => Some(DeclarationClientCapabilities::from_json(v))
    _ => None
  }
  let definition : DefinitionClientCapabilities? = match obj.get("definition") {
    Some(v) if not(v.is_null()) => Some(DefinitionClientCapabilities::from_json(v))
    _ => None
  }
  let type_definition : TypeDefinitionClientCapabilities? = match obj.get("typeDefinition") {
    Some(v) if not(v.is_null()) => Some(TypeDefinitionClientCapabilities::from_json(v))
    _ => None
  }
  let implementation : ImplementationClientCapabilities? = match obj.get("implementation") {
    Some(v) if not(v.is_null()) => Some(ImplementationClientCapabilities::from_json(v))
    _ => None
  }
  let references : ReferenceClientCapabilities? = match obj.get("references") {
    Some(v) if not(v.is_null()) => Some(ReferenceClientCapabilities::from_json(v))
    _ => None
  }
  let document_highlight : DocumentHighlightClientCapabilities? = match obj.get("documentHighlight") {
    Some(v) if not(v.is_null()) => Some(DocumentHighlightClientCapabilities::from_json(v))
    _ => None
  }
  let document_symbol : DocumentSymbolClientCapabilities? = match obj.get("documentSymbol") {
    Some(v) if not(v.is_null()) => Some(DocumentSymbolClientCapabilities::from_json(v))
    _ => None
  }
  let code_action : CodeActionClientCapabilities? = match obj.get("codeAction") {
    Some(v) if not(v.is_null()) => Some(CodeActionClientCapabilities::from_json(v))
    _ => None
  }
  let code_lens : CodeLensClientCapabilities? = match obj.get("codeLens") {
    Some(v) if not(v.is_null()) => Some(CodeLensClientCapabilities::from_json(v))
    _ => None
  }
  let document_link : DocumentLinkClientCapabilities? = match obj.get("documentLink") {
    Some(v) if not(v.is_null()) => Some(DocumentLinkClientCapabilities::from_json(v))
    _ => None
  }
  let color_provider : DocumentColorClientCapabilities? = match obj.get("colorProvider") {
    Some(v) if not(v.is_null()) => Some(DocumentColorClientCapabilities::from_json(v))
    _ => None
  }
  let formatting : DocumentFormattingClientCapabilities? = match obj.get("formatting") {
    Some(v) if not(v.is_null()) => Some(DocumentFormattingClientCapabilities::from_json(v))
    _ => None
  }
  let range_formatting : DocumentRangeFormattingClientCapabilities? = match obj.get("rangeFormatting") {
    Some(v) if not(v.is_null()) => Some(DocumentRangeFormattingClientCapabilities::from_json(v))
    _ => None
  }
  let on_type_formatting : DocumentOnTypeFormattingClientCapabilities? = match obj.get("onTypeFormatting") {
    Some(v) if not(v.is_null()) => Some(DocumentOnTypeFormattingClientCapabilities::from_json(v))
    _ => None
  }
  let rename : RenameClientCapabilities? = match obj.get("rename") {
    Some(v) if not(v.is_null()) => Some(RenameClientCapabilities::from_json(v))
    _ => None
  }
  let folding_range : FoldingRangeClientCapabilities? = match obj.get("foldingRange") {
    Some(v) if not(v.is_null()) => Some(FoldingRangeClientCapabilities::from_json(v))
    _ => None
  }
  let selection_range : SelectionRangeClientCapabilities? = match obj.get("selectionRange") {
    Some(v) if not(v.is_null()) => Some(SelectionRangeClientCapabilities::from_json(v))
    _ => None
  }
  let publish_diagnostics : PublishDiagnosticsClientCapabilities? = match obj.get("publishDiagnostics") {
    Some(v) if not(v.is_null()) => Some(PublishDiagnosticsClientCapabilities::from_json(v))
    _ => None
  }
  let call_hierarchy : CallHierarchyClientCapabilities? = match obj.get("callHierarchy") {
    Some(v) if not(v.is_null()) => Some(CallHierarchyClientCapabilities::from_json(v))
    _ => None
  }
  let semantic_tokens : SemanticTokensClientCapabilities? = match obj.get("semanticTokens") {
    Some(v) if not(v.is_null()) => Some(SemanticTokensClientCapabilities::from_json(v))
    _ => None
  }
  let linked_editing_range : LinkedEditingRangeClientCapabilities? = match obj.get("linkedEditingRange") {
    Some(v) if not(v.is_null()) => Some(LinkedEditingRangeClientCapabilities::from_json(v))
    _ => None
  }
  let moniker : MonikerClientCapabilities? = match obj.get("moniker") {
    Some(v) if not(v.is_null()) => Some(MonikerClientCapabilities::from_json(v))
    _ => None
  }
  let type_hierarchy : TypeHierarchyClientCapabilities? = match obj.get("typeHierarchy") {
    Some(v) if not(v.is_null()) => Some(TypeHierarchyClientCapabilities::from_json(v))
    _ => None
  }
  let inline_value : InlineValueClientCapabilities? = match obj.get("inlineValue") {
    Some(v) if not(v.is_null()) => Some(InlineValueClientCapabilities::from_json(v))
    _ => None
  }
  let inlay_hint : InlayHintClientCapabilities? = match obj.get("inlayHint") {
    Some(v) if not(v.is_null()) => Some(InlayHintClientCapabilities::from_json(v))
    _ => None
  }
  let diagnostic : DiagnosticClientCapabilities? = match obj.get("diagnostic") {
    Some(v) if not(v.is_null()) => Some(DiagnosticClientCapabilities::from_json(v))
    _ => None
  }
  let inline_completion : InlineCompletionClientCapabilities? = match obj.get("inlineCompletion") {
    Some(v) if not(v.is_null()) => Some(InlineCompletionClientCapabilities::from_json(v))
    _ => None
  }
  TextDocumentClientCapabilities::{ synchronization, filters, completion, hover, signature_help, declaration, definition, type_definition, implementation, references, document_highlight, document_symbol, code_action, code_lens, document_link, color_provider, formatting, range_formatting, on_type_formatting, rename, folding_range, selection_range, publish_diagnostics, call_hierarchy, semantic_tokens, linked_editing_range, moniker, type_hierarchy, inline_value, inlay_hint, diagnostic, inline_completion }
}

///| Capabilities specific to the notebook document support.
pub struct NotebookDocumentClientCapabilities {
  ///| Capabilities specific to notebook document synchronization
  synchronization : NotebookDocumentSyncClientCapabilities
}

///|
pub impl @json.ToJson for NotebookDocumentClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("synchronization", self.synchronization.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for NotebookDocumentClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for NotebookDocumentClientCapabilities")
  }
  let synchronization = match obj.get("synchronization") {
    Some(v) => NotebookDocumentSyncClientCapabilities::from_json(v)
    None => raise @json.JsonError("missing synchronization")
  }
  NotebookDocumentClientCapabilities::{ synchronization }
}

pub struct WindowClientCapabilities {
  ///| It indicates whether the client supports server initiated
  work_done_progress : Bool?
  ///| Capabilities specific to the showMessage request.
  show_message : ShowMessageRequestClientCapabilities?
  ///| Capabilities specific to the showDocument request.
  show_document : ShowDocumentClientCapabilities?
}

///|
pub impl @json.ToJson for WindowClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.work_done_progress {
    Some(v) => obj.set("workDoneProgress", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.show_message {
    Some(v) => obj.set("showMessage", v.to_json())
    None => ()
  }
  match self.show_document {
    Some(v) => obj.set("showDocument", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WindowClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WindowClientCapabilities")
  }
  let work_done_progress : Bool? = match obj.get("workDoneProgress") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let show_message : ShowMessageRequestClientCapabilities? = match obj.get("showMessage") {
    Some(v) if not(v.is_null()) => Some(ShowMessageRequestClientCapabilities::from_json(v))
    _ => None
  }
  let show_document : ShowDocumentClientCapabilities? = match obj.get("showDocument") {
    Some(v) if not(v.is_null()) => Some(ShowDocumentClientCapabilities::from_json(v))
    _ => None
  }
  WindowClientCapabilities::{ work_done_progress, show_message, show_document }
}

///| General client capabilities.
pub struct GeneralClientCapabilities {
  ///| Client capability that signals how the client
  stale_request_support : StaleRequestSupportOptions?
  ///| Client capabilities specific to regular expressions.
  regular_expressions : RegularExpressionsClientCapabilities?
  ///| Client capabilities specific to the client's markdown parser.
  markdown : MarkdownClientCapabilities?
  ///| The position encodings supported by the client. Client and server
  position_encodings : Array[PositionEncodingKind]?
}

///|
pub impl @json.ToJson for GeneralClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.stale_request_support {
    Some(v) => obj.set("staleRequestSupport", v.to_json())
    None => ()
  }
  match self.regular_expressions {
    Some(v) => obj.set("regularExpressions", v.to_json())
    None => ()
  }
  match self.markdown {
    Some(v) => obj.set("markdown", v.to_json())
    None => ()
  }
  match self.position_encodings {
    Some(v) => obj.set("positionEncodings", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for GeneralClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for GeneralClientCapabilities")
  }
  let stale_request_support : StaleRequestSupportOptions? = match obj.get("staleRequestSupport") {
    Some(v) if not(v.is_null()) => Some(StaleRequestSupportOptions::from_json(v))
    _ => None
  }
  let regular_expressions : RegularExpressionsClientCapabilities? = match obj.get("regularExpressions") {
    Some(v) if not(v.is_null()) => Some(RegularExpressionsClientCapabilities::from_json(v))
    _ => None
  }
  let markdown : MarkdownClientCapabilities? = match obj.get("markdown") {
    Some(v) if not(v.is_null()) => Some(MarkdownClientCapabilities::from_json(v))
    _ => None
  }
  let position_encodings : Array[PositionEncodingKind]? = match obj.get("positionEncodings") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { PositionEncodingKind::from_json(item) }); _ => [] })
    _ => None
  }
  GeneralClientCapabilities::{ stale_request_support, regular_expressions, markdown, position_encodings }
}

pub struct WorkspaceFoldersServerCapabilities {
  ///| The server has support for workspace folders
  supported : Bool?
  ///| Whether the server wants to receive workspace folder
  change_notifications : @json.JsonValue?
}

///|
pub impl @json.ToJson for WorkspaceFoldersServerCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.supported {
    Some(v) => obj.set("supported", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.change_notifications {
    Some(v) => obj.set("changeNotifications", v)
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkspaceFoldersServerCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkspaceFoldersServerCapabilities")
  }
  let supported : Bool? = match obj.get("supported") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let change_notifications : @json.JsonValue? = obj.get("changeNotifications")
  WorkspaceFoldersServerCapabilities::{ supported, change_notifications }
}

///| Options for notifications/requests for user operations on files.
pub struct FileOperationOptions {
  ///| The server is interested in receiving didCreateFiles notifications.
  did_create : FileOperationRegistrationOptions?
  ///| The server is interested in receiving willCreateFiles requests.
  will_create : FileOperationRegistrationOptions?
  ///| The server is interested in receiving didRenameFiles notifications.
  did_rename : FileOperationRegistrationOptions?
  ///| The server is interested in receiving willRenameFiles requests.
  will_rename : FileOperationRegistrationOptions?
  ///| The server is interested in receiving didDeleteFiles file notifications.
  did_delete : FileOperationRegistrationOptions?
  ///| The server is interested in receiving willDeleteFiles file requests.
  will_delete : FileOperationRegistrationOptions?
}

///|
pub impl @json.ToJson for FileOperationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.did_create {
    Some(v) => obj.set("didCreate", v.to_json())
    None => ()
  }
  match self.will_create {
    Some(v) => obj.set("willCreate", v.to_json())
    None => ()
  }
  match self.did_rename {
    Some(v) => obj.set("didRename", v.to_json())
    None => ()
  }
  match self.will_rename {
    Some(v) => obj.set("willRename", v.to_json())
    None => ()
  }
  match self.did_delete {
    Some(v) => obj.set("didDelete", v.to_json())
    None => ()
  }
  match self.will_delete {
    Some(v) => obj.set("willDelete", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for FileOperationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for FileOperationOptions")
  }
  let did_create : FileOperationRegistrationOptions? = match obj.get("didCreate") {
    Some(v) if not(v.is_null()) => Some(FileOperationRegistrationOptions::from_json(v))
    _ => None
  }
  let will_create : FileOperationRegistrationOptions? = match obj.get("willCreate") {
    Some(v) if not(v.is_null()) => Some(FileOperationRegistrationOptions::from_json(v))
    _ => None
  }
  let did_rename : FileOperationRegistrationOptions? = match obj.get("didRename") {
    Some(v) if not(v.is_null()) => Some(FileOperationRegistrationOptions::from_json(v))
    _ => None
  }
  let will_rename : FileOperationRegistrationOptions? = match obj.get("willRename") {
    Some(v) if not(v.is_null()) => Some(FileOperationRegistrationOptions::from_json(v))
    _ => None
  }
  let did_delete : FileOperationRegistrationOptions? = match obj.get("didDelete") {
    Some(v) if not(v.is_null()) => Some(FileOperationRegistrationOptions::from_json(v))
    _ => None
  }
  let will_delete : FileOperationRegistrationOptions? = match obj.get("willDelete") {
    Some(v) if not(v.is_null()) => Some(FileOperationRegistrationOptions::from_json(v))
    _ => None
  }
  FileOperationOptions::{ did_create, will_create, did_rename, will_rename, did_delete, will_delete }
}

///| A relative pattern is a helper to construct glob patterns that are matched
pub struct RelativePattern {
  ///| A workspace folder or a base URI to which this pattern will be matched
  base_uri : @json.JsonValue
  ///| The actual glob pattern;
  pattern : Pattern
}

///|
pub impl @json.ToJson for RelativePattern with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("baseUri", self.base_uri)
  obj.set("pattern", @json.JsonValue::String(self.pattern))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for RelativePattern with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for RelativePattern")
  }
  let base_uri = match obj.get("baseUri") {
    Some(v) => v
    None => raise @json.JsonError("missing baseUri")
  }
  let pattern = match obj.get("pattern") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing pattern")
  }
  RelativePattern::{ base_uri, pattern }
}

///| A document filter where `language` is required field.
pub struct TextDocumentFilterLanguage {
  ///| A language id, like `typescript`.
  language : String
  ///| A Uri {@link Uri.scheme scheme}, like `file` or `untitled`.
  scheme : String?
  ///| A glob pattern, like **​/*.{ts,js}. See TextDocumentFilter for examples.
  pattern : GlobPattern?
}

///|
pub impl @json.ToJson for TextDocumentFilterLanguage with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("language", @json.JsonValue::String(self.language))
  match self.scheme {
    Some(v) => obj.set("scheme", @json.JsonValue::String(v))
    None => ()
  }
  match self.pattern {
    Some(v) => obj.set("pattern", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextDocumentFilterLanguage with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextDocumentFilterLanguage")
  }
  let language = match obj.get("language") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing language")
  }
  let scheme : String? = match obj.get("scheme") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let pattern : GlobPattern? = match obj.get("pattern") {
    Some(v) if not(v.is_null()) => Some(GlobPattern::from_json(v))
    _ => None
  }
  TextDocumentFilterLanguage::{ language, scheme, pattern }
}

///| A document filter where `scheme` is required field.
pub struct TextDocumentFilterScheme {
  ///| A language id, like `typescript`.
  language : String?
  ///| A Uri {@link Uri.scheme scheme}, like `file` or `untitled`.
  scheme : String
  ///| A glob pattern, like **​/*.{ts,js}. See TextDocumentFilter for examples.
  pattern : GlobPattern?
}

///|
pub impl @json.ToJson for TextDocumentFilterScheme with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.language {
    Some(v) => obj.set("language", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("scheme", @json.JsonValue::String(self.scheme))
  match self.pattern {
    Some(v) => obj.set("pattern", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextDocumentFilterScheme with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextDocumentFilterScheme")
  }
  let language : String? = match obj.get("language") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let scheme = match obj.get("scheme") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing scheme")
  }
  let pattern : GlobPattern? = match obj.get("pattern") {
    Some(v) if not(v.is_null()) => Some(GlobPattern::from_json(v))
    _ => None
  }
  TextDocumentFilterScheme::{ language, scheme, pattern }
}

///| A document filter where `pattern` is required field.
pub struct TextDocumentFilterPattern {
  ///| A language id, like `typescript`.
  language : String?
  ///| A Uri {@link Uri.scheme scheme}, like `file` or `untitled`.
  scheme : String?
  ///| A glob pattern, like **​/*.{ts,js}. See TextDocumentFilter for examples.
  pattern : GlobPattern
}

///|
pub impl @json.ToJson for TextDocumentFilterPattern with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.language {
    Some(v) => obj.set("language", @json.JsonValue::String(v))
    None => ()
  }
  match self.scheme {
    Some(v) => obj.set("scheme", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("pattern", self.pattern.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextDocumentFilterPattern with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextDocumentFilterPattern")
  }
  let language : String? = match obj.get("language") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let scheme : String? = match obj.get("scheme") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let pattern = match obj.get("pattern") {
    Some(v) => GlobPattern::from_json(v)
    None => raise @json.JsonError("missing pattern")
  }
  TextDocumentFilterPattern::{ language, scheme, pattern }
}

///| A notebook document filter where `notebookType` is required field.
pub struct NotebookDocumentFilterNotebookType {
  ///| The type of the enclosing notebook.
  notebook_type : String
  ///| A Uri {@link Uri.scheme scheme}, like `file` or `untitled`.
  scheme : String?
  ///| A glob pattern.
  pattern : GlobPattern?
}

///|
pub impl @json.ToJson for NotebookDocumentFilterNotebookType with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("notebookType", @json.JsonValue::String(self.notebook_type))
  match self.scheme {
    Some(v) => obj.set("scheme", @json.JsonValue::String(v))
    None => ()
  }
  match self.pattern {
    Some(v) => obj.set("pattern", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for NotebookDocumentFilterNotebookType with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for NotebookDocumentFilterNotebookType")
  }
  let notebook_type = match obj.get("notebookType") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing notebookType")
  }
  let scheme : String? = match obj.get("scheme") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let pattern : GlobPattern? = match obj.get("pattern") {
    Some(v) if not(v.is_null()) => Some(GlobPattern::from_json(v))
    _ => None
  }
  NotebookDocumentFilterNotebookType::{ notebook_type, scheme, pattern }
}

///| A notebook document filter where `scheme` is required field.
pub struct NotebookDocumentFilterScheme {
  ///| The type of the enclosing notebook.
  notebook_type : String?
  ///| A Uri {@link Uri.scheme scheme}, like `file` or `untitled`.
  scheme : String
  ///| A glob pattern.
  pattern : GlobPattern?
}

///|
pub impl @json.ToJson for NotebookDocumentFilterScheme with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.notebook_type {
    Some(v) => obj.set("notebookType", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("scheme", @json.JsonValue::String(self.scheme))
  match self.pattern {
    Some(v) => obj.set("pattern", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for NotebookDocumentFilterScheme with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for NotebookDocumentFilterScheme")
  }
  let notebook_type : String? = match obj.get("notebookType") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let scheme = match obj.get("scheme") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing scheme")
  }
  let pattern : GlobPattern? = match obj.get("pattern") {
    Some(v) if not(v.is_null()) => Some(GlobPattern::from_json(v))
    _ => None
  }
  NotebookDocumentFilterScheme::{ notebook_type, scheme, pattern }
}

///| A notebook document filter where `pattern` is required field.
pub struct NotebookDocumentFilterPattern {
  ///| The type of the enclosing notebook.
  notebook_type : String?
  ///| A Uri {@link Uri.scheme scheme}, like `file` or `untitled`.
  scheme : String?
  ///| A glob pattern.
  pattern : GlobPattern
}

///|
pub impl @json.ToJson for NotebookDocumentFilterPattern with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.notebook_type {
    Some(v) => obj.set("notebookType", @json.JsonValue::String(v))
    None => ()
  }
  match self.scheme {
    Some(v) => obj.set("scheme", @json.JsonValue::String(v))
    None => ()
  }
  obj.set("pattern", self.pattern.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for NotebookDocumentFilterPattern with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for NotebookDocumentFilterPattern")
  }
  let notebook_type : String? = match obj.get("notebookType") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let scheme : String? = match obj.get("scheme") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let pattern = match obj.get("pattern") {
    Some(v) => GlobPattern::from_json(v)
    None => raise @json.JsonError("missing pattern")
  }
  NotebookDocumentFilterPattern::{ notebook_type, scheme, pattern }
}

///| A change describing how to move a `NotebookCell`
pub struct NotebookCellArrayChange {
  ///| The start oftest of the cell that changed.
  start : Int
  ///| The deleted cells
  delete_count : Int
  ///| The new cells, if any
  cells : Array[NotebookCell]?
}

///|
pub impl @json.ToJson for NotebookCellArrayChange with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("start", @json.JsonValue::Number(self.start.to_double()))
  obj.set("deleteCount", @json.JsonValue::Number(self.delete_count.to_double()))
  match self.cells {
    Some(v) => obj.set("cells", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for NotebookCellArrayChange with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for NotebookCellArrayChange")
  }
  let start = match obj.get("start") {
    Some(v) => match v { @json.JsonValue::Number(n) => n.to_int(); _ => raise @json.JsonError("expected number") }
    None => raise @json.JsonError("missing start")
  }
  let delete_count = match obj.get("deleteCount") {
    Some(v) => match v { @json.JsonValue::Number(n) => n.to_int(); _ => raise @json.JsonError("expected number") }
    None => raise @json.JsonError("missing deleteCount")
  }
  let cells : Array[NotebookCell]? = match obj.get("cells") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { NotebookCell::from_json(item) }); _ => [] })
    _ => None
  }
  NotebookCellArrayChange::{ start, delete_count, cells }
}

pub struct WorkspaceEditClientCapabilities {
  ///| The client supports versioned document changes in `WorkspaceEdit`s
  document_changes : Bool?
  ///| The resource operations the client supports. Clients should at least
  resource_operations : Array[ResourceOperationKind]?
  ///| The failure handling strategy of a client if applying the workspace edit
  failure_handling : FailureHandlingKind?
  ///| Whether the client normalizes line endings to the client specific
  normalizes_line_endings : Bool?
  ///| Whether the client in general supports change annotations on text edits,
  change_annotation_support : ChangeAnnotationsSupportOptions?
  ///| Whether the client supports `WorkspaceEditMetadata` in `WorkspaceEdit`s.
  metadata_support : Bool?
  ///| Whether the client supports snippets as text edits.
  snippet_edit_support : Bool?
}

///|
pub impl @json.ToJson for WorkspaceEditClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.document_changes {
    Some(v) => obj.set("documentChanges", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.resource_operations {
    Some(v) => obj.set("resourceOperations", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  match self.failure_handling {
    Some(v) => obj.set("failureHandling", v.to_json())
    None => ()
  }
  match self.normalizes_line_endings {
    Some(v) => obj.set("normalizesLineEndings", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.change_annotation_support {
    Some(v) => obj.set("changeAnnotationSupport", v.to_json())
    None => ()
  }
  match self.metadata_support {
    Some(v) => obj.set("metadataSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.snippet_edit_support {
    Some(v) => obj.set("snippetEditSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkspaceEditClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkspaceEditClientCapabilities")
  }
  let document_changes : Bool? = match obj.get("documentChanges") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let resource_operations : Array[ResourceOperationKind]? = match obj.get("resourceOperations") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { ResourceOperationKind::from_json(item) }); _ => [] })
    _ => None
  }
  let failure_handling : FailureHandlingKind? = match obj.get("failureHandling") {
    Some(v) if not(v.is_null()) => Some(FailureHandlingKind::from_json(v))
    _ => None
  }
  let normalizes_line_endings : Bool? = match obj.get("normalizesLineEndings") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let change_annotation_support : ChangeAnnotationsSupportOptions? = match obj.get("changeAnnotationSupport") {
    Some(v) if not(v.is_null()) => Some(ChangeAnnotationsSupportOptions::from_json(v))
    _ => None
  }
  let metadata_support : Bool? = match obj.get("metadataSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let snippet_edit_support : Bool? = match obj.get("snippetEditSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  WorkspaceEditClientCapabilities::{ document_changes, resource_operations, failure_handling, normalizes_line_endings, change_annotation_support, metadata_support, snippet_edit_support }
}

pub struct DidChangeConfigurationClientCapabilities {
  ///| Did change configuration notification supports dynamic registration.
  dynamic_registration : Bool?
}

///|
pub impl @json.ToJson for DidChangeConfigurationClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DidChangeConfigurationClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DidChangeConfigurationClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DidChangeConfigurationClientCapabilities::{ dynamic_registration }
}

pub struct DidChangeWatchedFilesClientCapabilities {
  ///| Did change watched files notification supports dynamic registration. Please note
  dynamic_registration : Bool?
  ///| Whether the client has support for {@link  RelativePattern relative pattern}
  relative_pattern_support : Bool?
}

///|
pub impl @json.ToJson for DidChangeWatchedFilesClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.relative_pattern_support {
    Some(v) => obj.set("relativePatternSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DidChangeWatchedFilesClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DidChangeWatchedFilesClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let relative_pattern_support : Bool? = match obj.get("relativePatternSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DidChangeWatchedFilesClientCapabilities::{ dynamic_registration, relative_pattern_support }
}

///| Client capabilities for a {@link WorkspaceSymbolRequest}.
pub struct WorkspaceSymbolClientCapabilities {
  ///| Symbol request supports dynamic registration.
  dynamic_registration : Bool?
  ///| Specific capabilities for the `SymbolKind` in the `workspace/symbol` request.
  symbol_kind : ClientSymbolKindOptions?
  ///| The client supports tags on `SymbolInformation`.
  tag_support : ClientSymbolTagOptions?
  ///| The client support partial workspace symbols. The client will send the
  resolve_support : ClientSymbolResolveOptions?
}

///|
pub impl @json.ToJson for WorkspaceSymbolClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.symbol_kind {
    Some(v) => obj.set("symbolKind", v.to_json())
    None => ()
  }
  match self.tag_support {
    Some(v) => obj.set("tagSupport", v.to_json())
    None => ()
  }
  match self.resolve_support {
    Some(v) => obj.set("resolveSupport", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for WorkspaceSymbolClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for WorkspaceSymbolClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let symbol_kind : ClientSymbolKindOptions? = match obj.get("symbolKind") {
    Some(v) if not(v.is_null()) => Some(ClientSymbolKindOptions::from_json(v))
    _ => None
  }
  let tag_support : ClientSymbolTagOptions? = match obj.get("tagSupport") {
    Some(v) if not(v.is_null()) => Some(ClientSymbolTagOptions::from_json(v))
    _ => None
  }
  let resolve_support : ClientSymbolResolveOptions? = match obj.get("resolveSupport") {
    Some(v) if not(v.is_null()) => Some(ClientSymbolResolveOptions::from_json(v))
    _ => None
  }
  WorkspaceSymbolClientCapabilities::{ dynamic_registration, symbol_kind, tag_support, resolve_support }
}

///| The client capabilities of a {@link ExecuteCommandRequest}.
pub struct ExecuteCommandClientCapabilities {
  ///| Execute command supports dynamic registration.
  dynamic_registration : Bool?
}

///|
pub impl @json.ToJson for ExecuteCommandClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ExecuteCommandClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ExecuteCommandClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  ExecuteCommandClientCapabilities::{ dynamic_registration }
}

///| @since 3.16.0
pub struct SemanticTokensWorkspaceClientCapabilities {
  ///| Whether the client implementation supports a refresh request sent from
  refresh_support : Bool?
}

///|
pub impl @json.ToJson for SemanticTokensWorkspaceClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.refresh_support {
    Some(v) => obj.set("refreshSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SemanticTokensWorkspaceClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SemanticTokensWorkspaceClientCapabilities")
  }
  let refresh_support : Bool? = match obj.get("refreshSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  SemanticTokensWorkspaceClientCapabilities::{ refresh_support }
}

///| @since 3.16.0
pub struct CodeLensWorkspaceClientCapabilities {
  ///| Whether the client implementation supports a refresh request sent from the
  refresh_support : Bool?
}

///|
pub impl @json.ToJson for CodeLensWorkspaceClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.refresh_support {
    Some(v) => obj.set("refreshSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CodeLensWorkspaceClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CodeLensWorkspaceClientCapabilities")
  }
  let refresh_support : Bool? = match obj.get("refreshSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  CodeLensWorkspaceClientCapabilities::{ refresh_support }
}

///| Capabilities relating to events from file operations by the user in the client.
pub struct FileOperationClientCapabilities {
  ///| Whether the client supports dynamic registration for file requests/notifications.
  dynamic_registration : Bool?
  ///| The client has support for sending didCreateFiles notifications.
  did_create : Bool?
  ///| The client has support for sending willCreateFiles requests.
  will_create : Bool?
  ///| The client has support for sending didRenameFiles notifications.
  did_rename : Bool?
  ///| The client has support for sending willRenameFiles requests.
  will_rename : Bool?
  ///| The client has support for sending didDeleteFiles notifications.
  did_delete : Bool?
  ///| The client has support for sending willDeleteFiles requests.
  will_delete : Bool?
}

///|
pub impl @json.ToJson for FileOperationClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.did_create {
    Some(v) => obj.set("didCreate", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.will_create {
    Some(v) => obj.set("willCreate", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.did_rename {
    Some(v) => obj.set("didRename", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.will_rename {
    Some(v) => obj.set("willRename", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.did_delete {
    Some(v) => obj.set("didDelete", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.will_delete {
    Some(v) => obj.set("willDelete", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for FileOperationClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for FileOperationClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let did_create : Bool? = match obj.get("didCreate") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let will_create : Bool? = match obj.get("willCreate") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let did_rename : Bool? = match obj.get("didRename") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let will_rename : Bool? = match obj.get("willRename") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let did_delete : Bool? = match obj.get("didDelete") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let will_delete : Bool? = match obj.get("willDelete") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  FileOperationClientCapabilities::{ dynamic_registration, did_create, will_create, did_rename, will_rename, did_delete, will_delete }
}

///| Client workspace capabilities specific to inline values.
pub struct InlineValueWorkspaceClientCapabilities {
  ///| Whether the client implementation supports a refresh request sent from the
  refresh_support : Bool?
}

///|
pub impl @json.ToJson for InlineValueWorkspaceClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.refresh_support {
    Some(v) => obj.set("refreshSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlineValueWorkspaceClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlineValueWorkspaceClientCapabilities")
  }
  let refresh_support : Bool? = match obj.get("refreshSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  InlineValueWorkspaceClientCapabilities::{ refresh_support }
}

///| Client workspace capabilities specific to inlay hints.
pub struct InlayHintWorkspaceClientCapabilities {
  ///| Whether the client implementation supports a refresh request sent from
  refresh_support : Bool?
}

///|
pub impl @json.ToJson for InlayHintWorkspaceClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.refresh_support {
    Some(v) => obj.set("refreshSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlayHintWorkspaceClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlayHintWorkspaceClientCapabilities")
  }
  let refresh_support : Bool? = match obj.get("refreshSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  InlayHintWorkspaceClientCapabilities::{ refresh_support }
}

///| Workspace client capabilities specific to diagnostic pull requests.
pub struct DiagnosticWorkspaceClientCapabilities {
  ///| Whether the client implementation supports a refresh request sent from
  refresh_support : Bool?
}

///|
pub impl @json.ToJson for DiagnosticWorkspaceClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.refresh_support {
    Some(v) => obj.set("refreshSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DiagnosticWorkspaceClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DiagnosticWorkspaceClientCapabilities")
  }
  let refresh_support : Bool? = match obj.get("refreshSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DiagnosticWorkspaceClientCapabilities::{ refresh_support }
}

///| Client workspace capabilities specific to folding ranges
pub struct FoldingRangeWorkspaceClientCapabilities {
  ///| Whether the client implementation supports a refresh request sent from the
  refresh_support : Bool?
}

///|
pub impl @json.ToJson for FoldingRangeWorkspaceClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.refresh_support {
    Some(v) => obj.set("refreshSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for FoldingRangeWorkspaceClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for FoldingRangeWorkspaceClientCapabilities")
  }
  let refresh_support : Bool? = match obj.get("refreshSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  FoldingRangeWorkspaceClientCapabilities::{ refresh_support }
}

///| Client capabilities for a text document content provider.
pub struct TextDocumentContentClientCapabilities {
  ///| Text document content provider supports dynamic registration.
  dynamic_registration : Bool?
}

///|
pub impl @json.ToJson for TextDocumentContentClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextDocumentContentClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextDocumentContentClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  TextDocumentContentClientCapabilities::{ dynamic_registration }
}

pub struct TextDocumentSyncClientCapabilities {
  ///| Whether text document synchronization supports dynamic registration.
  dynamic_registration : Bool?
  ///| The client supports sending will save notifications.
  will_save : Bool?
  ///| The client supports sending a will save request and
  will_save_wait_until : Bool?
  ///| The client supports did save notifications.
  did_save : Bool?
}

///|
pub impl @json.ToJson for TextDocumentSyncClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.will_save {
    Some(v) => obj.set("willSave", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.will_save_wait_until {
    Some(v) => obj.set("willSaveWaitUntil", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.did_save {
    Some(v) => obj.set("didSave", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextDocumentSyncClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextDocumentSyncClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let will_save : Bool? = match obj.get("willSave") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let will_save_wait_until : Bool? = match obj.get("willSaveWaitUntil") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let did_save : Bool? = match obj.get("didSave") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  TextDocumentSyncClientCapabilities::{ dynamic_registration, will_save, will_save_wait_until, did_save }
}

pub struct TextDocumentFilterClientCapabilities {
  ///| The client supports Relative Patterns.
  relative_pattern_support : Bool?
}

///|
pub impl @json.ToJson for TextDocumentFilterClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.relative_pattern_support {
    Some(v) => obj.set("relativePatternSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TextDocumentFilterClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TextDocumentFilterClientCapabilities")
  }
  let relative_pattern_support : Bool? = match obj.get("relativePatternSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  TextDocumentFilterClientCapabilities::{ relative_pattern_support }
}

///| Completion client capabilities
pub struct CompletionClientCapabilities {
  ///| Whether completion supports dynamic registration.
  dynamic_registration : Bool?
  ///| The client supports the following `CompletionItem` specific
  completion_item : ClientCompletionItemOptions?
  completion_item_kind : ClientCompletionItemOptionsKind?
  ///| Defines how the client handles whitespace and indentation
  insert_text_mode : InsertTextMode?
  ///| The client supports to send additional context information for a
  context_support : Bool?
  ///| The client supports the following `CompletionList` specific
  completion_list : CompletionListCapabilities?
}

///|
pub impl @json.ToJson for CompletionClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.completion_item {
    Some(v) => obj.set("completionItem", v.to_json())
    None => ()
  }
  match self.completion_item_kind {
    Some(v) => obj.set("completionItemKind", v.to_json())
    None => ()
  }
  match self.insert_text_mode {
    Some(v) => obj.set("insertTextMode", v.to_json())
    None => ()
  }
  match self.context_support {
    Some(v) => obj.set("contextSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.completion_list {
    Some(v) => obj.set("completionList", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CompletionClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CompletionClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let completion_item : ClientCompletionItemOptions? = match obj.get("completionItem") {
    Some(v) if not(v.is_null()) => Some(ClientCompletionItemOptions::from_json(v))
    _ => None
  }
  let completion_item_kind : ClientCompletionItemOptionsKind? = match obj.get("completionItemKind") {
    Some(v) if not(v.is_null()) => Some(ClientCompletionItemOptionsKind::from_json(v))
    _ => None
  }
  let insert_text_mode : InsertTextMode? = match obj.get("insertTextMode") {
    Some(v) if not(v.is_null()) => Some(InsertTextMode::from_json(v))
    _ => None
  }
  let context_support : Bool? = match obj.get("contextSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let completion_list : CompletionListCapabilities? = match obj.get("completionList") {
    Some(v) if not(v.is_null()) => Some(CompletionListCapabilities::from_json(v))
    _ => None
  }
  CompletionClientCapabilities::{ dynamic_registration, completion_item, completion_item_kind, insert_text_mode, context_support, completion_list }
}

pub struct HoverClientCapabilities {
  ///| Whether hover supports dynamic registration.
  dynamic_registration : Bool?
  ///| Client supports the following content formats for the content
  content_format : Array[MarkupKind]?
}

///|
pub impl @json.ToJson for HoverClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.content_format {
    Some(v) => obj.set("contentFormat", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for HoverClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for HoverClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let content_format : Array[MarkupKind]? = match obj.get("contentFormat") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { MarkupKind::from_json(item) }); _ => [] })
    _ => None
  }
  HoverClientCapabilities::{ dynamic_registration, content_format }
}

///| Client Capabilities for a {@link SignatureHelpRequest}.
pub struct SignatureHelpClientCapabilities {
  ///| Whether signature help supports dynamic registration.
  dynamic_registration : Bool?
  ///| The client supports the following `SignatureInformation`
  signature_information : ClientSignatureInformationOptions?
  ///| The client supports to send additional context information for a
  context_support : Bool?
}

///|
pub impl @json.ToJson for SignatureHelpClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.signature_information {
    Some(v) => obj.set("signatureInformation", v.to_json())
    None => ()
  }
  match self.context_support {
    Some(v) => obj.set("contextSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SignatureHelpClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SignatureHelpClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let signature_information : ClientSignatureInformationOptions? = match obj.get("signatureInformation") {
    Some(v) if not(v.is_null()) => Some(ClientSignatureInformationOptions::from_json(v))
    _ => None
  }
  let context_support : Bool? = match obj.get("contextSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  SignatureHelpClientCapabilities::{ dynamic_registration, signature_information, context_support }
}

///| @since 3.14.0
pub struct DeclarationClientCapabilities {
  ///| Whether declaration supports dynamic registration. If this is set to `true`
  dynamic_registration : Bool?
  ///| The client supports additional metadata in the form of declaration links.
  link_support : Bool?
}

///|
pub impl @json.ToJson for DeclarationClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.link_support {
    Some(v) => obj.set("linkSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DeclarationClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DeclarationClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let link_support : Bool? = match obj.get("linkSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DeclarationClientCapabilities::{ dynamic_registration, link_support }
}

///| Client Capabilities for a {@link DefinitionRequest}.
pub struct DefinitionClientCapabilities {
  ///| Whether definition supports dynamic registration.
  dynamic_registration : Bool?
  ///| The client supports additional metadata in the form of definition links.
  link_support : Bool?
}

///|
pub impl @json.ToJson for DefinitionClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.link_support {
    Some(v) => obj.set("linkSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DefinitionClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DefinitionClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let link_support : Bool? = match obj.get("linkSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DefinitionClientCapabilities::{ dynamic_registration, link_support }
}

///| Since 3.6.0
pub struct TypeDefinitionClientCapabilities {
  ///| Whether implementation supports dynamic registration. If this is set to `true`
  dynamic_registration : Bool?
  ///| The client supports additional metadata in the form of definition links.
  link_support : Bool?
}

///|
pub impl @json.ToJson for TypeDefinitionClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.link_support {
    Some(v) => obj.set("linkSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TypeDefinitionClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TypeDefinitionClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let link_support : Bool? = match obj.get("linkSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  TypeDefinitionClientCapabilities::{ dynamic_registration, link_support }
}

///| @since 3.6.0
pub struct ImplementationClientCapabilities {
  ///| Whether implementation supports dynamic registration. If this is set to `true`
  dynamic_registration : Bool?
  ///| The client supports additional metadata in the form of definition links.
  link_support : Bool?
}

///|
pub impl @json.ToJson for ImplementationClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.link_support {
    Some(v) => obj.set("linkSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ImplementationClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ImplementationClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let link_support : Bool? = match obj.get("linkSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  ImplementationClientCapabilities::{ dynamic_registration, link_support }
}

///| Client Capabilities for a {@link ReferencesRequest}.
pub struct ReferenceClientCapabilities {
  ///| Whether references supports dynamic registration.
  dynamic_registration : Bool?
}

///|
pub impl @json.ToJson for ReferenceClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ReferenceClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ReferenceClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  ReferenceClientCapabilities::{ dynamic_registration }
}

///| Client Capabilities for a {@link DocumentHighlightRequest}.
pub struct DocumentHighlightClientCapabilities {
  ///| Whether document highlight supports dynamic registration.
  dynamic_registration : Bool?
}

///|
pub impl @json.ToJson for DocumentHighlightClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentHighlightClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentHighlightClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DocumentHighlightClientCapabilities::{ dynamic_registration }
}

///| Client Capabilities for a {@link DocumentSymbolRequest}.
pub struct DocumentSymbolClientCapabilities {
  ///| Whether document symbol supports dynamic registration.
  dynamic_registration : Bool?
  ///| Specific capabilities for the `SymbolKind` in the
  symbol_kind : ClientSymbolKindOptions?
  ///| The client supports hierarchical document symbols.
  hierarchical_document_symbol_support : Bool?
  ///| The client supports tags on `SymbolInformation`. Tags are supported on
  tag_support : ClientSymbolTagOptions?
  ///| The client supports an additional label presented in the UI when
  label_support : Bool?
}

///|
pub impl @json.ToJson for DocumentSymbolClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.symbol_kind {
    Some(v) => obj.set("symbolKind", v.to_json())
    None => ()
  }
  match self.hierarchical_document_symbol_support {
    Some(v) => obj.set("hierarchicalDocumentSymbolSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.tag_support {
    Some(v) => obj.set("tagSupport", v.to_json())
    None => ()
  }
  match self.label_support {
    Some(v) => obj.set("labelSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentSymbolClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentSymbolClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let symbol_kind : ClientSymbolKindOptions? = match obj.get("symbolKind") {
    Some(v) if not(v.is_null()) => Some(ClientSymbolKindOptions::from_json(v))
    _ => None
  }
  let hierarchical_document_symbol_support : Bool? = match obj.get("hierarchicalDocumentSymbolSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let tag_support : ClientSymbolTagOptions? = match obj.get("tagSupport") {
    Some(v) if not(v.is_null()) => Some(ClientSymbolTagOptions::from_json(v))
    _ => None
  }
  let label_support : Bool? = match obj.get("labelSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DocumentSymbolClientCapabilities::{ dynamic_registration, symbol_kind, hierarchical_document_symbol_support, tag_support, label_support }
}

///| The Client Capabilities of a {@link CodeActionRequest}.
pub struct CodeActionClientCapabilities {
  ///| Whether code action supports dynamic registration.
  dynamic_registration : Bool?
  ///| The client support code action literals of type `CodeAction` as a valid
  code_action_literal_support : ClientCodeActionLiteralOptions?
  ///| Whether code action supports the `isPreferred` property.
  is_preferred_support : Bool?
  ///| Whether code action supports the `disabled` property.
  disabled_support : Bool?
  ///| Whether code action supports the `data` property which is
  data_support : Bool?
  ///| Whether the client supports resolving additional code action
  resolve_support : ClientCodeActionResolveOptions?
  ///| Whether the client honors the change annotations in
  honors_change_annotations : Bool?
  ///| Whether the client supports documentation for a class of
  documentation_support : Bool?
  ///| Client supports the tag property on a code action. Clients
  tag_support : CodeActionTagOptions?
}

///|
pub impl @json.ToJson for CodeActionClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.code_action_literal_support {
    Some(v) => obj.set("codeActionLiteralSupport", v.to_json())
    None => ()
  }
  match self.is_preferred_support {
    Some(v) => obj.set("isPreferredSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.disabled_support {
    Some(v) => obj.set("disabledSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.data_support {
    Some(v) => obj.set("dataSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.resolve_support {
    Some(v) => obj.set("resolveSupport", v.to_json())
    None => ()
  }
  match self.honors_change_annotations {
    Some(v) => obj.set("honorsChangeAnnotations", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.documentation_support {
    Some(v) => obj.set("documentationSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.tag_support {
    Some(v) => obj.set("tagSupport", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CodeActionClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CodeActionClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let code_action_literal_support : ClientCodeActionLiteralOptions? = match obj.get("codeActionLiteralSupport") {
    Some(v) if not(v.is_null()) => Some(ClientCodeActionLiteralOptions::from_json(v))
    _ => None
  }
  let is_preferred_support : Bool? = match obj.get("isPreferredSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let disabled_support : Bool? = match obj.get("disabledSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let data_support : Bool? = match obj.get("dataSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let resolve_support : ClientCodeActionResolveOptions? = match obj.get("resolveSupport") {
    Some(v) if not(v.is_null()) => Some(ClientCodeActionResolveOptions::from_json(v))
    _ => None
  }
  let honors_change_annotations : Bool? = match obj.get("honorsChangeAnnotations") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let documentation_support : Bool? = match obj.get("documentationSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let tag_support : CodeActionTagOptions? = match obj.get("tagSupport") {
    Some(v) if not(v.is_null()) => Some(CodeActionTagOptions::from_json(v))
    _ => None
  }
  CodeActionClientCapabilities::{ dynamic_registration, code_action_literal_support, is_preferred_support, disabled_support, data_support, resolve_support, honors_change_annotations, documentation_support, tag_support }
}

///| The client capabilities  of a {@link CodeLensRequest}.
pub struct CodeLensClientCapabilities {
  ///| Whether code lens supports dynamic registration.
  dynamic_registration : Bool?
  ///| Whether the client supports resolving additional code lens
  resolve_support : ClientCodeLensResolveOptions?
}

///|
pub impl @json.ToJson for CodeLensClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.resolve_support {
    Some(v) => obj.set("resolveSupport", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CodeLensClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CodeLensClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let resolve_support : ClientCodeLensResolveOptions? = match obj.get("resolveSupport") {
    Some(v) if not(v.is_null()) => Some(ClientCodeLensResolveOptions::from_json(v))
    _ => None
  }
  CodeLensClientCapabilities::{ dynamic_registration, resolve_support }
}

///| The client capabilities of a {@link DocumentLinkRequest}.
pub struct DocumentLinkClientCapabilities {
  ///| Whether document link supports dynamic registration.
  dynamic_registration : Bool?
  ///| Whether the client supports the `tooltip` property on `DocumentLink`.
  tooltip_support : Bool?
}

///|
pub impl @json.ToJson for DocumentLinkClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.tooltip_support {
    Some(v) => obj.set("tooltipSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentLinkClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentLinkClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let tooltip_support : Bool? = match obj.get("tooltipSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DocumentLinkClientCapabilities::{ dynamic_registration, tooltip_support }
}

pub struct DocumentColorClientCapabilities {
  ///| Whether implementation supports dynamic registration. If this is set to `true`
  dynamic_registration : Bool?
}

///|
pub impl @json.ToJson for DocumentColorClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentColorClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentColorClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DocumentColorClientCapabilities::{ dynamic_registration }
}

///| Client capabilities of a {@link DocumentFormattingRequest}.
pub struct DocumentFormattingClientCapabilities {
  ///| Whether formatting supports dynamic registration.
  dynamic_registration : Bool?
}

///|
pub impl @json.ToJson for DocumentFormattingClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentFormattingClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentFormattingClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DocumentFormattingClientCapabilities::{ dynamic_registration }
}

///| Client capabilities of a {@link DocumentRangeFormattingRequest}.
pub struct DocumentRangeFormattingClientCapabilities {
  ///| Whether range formatting supports dynamic registration.
  dynamic_registration : Bool?
  ///| Whether the client supports formatting multiple ranges at once.
  ranges_support : Bool?
}

///|
pub impl @json.ToJson for DocumentRangeFormattingClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.ranges_support {
    Some(v) => obj.set("rangesSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentRangeFormattingClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentRangeFormattingClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let ranges_support : Bool? = match obj.get("rangesSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DocumentRangeFormattingClientCapabilities::{ dynamic_registration, ranges_support }
}

///| Client capabilities of a {@link DocumentOnTypeFormattingRequest}.
pub struct DocumentOnTypeFormattingClientCapabilities {
  ///| Whether on type formatting supports dynamic registration.
  dynamic_registration : Bool?
}

///|
pub impl @json.ToJson for DocumentOnTypeFormattingClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DocumentOnTypeFormattingClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DocumentOnTypeFormattingClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DocumentOnTypeFormattingClientCapabilities::{ dynamic_registration }
}

pub struct RenameClientCapabilities {
  ///| Whether rename supports dynamic registration.
  dynamic_registration : Bool?
  ///| Client supports testing for validity of rename operations
  prepare_support : Bool?
  ///| Client supports the default behavior result.
  prepare_support_default_behavior : PrepareSupportDefaultBehavior?
  ///| Whether the client honors the change annotations in
  honors_change_annotations : Bool?
}

///|
pub impl @json.ToJson for RenameClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.prepare_support {
    Some(v) => obj.set("prepareSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.prepare_support_default_behavior {
    Some(v) => obj.set("prepareSupportDefaultBehavior", v.to_json())
    None => ()
  }
  match self.honors_change_annotations {
    Some(v) => obj.set("honorsChangeAnnotations", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for RenameClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for RenameClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let prepare_support : Bool? = match obj.get("prepareSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let prepare_support_default_behavior : PrepareSupportDefaultBehavior? = match obj.get("prepareSupportDefaultBehavior") {
    Some(v) if not(v.is_null()) => Some(PrepareSupportDefaultBehavior::from_json(v))
    _ => None
  }
  let honors_change_annotations : Bool? = match obj.get("honorsChangeAnnotations") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  RenameClientCapabilities::{ dynamic_registration, prepare_support, prepare_support_default_behavior, honors_change_annotations }
}

pub struct FoldingRangeClientCapabilities {
  ///| Whether implementation supports dynamic registration for folding range
  dynamic_registration : Bool?
  ///| The maximum number of folding ranges that the client prefers to receive
  range_limit : Int?
  ///| If set, the client signals that it only supports folding complete lines.
  line_folding_only : Bool?
  ///| Specific options for the folding range kind.
  folding_range_kind : ClientFoldingRangeKindOptions?
  ///| Specific options for the folding range.
  folding_range : ClientFoldingRangeOptions?
}

///|
pub impl @json.ToJson for FoldingRangeClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.range_limit {
    Some(v) => obj.set("rangeLimit", @json.JsonValue::Number(v.to_double()))
    None => ()
  }
  match self.line_folding_only {
    Some(v) => obj.set("lineFoldingOnly", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.folding_range_kind {
    Some(v) => obj.set("foldingRangeKind", v.to_json())
    None => ()
  }
  match self.folding_range {
    Some(v) => obj.set("foldingRange", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for FoldingRangeClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for FoldingRangeClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let range_limit : Int? = match obj.get("rangeLimit") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Number(n) => n.to_int(); _ => raise @json.JsonError("expected number") })
    _ => None
  }
  let line_folding_only : Bool? = match obj.get("lineFoldingOnly") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let folding_range_kind : ClientFoldingRangeKindOptions? = match obj.get("foldingRangeKind") {
    Some(v) if not(v.is_null()) => Some(ClientFoldingRangeKindOptions::from_json(v))
    _ => None
  }
  let folding_range : ClientFoldingRangeOptions? = match obj.get("foldingRange") {
    Some(v) if not(v.is_null()) => Some(ClientFoldingRangeOptions::from_json(v))
    _ => None
  }
  FoldingRangeClientCapabilities::{ dynamic_registration, range_limit, line_folding_only, folding_range_kind, folding_range }
}

pub struct SelectionRangeClientCapabilities {
  ///| Whether implementation supports dynamic registration for selection range providers. If this is set t
  dynamic_registration : Bool?
}

///|
pub impl @json.ToJson for SelectionRangeClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SelectionRangeClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SelectionRangeClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  SelectionRangeClientCapabilities::{ dynamic_registration }
}

///| The publish diagnostic client capabilities.
///| Extends: DiagnosticsCapabilities
pub struct PublishDiagnosticsClientCapabilities {
  ///| Whether the clients accepts diagnostics with related information.
  related_information : Bool?
  ///| Client supports the tag property to provide meta data about a diagnostic.
  tag_support : ClientDiagnosticsTagOptions?
  ///| Client supports a codeDescription property
  code_description_support : Bool?
  ///| Whether code action supports the `data` property which is
  data_support : Bool?
  ///| Whether the client interprets the version property of the
  version_support : Bool?
}

///|
pub impl @json.ToJson for PublishDiagnosticsClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.related_information {
    Some(v) => obj.set("relatedInformation", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.tag_support {
    Some(v) => obj.set("tagSupport", v.to_json())
    None => ()
  }
  match self.code_description_support {
    Some(v) => obj.set("codeDescriptionSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.data_support {
    Some(v) => obj.set("dataSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.version_support {
    Some(v) => obj.set("versionSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for PublishDiagnosticsClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for PublishDiagnosticsClientCapabilities")
  }
  let related_information : Bool? = match obj.get("relatedInformation") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let tag_support : ClientDiagnosticsTagOptions? = match obj.get("tagSupport") {
    Some(v) if not(v.is_null()) => Some(ClientDiagnosticsTagOptions::from_json(v))
    _ => None
  }
  let code_description_support : Bool? = match obj.get("codeDescriptionSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let data_support : Bool? = match obj.get("dataSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let version_support : Bool? = match obj.get("versionSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  PublishDiagnosticsClientCapabilities::{ related_information, tag_support, code_description_support, data_support, version_support }
}

///| @since 3.16.0
pub struct CallHierarchyClientCapabilities {
  ///| Whether implementation supports dynamic registration. If this is set to `true`
  dynamic_registration : Bool?
}

///|
pub impl @json.ToJson for CallHierarchyClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CallHierarchyClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CallHierarchyClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  CallHierarchyClientCapabilities::{ dynamic_registration }
}

///| @since 3.16.0
pub struct SemanticTokensClientCapabilities {
  ///| Whether implementation supports dynamic registration. If this is set to `true`
  dynamic_registration : Bool?
  ///| Which requests the client supports and might send to the server
  requests : ClientSemanticTokensRequestOptions
  ///| The token types that the client supports.
  token_types : Array[String]
  ///| The token modifiers that the client supports.
  token_modifiers : Array[String]
  ///| The token formats the clients supports.
  formats : Array[TokenFormat]
  ///| Whether the client supports tokens that can overlap each other.
  overlapping_token_support : Bool?
  ///| Whether the client supports tokens that can span multiple lines.
  multiline_token_support : Bool?
  ///| Whether the client allows the server to actively cancel a
  server_cancel_support : Bool?
  ///| Whether the client uses semantic tokens to augment existing
  augments_syntax_tokens : Bool?
}

///|
pub impl @json.ToJson for SemanticTokensClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  obj.set("requests", self.requests.to_json())
  obj.set("tokenTypes", @json.JsonValue::Array(self.token_types.map(fn(item) { @json.JsonValue::String(item) })))
  obj.set("tokenModifiers", @json.JsonValue::Array(self.token_modifiers.map(fn(item) { @json.JsonValue::String(item) })))
  obj.set("formats", @json.JsonValue::Array(self.formats.map(fn(item) { item.to_json() })))
  match self.overlapping_token_support {
    Some(v) => obj.set("overlappingTokenSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.multiline_token_support {
    Some(v) => obj.set("multilineTokenSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.server_cancel_support {
    Some(v) => obj.set("serverCancelSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.augments_syntax_tokens {
    Some(v) => obj.set("augmentsSyntaxTokens", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for SemanticTokensClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for SemanticTokensClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let requests = match obj.get("requests") {
    Some(v) => ClientSemanticTokensRequestOptions::from_json(v)
    None => raise @json.JsonError("missing requests")
  }
  let token_types = match obj.get("tokenTypes") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] }
    None => raise @json.JsonError("missing tokenTypes")
  }
  let token_modifiers = match obj.get("tokenModifiers") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] }
    None => raise @json.JsonError("missing tokenModifiers")
  }
  let formats = match obj.get("formats") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { TokenFormat::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing formats")
  }
  let overlapping_token_support : Bool? = match obj.get("overlappingTokenSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let multiline_token_support : Bool? = match obj.get("multilineTokenSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let server_cancel_support : Bool? = match obj.get("serverCancelSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let augments_syntax_tokens : Bool? = match obj.get("augmentsSyntaxTokens") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  SemanticTokensClientCapabilities::{ dynamic_registration, requests, token_types, token_modifiers, formats, overlapping_token_support, multiline_token_support, server_cancel_support, augments_syntax_tokens }
}

///| Client capabilities for the linked editing range request.
pub struct LinkedEditingRangeClientCapabilities {
  ///| Whether implementation supports dynamic registration. If this is set to `true`
  dynamic_registration : Bool?
}

///|
pub impl @json.ToJson for LinkedEditingRangeClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for LinkedEditingRangeClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for LinkedEditingRangeClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  LinkedEditingRangeClientCapabilities::{ dynamic_registration }
}

///| Client capabilities specific to the moniker request.
pub struct MonikerClientCapabilities {
  ///| Whether moniker supports dynamic registration. If this is set to `true`
  dynamic_registration : Bool?
}

///|
pub impl @json.ToJson for MonikerClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for MonikerClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for MonikerClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  MonikerClientCapabilities::{ dynamic_registration }
}

///| @since 3.17.0
pub struct TypeHierarchyClientCapabilities {
  ///| Whether implementation supports dynamic registration. If this is set to `true`
  dynamic_registration : Bool?
}

///|
pub impl @json.ToJson for TypeHierarchyClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for TypeHierarchyClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for TypeHierarchyClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  TypeHierarchyClientCapabilities::{ dynamic_registration }
}

///| Client capabilities specific to inline values.
pub struct InlineValueClientCapabilities {
  ///| Whether implementation supports dynamic registration for inline value providers.
  dynamic_registration : Bool?
}

///|
pub impl @json.ToJson for InlineValueClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlineValueClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlineValueClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  InlineValueClientCapabilities::{ dynamic_registration }
}

///| Inlay hint client capabilities.
pub struct InlayHintClientCapabilities {
  ///| Whether inlay hints support dynamic registration.
  dynamic_registration : Bool?
  ///| Indicates which properties a client can resolve lazily on an inlay
  resolve_support : ClientInlayHintResolveOptions?
}

///|
pub impl @json.ToJson for InlayHintClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.resolve_support {
    Some(v) => obj.set("resolveSupport", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlayHintClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlayHintClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let resolve_support : ClientInlayHintResolveOptions? = match obj.get("resolveSupport") {
    Some(v) if not(v.is_null()) => Some(ClientInlayHintResolveOptions::from_json(v))
    _ => None
  }
  InlayHintClientCapabilities::{ dynamic_registration, resolve_support }
}

///| Client capabilities specific to diagnostic pull requests.
///| Extends: DiagnosticsCapabilities
pub struct DiagnosticClientCapabilities {
  ///| Whether the clients accepts diagnostics with related information.
  related_information : Bool?
  ///| Client supports the tag property to provide meta data about a diagnostic.
  tag_support : ClientDiagnosticsTagOptions?
  ///| Client supports a codeDescription property
  code_description_support : Bool?
  ///| Whether code action supports the `data` property which is
  data_support : Bool?
  ///| Whether implementation supports dynamic registration. If this is set to `true`
  dynamic_registration : Bool?
  ///| Whether the clients supports related documents for document diagnostic pulls.
  related_document_support : Bool?
}

///|
pub impl @json.ToJson for DiagnosticClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.related_information {
    Some(v) => obj.set("relatedInformation", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.tag_support {
    Some(v) => obj.set("tagSupport", v.to_json())
    None => ()
  }
  match self.code_description_support {
    Some(v) => obj.set("codeDescriptionSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.data_support {
    Some(v) => obj.set("dataSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.related_document_support {
    Some(v) => obj.set("relatedDocumentSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DiagnosticClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DiagnosticClientCapabilities")
  }
  let related_information : Bool? = match obj.get("relatedInformation") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let tag_support : ClientDiagnosticsTagOptions? = match obj.get("tagSupport") {
    Some(v) if not(v.is_null()) => Some(ClientDiagnosticsTagOptions::from_json(v))
    _ => None
  }
  let code_description_support : Bool? = match obj.get("codeDescriptionSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let data_support : Bool? = match obj.get("dataSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let related_document_support : Bool? = match obj.get("relatedDocumentSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DiagnosticClientCapabilities::{ related_information, tag_support, code_description_support, data_support, dynamic_registration, related_document_support }
}

///| Client capabilities specific to inline completions.
pub struct InlineCompletionClientCapabilities {
  ///| Whether implementation supports dynamic registration for inline completion providers.
  dynamic_registration : Bool?
}

///|
pub impl @json.ToJson for InlineCompletionClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for InlineCompletionClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for InlineCompletionClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  InlineCompletionClientCapabilities::{ dynamic_registration }
}

///| Notebook specific client capabilities.
pub struct NotebookDocumentSyncClientCapabilities {
  ///| Whether implementation supports dynamic registration. If this is
  dynamic_registration : Bool?
  ///| The client supports sending execution summary data per cell.
  execution_summary_support : Bool?
}

///|
pub impl @json.ToJson for NotebookDocumentSyncClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.dynamic_registration {
    Some(v) => obj.set("dynamicRegistration", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.execution_summary_support {
    Some(v) => obj.set("executionSummarySupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for NotebookDocumentSyncClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for NotebookDocumentSyncClientCapabilities")
  }
  let dynamic_registration : Bool? = match obj.get("dynamicRegistration") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let execution_summary_support : Bool? = match obj.get("executionSummarySupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  NotebookDocumentSyncClientCapabilities::{ dynamic_registration, execution_summary_support }
}

///| Show message request client capabilities
pub struct ShowMessageRequestClientCapabilities {
  ///| Capabilities specific to the `MessageActionItem` type.
  message_action_item : ClientShowMessageActionItemOptions?
}

///|
pub impl @json.ToJson for ShowMessageRequestClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.message_action_item {
    Some(v) => obj.set("messageActionItem", v.to_json())
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ShowMessageRequestClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ShowMessageRequestClientCapabilities")
  }
  let message_action_item : ClientShowMessageActionItemOptions? = match obj.get("messageActionItem") {
    Some(v) if not(v.is_null()) => Some(ClientShowMessageActionItemOptions::from_json(v))
    _ => None
  }
  ShowMessageRequestClientCapabilities::{ message_action_item }
}

///| Client capabilities for the showDocument request.
pub struct ShowDocumentClientCapabilities {
  ///| The client has support for the showDocument
  support : Bool
}

///|
pub impl @json.ToJson for ShowDocumentClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("support", @json.JsonValue::Bool(self.support))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ShowDocumentClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ShowDocumentClientCapabilities")
  }
  let support = match obj.get("support") {
    Some(v) => match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") }
    None => raise @json.JsonError("missing support")
  }
  ShowDocumentClientCapabilities::{ support }
}

///| @since 3.18.0
pub struct StaleRequestSupportOptions {
  ///| The client will actively cancel the request.
  cancel : Bool
  ///| The list of requests for which the client
  retry_on_content_modified : Array[String]
}

///|
pub impl @json.ToJson for StaleRequestSupportOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("cancel", @json.JsonValue::Bool(self.cancel))
  obj.set("retryOnContentModified", @json.JsonValue::Array(self.retry_on_content_modified.map(fn(item) { @json.JsonValue::String(item) })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for StaleRequestSupportOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for StaleRequestSupportOptions")
  }
  let cancel = match obj.get("cancel") {
    Some(v) => match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") }
    None => raise @json.JsonError("missing cancel")
  }
  let retry_on_content_modified = match obj.get("retryOnContentModified") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] }
    None => raise @json.JsonError("missing retryOnContentModified")
  }
  StaleRequestSupportOptions::{ cancel, retry_on_content_modified }
}

///| Client capabilities specific to regular expressions.
pub struct RegularExpressionsClientCapabilities {
  ///| The engine's name.
  engine : RegularExpressionEngineKind
  ///| The engine's version.
  version : String?
}

///|
pub impl @json.ToJson for RegularExpressionsClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("engine", @json.JsonValue::String(self.engine))
  match self.version {
    Some(v) => obj.set("version", @json.JsonValue::String(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for RegularExpressionsClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for RegularExpressionsClientCapabilities")
  }
  let engine = match obj.get("engine") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing engine")
  }
  let version : String? = match obj.get("version") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  RegularExpressionsClientCapabilities::{ engine, version }
}

///| Client capabilities specific to the used markdown parser.
pub struct MarkdownClientCapabilities {
  ///| The name of the parser.
  parser : String
  ///| The version of the parser.
  version : String?
  ///| A list of HTML tags that the client allows / supports in
  allowed_tags : Array[String]?
}

///|
pub impl @json.ToJson for MarkdownClientCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("parser", @json.JsonValue::String(self.parser))
  match self.version {
    Some(v) => obj.set("version", @json.JsonValue::String(v))
    None => ()
  }
  match self.allowed_tags {
    Some(v) => obj.set("allowedTags", @json.JsonValue::Array(v.map(fn(item) { @json.JsonValue::String(item) })))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for MarkdownClientCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for MarkdownClientCapabilities")
  }
  let parser = match obj.get("parser") {
    Some(v) => match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }
    None => raise @json.JsonError("missing parser")
  }
  let version : String? = match obj.get("version") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })
    _ => None
  }
  let allowed_tags : Array[String]? = match obj.get("allowedTags") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] })
    _ => None
  }
  MarkdownClientCapabilities::{ parser, version, allowed_tags }
}

///| @since 3.18.0
pub struct ChangeAnnotationsSupportOptions {
  ///| Whether the client groups edits with equal labels into tree nodes,
  groups_on_label : Bool?
}

///|
pub impl @json.ToJson for ChangeAnnotationsSupportOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.groups_on_label {
    Some(v) => obj.set("groupsOnLabel", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ChangeAnnotationsSupportOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ChangeAnnotationsSupportOptions")
  }
  let groups_on_label : Bool? = match obj.get("groupsOnLabel") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  ChangeAnnotationsSupportOptions::{ groups_on_label }
}

///| @since 3.18.0
pub struct ClientSymbolKindOptions {
  ///| The symbol kind values the client supports. When this
  value_set : Array[SymbolKind]?
}

///|
pub impl @json.ToJson for ClientSymbolKindOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.value_set {
    Some(v) => obj.set("valueSet", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ClientSymbolKindOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ClientSymbolKindOptions")
  }
  let value_set : Array[SymbolKind]? = match obj.get("valueSet") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { SymbolKind::from_json(item) }); _ => [] })
    _ => None
  }
  ClientSymbolKindOptions::{ value_set }
}

///| @since 3.18.0
pub struct ClientSymbolTagOptions {
  ///| The tags supported by the client.
  value_set : Array[SymbolTag]
}

///|
pub impl @json.ToJson for ClientSymbolTagOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("valueSet", @json.JsonValue::Array(self.value_set.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ClientSymbolTagOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ClientSymbolTagOptions")
  }
  let value_set = match obj.get("valueSet") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { SymbolTag::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing valueSet")
  }
  ClientSymbolTagOptions::{ value_set }
}

///| @since 3.18.0
pub struct ClientSymbolResolveOptions {
  ///| The properties that a client can resolve lazily. Usually
  properties : Array[String]
}

///|
pub impl @json.ToJson for ClientSymbolResolveOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("properties", @json.JsonValue::Array(self.properties.map(fn(item) { @json.JsonValue::String(item) })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ClientSymbolResolveOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ClientSymbolResolveOptions")
  }
  let properties = match obj.get("properties") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] }
    None => raise @json.JsonError("missing properties")
  }
  ClientSymbolResolveOptions::{ properties }
}

///| @since 3.18.0
pub struct ClientCompletionItemOptions {
  ///| Client supports snippets as insert text.
  snippet_support : Bool?
  ///| Client supports commit characters on a completion item.
  commit_characters_support : Bool?
  ///| Client supports the following content formats for the documentation
  documentation_format : Array[MarkupKind]?
  ///| Client supports the deprecated property on a completion item.
  deprecated_support : Bool?
  ///| Client supports the preselect property on a completion item.
  preselect_support : Bool?
  ///| Client supports the tag property on a completion item. Clients supporting
  tag_support : CompletionItemTagOptions?
  ///| Client support insert replace edit to control different behavior if a
  insert_replace_support : Bool?
  ///| Indicates which properties a client can resolve lazily on a completion
  resolve_support : ClientCompletionItemResolveOptions?
  ///| The client supports the `insertTextMode` property on
  insert_text_mode_support : ClientCompletionItemInsertTextModeOptions?
  ///| The client has support for completion item label
  label_details_support : Bool?
}

///|
pub impl @json.ToJson for ClientCompletionItemOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.snippet_support {
    Some(v) => obj.set("snippetSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.commit_characters_support {
    Some(v) => obj.set("commitCharactersSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.documentation_format {
    Some(v) => obj.set("documentationFormat", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  match self.deprecated_support {
    Some(v) => obj.set("deprecatedSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.preselect_support {
    Some(v) => obj.set("preselectSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.tag_support {
    Some(v) => obj.set("tagSupport", v.to_json())
    None => ()
  }
  match self.insert_replace_support {
    Some(v) => obj.set("insertReplaceSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.resolve_support {
    Some(v) => obj.set("resolveSupport", v.to_json())
    None => ()
  }
  match self.insert_text_mode_support {
    Some(v) => obj.set("insertTextModeSupport", v.to_json())
    None => ()
  }
  match self.label_details_support {
    Some(v) => obj.set("labelDetailsSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ClientCompletionItemOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ClientCompletionItemOptions")
  }
  let snippet_support : Bool? = match obj.get("snippetSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let commit_characters_support : Bool? = match obj.get("commitCharactersSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let documentation_format : Array[MarkupKind]? = match obj.get("documentationFormat") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { MarkupKind::from_json(item) }); _ => [] })
    _ => None
  }
  let deprecated_support : Bool? = match obj.get("deprecatedSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let preselect_support : Bool? = match obj.get("preselectSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let tag_support : CompletionItemTagOptions? = match obj.get("tagSupport") {
    Some(v) if not(v.is_null()) => Some(CompletionItemTagOptions::from_json(v))
    _ => None
  }
  let insert_replace_support : Bool? = match obj.get("insertReplaceSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let resolve_support : ClientCompletionItemResolveOptions? = match obj.get("resolveSupport") {
    Some(v) if not(v.is_null()) => Some(ClientCompletionItemResolveOptions::from_json(v))
    _ => None
  }
  let insert_text_mode_support : ClientCompletionItemInsertTextModeOptions? = match obj.get("insertTextModeSupport") {
    Some(v) if not(v.is_null()) => Some(ClientCompletionItemInsertTextModeOptions::from_json(v))
    _ => None
  }
  let label_details_support : Bool? = match obj.get("labelDetailsSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  ClientCompletionItemOptions::{ snippet_support, commit_characters_support, documentation_format, deprecated_support, preselect_support, tag_support, insert_replace_support, resolve_support, insert_text_mode_support, label_details_support }
}

///| @since 3.18.0
pub struct ClientCompletionItemOptionsKind {
  ///| The completion item kind values the client supports. When this
  value_set : Array[CompletionItemKind]?
}

///|
pub impl @json.ToJson for ClientCompletionItemOptionsKind with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.value_set {
    Some(v) => obj.set("valueSet", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ClientCompletionItemOptionsKind with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ClientCompletionItemOptionsKind")
  }
  let value_set : Array[CompletionItemKind]? = match obj.get("valueSet") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { CompletionItemKind::from_json(item) }); _ => [] })
    _ => None
  }
  ClientCompletionItemOptionsKind::{ value_set }
}

///| The client supports the following `CompletionList` specific
pub struct CompletionListCapabilities {
  ///| The client supports the following itemDefaults on
  item_defaults : Array[String]?
  ///| Specifies whether the client supports `CompletionList.applyKind` to
  apply_kind_support : Bool?
}

///|
pub impl @json.ToJson for CompletionListCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.item_defaults {
    Some(v) => obj.set("itemDefaults", @json.JsonValue::Array(v.map(fn(item) { @json.JsonValue::String(item) })))
    None => ()
  }
  match self.apply_kind_support {
    Some(v) => obj.set("applyKindSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CompletionListCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CompletionListCapabilities")
  }
  let item_defaults : Array[String]? = match obj.get("itemDefaults") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] })
    _ => None
  }
  let apply_kind_support : Bool? = match obj.get("applyKindSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  CompletionListCapabilities::{ item_defaults, apply_kind_support }
}

///| @since 3.18.0
pub struct ClientSignatureInformationOptions {
  ///| Client supports the following content formats for the documentation
  documentation_format : Array[MarkupKind]?
  ///| Client capabilities specific to parameter information.
  parameter_information : ClientSignatureParameterInformationOptions?
  ///| The client supports the `activeParameter` property on `SignatureInformation`
  active_parameter_support : Bool?
  ///| The client supports the `activeParameter` property on
  no_active_parameter_support : Bool?
}

///|
pub impl @json.ToJson for ClientSignatureInformationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.documentation_format {
    Some(v) => obj.set("documentationFormat", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  match self.parameter_information {
    Some(v) => obj.set("parameterInformation", v.to_json())
    None => ()
  }
  match self.active_parameter_support {
    Some(v) => obj.set("activeParameterSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.no_active_parameter_support {
    Some(v) => obj.set("noActiveParameterSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ClientSignatureInformationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ClientSignatureInformationOptions")
  }
  let documentation_format : Array[MarkupKind]? = match obj.get("documentationFormat") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { MarkupKind::from_json(item) }); _ => [] })
    _ => None
  }
  let parameter_information : ClientSignatureParameterInformationOptions? = match obj.get("parameterInformation") {
    Some(v) if not(v.is_null()) => Some(ClientSignatureParameterInformationOptions::from_json(v))
    _ => None
  }
  let active_parameter_support : Bool? = match obj.get("activeParameterSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let no_active_parameter_support : Bool? = match obj.get("noActiveParameterSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  ClientSignatureInformationOptions::{ documentation_format, parameter_information, active_parameter_support, no_active_parameter_support }
}

///| @since 3.18.0
pub struct ClientCodeActionLiteralOptions {
  ///| The code action kind is support with the following value
  code_action_kind : ClientCodeActionKindOptions
}

///|
pub impl @json.ToJson for ClientCodeActionLiteralOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("codeActionKind", self.code_action_kind.to_json())
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ClientCodeActionLiteralOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ClientCodeActionLiteralOptions")
  }
  let code_action_kind = match obj.get("codeActionKind") {
    Some(v) => ClientCodeActionKindOptions::from_json(v)
    None => raise @json.JsonError("missing codeActionKind")
  }
  ClientCodeActionLiteralOptions::{ code_action_kind }
}

///| @since 3.18.0
pub struct ClientCodeActionResolveOptions {
  ///| The properties that a client can resolve lazily.
  properties : Array[String]
}

///|
pub impl @json.ToJson for ClientCodeActionResolveOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("properties", @json.JsonValue::Array(self.properties.map(fn(item) { @json.JsonValue::String(item) })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ClientCodeActionResolveOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ClientCodeActionResolveOptions")
  }
  let properties = match obj.get("properties") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] }
    None => raise @json.JsonError("missing properties")
  }
  ClientCodeActionResolveOptions::{ properties }
}

///| @since 3.18.0 - proposed
pub struct CodeActionTagOptions {
  ///| The tags supported by the client.
  value_set : Array[CodeActionTag]
}

///|
pub impl @json.ToJson for CodeActionTagOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("valueSet", @json.JsonValue::Array(self.value_set.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CodeActionTagOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CodeActionTagOptions")
  }
  let value_set = match obj.get("valueSet") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { CodeActionTag::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing valueSet")
  }
  CodeActionTagOptions::{ value_set }
}

///| @since 3.18.0
pub struct ClientCodeLensResolveOptions {
  ///| The properties that a client can resolve lazily.
  properties : Array[String]
}

///|
pub impl @json.ToJson for ClientCodeLensResolveOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("properties", @json.JsonValue::Array(self.properties.map(fn(item) { @json.JsonValue::String(item) })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ClientCodeLensResolveOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ClientCodeLensResolveOptions")
  }
  let properties = match obj.get("properties") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] }
    None => raise @json.JsonError("missing properties")
  }
  ClientCodeLensResolveOptions::{ properties }
}

///| @since 3.18.0
pub struct ClientFoldingRangeKindOptions {
  ///| The folding range kind values the client supports. When this
  value_set : Array[FoldingRangeKind]?
}

///|
pub impl @json.ToJson for ClientFoldingRangeKindOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.value_set {
    Some(v) => obj.set("valueSet", @json.JsonValue::Array(v.map(fn(item) { item.to_json() })))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ClientFoldingRangeKindOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ClientFoldingRangeKindOptions")
  }
  let value_set : Array[FoldingRangeKind]? = match obj.get("valueSet") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Array(items) => items.map(fn(item) { FoldingRangeKind::from_json(item) }); _ => [] })
    _ => None
  }
  ClientFoldingRangeKindOptions::{ value_set }
}

///| @since 3.18.0
pub struct ClientFoldingRangeOptions {
  ///| If set, the client signals that it supports setting collapsedText on
  collapsed_text : Bool?
}

///|
pub impl @json.ToJson for ClientFoldingRangeOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.collapsed_text {
    Some(v) => obj.set("collapsedText", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ClientFoldingRangeOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ClientFoldingRangeOptions")
  }
  let collapsed_text : Bool? = match obj.get("collapsedText") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  ClientFoldingRangeOptions::{ collapsed_text }
}

///| General diagnostics capabilities for pull and push model.
pub struct DiagnosticsCapabilities {
  ///| Whether the clients accepts diagnostics with related information.
  related_information : Bool?
  ///| Client supports the tag property to provide meta data about a diagnostic.
  tag_support : ClientDiagnosticsTagOptions?
  ///| Client supports a codeDescription property
  code_description_support : Bool?
  ///| Whether code action supports the `data` property which is
  data_support : Bool?
}

///|
pub impl @json.ToJson for DiagnosticsCapabilities with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.related_information {
    Some(v) => obj.set("relatedInformation", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.tag_support {
    Some(v) => obj.set("tagSupport", v.to_json())
    None => ()
  }
  match self.code_description_support {
    Some(v) => obj.set("codeDescriptionSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  match self.data_support {
    Some(v) => obj.set("dataSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for DiagnosticsCapabilities with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for DiagnosticsCapabilities")
  }
  let related_information : Bool? = match obj.get("relatedInformation") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let tag_support : ClientDiagnosticsTagOptions? = match obj.get("tagSupport") {
    Some(v) if not(v.is_null()) => Some(ClientDiagnosticsTagOptions::from_json(v))
    _ => None
  }
  let code_description_support : Bool? = match obj.get("codeDescriptionSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  let data_support : Bool? = match obj.get("dataSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  DiagnosticsCapabilities::{ related_information, tag_support, code_description_support, data_support }
}

///| @since 3.18.0
pub struct ClientSemanticTokensRequestOptions {
  ///| The client will send the `textDocument/semanticTokens/range` request if
  range : @json.JsonValue?
  ///| The client will send the `textDocument/semanticTokens/full` request if
  full : @json.JsonValue?
}

///|
pub impl @json.ToJson for ClientSemanticTokensRequestOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.range {
    Some(v) => obj.set("range", v)
    None => ()
  }
  match self.full {
    Some(v) => obj.set("full", v)
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ClientSemanticTokensRequestOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ClientSemanticTokensRequestOptions")
  }
  let range : @json.JsonValue? = obj.get("range")
  let full : @json.JsonValue? = obj.get("full")
  ClientSemanticTokensRequestOptions::{ range, full }
}

///| @since 3.18.0
pub struct ClientInlayHintResolveOptions {
  ///| The properties that a client can resolve lazily.
  properties : Array[String]
}

///|
pub impl @json.ToJson for ClientInlayHintResolveOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("properties", @json.JsonValue::Array(self.properties.map(fn(item) { @json.JsonValue::String(item) })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ClientInlayHintResolveOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ClientInlayHintResolveOptions")
  }
  let properties = match obj.get("properties") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] }
    None => raise @json.JsonError("missing properties")
  }
  ClientInlayHintResolveOptions::{ properties }
}

///| @since 3.18.0
pub struct ClientShowMessageActionItemOptions {
  ///| Whether the client supports additional attributes which
  additional_properties_support : Bool?
}

///|
pub impl @json.ToJson for ClientShowMessageActionItemOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.additional_properties_support {
    Some(v) => obj.set("additionalPropertiesSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ClientShowMessageActionItemOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ClientShowMessageActionItemOptions")
  }
  let additional_properties_support : Bool? = match obj.get("additionalPropertiesSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  ClientShowMessageActionItemOptions::{ additional_properties_support }
}

///| @since 3.18.0
pub struct CompletionItemTagOptions {
  ///| The tags supported by the client.
  value_set : Array[CompletionItemTag]
}

///|
pub impl @json.ToJson for CompletionItemTagOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("valueSet", @json.JsonValue::Array(self.value_set.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for CompletionItemTagOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for CompletionItemTagOptions")
  }
  let value_set = match obj.get("valueSet") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { CompletionItemTag::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing valueSet")
  }
  CompletionItemTagOptions::{ value_set }
}

///| @since 3.18.0
pub struct ClientCompletionItemResolveOptions {
  ///| The properties that a client can resolve lazily.
  properties : Array[String]
}

///|
pub impl @json.ToJson for ClientCompletionItemResolveOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("properties", @json.JsonValue::Array(self.properties.map(fn(item) { @json.JsonValue::String(item) })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ClientCompletionItemResolveOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ClientCompletionItemResolveOptions")
  }
  let properties = match obj.get("properties") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] }
    None => raise @json.JsonError("missing properties")
  }
  ClientCompletionItemResolveOptions::{ properties }
}

///| @since 3.18.0
pub struct ClientCompletionItemInsertTextModeOptions {
  value_set : Array[InsertTextMode]
}

///|
pub impl @json.ToJson for ClientCompletionItemInsertTextModeOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("valueSet", @json.JsonValue::Array(self.value_set.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ClientCompletionItemInsertTextModeOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ClientCompletionItemInsertTextModeOptions")
  }
  let value_set = match obj.get("valueSet") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { InsertTextMode::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing valueSet")
  }
  ClientCompletionItemInsertTextModeOptions::{ value_set }
}

///| @since 3.18.0
pub struct ClientSignatureParameterInformationOptions {
  ///| The client supports processing label offsets instead of a
  label_offset_support : Bool?
}

///|
pub impl @json.ToJson for ClientSignatureParameterInformationOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.label_offset_support {
    Some(v) => obj.set("labelOffsetSupport", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ClientSignatureParameterInformationOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ClientSignatureParameterInformationOptions")
  }
  let label_offset_support : Bool? = match obj.get("labelOffsetSupport") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  ClientSignatureParameterInformationOptions::{ label_offset_support }
}

///| @since 3.18.0
pub struct ClientCodeActionKindOptions {
  ///| The code action kind values the client supports. When this
  value_set : Array[CodeActionKind]
}

///|
pub impl @json.ToJson for ClientCodeActionKindOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("valueSet", @json.JsonValue::Array(self.value_set.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ClientCodeActionKindOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ClientCodeActionKindOptions")
  }
  let value_set = match obj.get("valueSet") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { CodeActionKind::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing valueSet")
  }
  ClientCodeActionKindOptions::{ value_set }
}

///| @since 3.18.0
pub struct ClientDiagnosticsTagOptions {
  ///| The tags supported by the client.
  value_set : Array[DiagnosticTag]
}

///|
pub impl @json.ToJson for ClientDiagnosticsTagOptions with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  obj.set("valueSet", @json.JsonValue::Array(self.value_set.map(fn(item) { item.to_json() })))
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ClientDiagnosticsTagOptions with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ClientDiagnosticsTagOptions")
  }
  let value_set = match obj.get("valueSet") {
    Some(v) => match v { @json.JsonValue::Array(items) => items.map(fn(item) { DiagnosticTag::from_json(item) }); _ => [] }
    None => raise @json.JsonError("missing valueSet")
  }
  ClientDiagnosticsTagOptions::{ value_set }
}

///| @since 3.18.0
pub struct ClientSemanticTokensRequestFullDelta {
  ///| The client will send the `textDocument/semanticTokens/full/delta` request if
  delta : Bool?
}

///|
pub impl @json.ToJson for ClientSemanticTokensRequestFullDelta with to_json(self) {
  let obj : Map[String, @json.JsonValue] = {}
  match self.delta {
    Some(v) => obj.set("delta", @json.JsonValue::Bool(v))
    None => ()
  }
  @json.JsonValue::Object(obj)
}

///|
pub impl @json.FromJson for ClientSemanticTokensRequestFullDelta with from_json(json) {
  let obj = match json {
    @json.JsonValue::Object(o) => o
    _ => raise @json.JsonError("expected object for ClientSemanticTokensRequestFullDelta")
  }
  let delta : Bool? = match obj.get("delta") {
    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") })
    _ => None
  }
  ClientSemanticTokensRequestFullDelta::{ delta }
}

// ============ Type Aliases ============

///| The definition of a symbol represented as one or many {@link Location locations}.
pub type Definition = @json.JsonValue

///| Information about where a symbol is defined.
pub type DefinitionLink = LocationLink

///| LSP arrays.
pub type LSPArray = Array[LSPAny]

///| The LSP any type.
pub type LSPAny = @json.JsonValue

///| The declaration of a symbol representation as one or many {@link Location locations}.
pub type Declaration = @json.JsonValue

///| Information about where a symbol is declared.
pub type DeclarationLink = LocationLink

///| Inline value information can be provided by different means:
pub type InlineValue = @json.JsonValue

///| The result of a document diagnostic pull request. A report can
pub type DocumentDiagnosticReport = @json.JsonValue

pub type PrepareRenameResult = @json.JsonValue

///| A document selector is the combination of one or many document filters.
pub type DocumentSelector = Array[DocumentFilter]

pub type ProgressToken = @json.JsonValue

///| An identifier to refer to a change annotation stored with a workspace edit.
pub type ChangeAnnotationIdentifier = String

///| A workspace diagnostic document report.
pub type WorkspaceDocumentDiagnosticReport = @json.JsonValue

///| An event describing a change to a text document. If only a text is provided
pub type TextDocumentContentChangeEvent = @json.JsonValue

///| MarkedString can be used to render human readable text. It is either a markdown string
pub type MarkedString = @json.JsonValue

///| A document filter describes a top level text document or
pub type DocumentFilter = @json.JsonValue

///| LSP object definition.
pub type LSPObject = @json.JsonValue

///| The glob pattern. Either a string pattern or a relative pattern.
pub type GlobPattern = @json.JsonValue

///| A document filter denotes a document by different properties like
pub type TextDocumentFilter = @json.JsonValue

///| A notebook document filter denotes a notebook document by
pub type NotebookDocumentFilter = @json.JsonValue

///| The glob pattern to watch relative to the base path. Glob patterns can have the following syntax:
pub type Pattern = String

pub type RegularExpressionEngineKind = String
