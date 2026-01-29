/**
 * LSP Type Code Generator for MoonBit
 *
 * Generates MoonBit type definitions from LSP metaModel.json
 */

import * as fs from 'fs';
import * as path from 'path';

// Type definitions for metaModel.json
interface MetaModel {
  metaData: { version: string };
  requests: Request[];
  notifications: Notification[];
  structures: Structure[];
  enumerations: Enumeration[];
  typeAliases: TypeAlias[];
}

interface Request {
  method: string;
  typeName: string;
  params?: TypeRef;
  result?: TypeRef;
  documentation?: string;
}

interface Notification {
  method: string;
  typeName: string;
  params?: TypeRef;
  documentation?: string;
}

interface Structure {
  name: string;
  properties: Property[];
  extends?: TypeRef[];
  mixins?: TypeRef[];
  documentation?: string;
}

interface Property {
  name: string;
  type: TypeRef;
  optional?: boolean;
  documentation?: string;
}

interface Enumeration {
  name: string;
  type: TypeRef;
  values: EnumValue[];
  supportsCustomValues?: boolean;
  documentation?: string;
}

interface EnumValue {
  name: string;
  value: string | number;
  documentation?: string;
}

interface TypeAlias {
  name: string;
  type: TypeRef;
  documentation?: string;
}

type TypeRef =
  | { kind: 'base'; name: string }
  | { kind: 'reference'; name: string }
  | { kind: 'array'; element: TypeRef }
  | { kind: 'map'; key: TypeRef; value: TypeRef }
  | { kind: 'or'; items: TypeRef[] }
  | { kind: 'and'; items: TypeRef[] }
  | { kind: 'literal'; value: LiteralType }
  | { kind: 'stringLiteral'; value: string }
  | { kind: 'integerLiteral'; value: number }
  | { kind: 'booleanLiteral'; value: boolean }
  | { kind: 'tuple'; items: TypeRef[] };

interface LiteralType {
  properties: Property[];
}

// Types already manually defined in base.mbt and diagnostic.mbt - skip these
const SKIP_TYPES = new Set([
  // base.mbt
  'Position',
  'Range',
  'Location',
  'DocumentUri',
  'URI',
  'TextDocumentIdentifier',
  'TextDocumentItem',
  'VersionedTextDocumentIdentifier',
  'TextDocumentPositionParams',
  // diagnostic.mbt
  'DiagnosticSeverity',
  'DiagnosticTag',
  'DiagnosticRelatedInformation',
  'Diagnostic',
  'PublishDiagnosticsParams',
]);

// Type aliases that are simple String wrappers - treat as String for serialization
const STRING_ALIAS_TYPES = new Set([
  'ChangeAnnotationIdentifier',
  'Pattern',
  'RegularExpressionEngineKind',
]);

// MoonBit code generator
class MoonBitGenerator {
  private output: string[] = [];
  private generatedTypes: Set<string> = new Set();
  private model: MetaModel;
  private structureMap: Map<string, Structure> = new Map();

  constructor(model: MetaModel) {
    this.model = model;
    // Build structure lookup map
    for (const struct of model.structures) {
      this.structureMap.set(struct.name, struct);
    }
  }

  // Collect all properties including inherited ones
  private collectAllProperties(struct: Structure, visited: Set<string> = new Set()): Property[] {
    if (visited.has(struct.name)) {
      return []; // Avoid circular inheritance
    }
    visited.add(struct.name);

    const allProps: Property[] = [];
    const seenNames = new Set<string>();

    // First collect from extends (parent types)
    if (struct.extends) {
      for (const ext of struct.extends) {
        if (ext.kind === 'reference') {
          const parentStruct = this.structureMap.get(ext.name);
          if (parentStruct) {
            const parentProps = this.collectAllProperties(parentStruct, visited);
            for (const prop of parentProps) {
              if (!seenNames.has(prop.name)) {
                allProps.push(prop);
                seenNames.add(prop.name);
              }
            }
          }
        }
      }
    }

    // Then collect from mixins
    if (struct.mixins) {
      for (const mixin of struct.mixins) {
        if (mixin.kind === 'reference') {
          const mixinStruct = this.structureMap.get(mixin.name);
          if (mixinStruct) {
            const mixinProps = this.collectAllProperties(mixinStruct, visited);
            for (const prop of mixinProps) {
              if (!seenNames.has(prop.name)) {
                allProps.push(prop);
                seenNames.add(prop.name);
              }
            }
          }
        }
      }
    }

    // Finally add own properties (can override parent)
    for (const prop of struct.properties) {
      if (!seenNames.has(prop.name)) {
        allProps.push(prop);
        seenNames.add(prop.name);
      }
    }

    return allProps;
  }

  generate(): string {
    this.output = [];
    this.emit('///| LSP Types - Auto-generated from LSP metaModel.json');
    this.emit(`///| LSP Version: ${this.model.metaData.version}`);
    this.emit('');

    // Generate enumerations
    this.emit('// ============ Enumerations ============');
    this.emit('');
    for (const enumDef of this.model.enumerations) {
      this.generateEnumeration(enumDef);
    }

    // Generate structures
    this.emit('// ============ Structures ============');
    this.emit('');
    for (const struct of this.model.structures) {
      this.generateStructure(struct);
    }

    // Generate type aliases
    this.emit('// ============ Type Aliases ============');
    this.emit('');
    for (const alias of this.model.typeAliases) {
      this.generateTypeAlias(alias);
    }

    return this.output.join('\n');
  }

  private emit(line: string) {
    this.output.push(line);
  }

  private generateEnumeration(enumDef: Enumeration) {
    const name = this.sanitizeName(enumDef.name);
    if (this.generatedTypes.has(name)) return;
    if (SKIP_TYPES.has(name)) return;
    this.generatedTypes.add(name);

    if (enumDef.documentation) {
      this.emit(`///| ${this.formatDoc(enumDef.documentation)}`);
    }

    const baseType = this.resolveBaseType(enumDef.type);

    if (baseType === 'String') {
      // String enum - use enum with string values
      this.emit(`pub(all) enum ${name} {`);
      for (const val of enumDef.values) {
        const variantName = this.sanitizeEnumVariant(val.name);
        if (val.documentation) {
          this.emit(`  ///| ${this.formatDoc(val.documentation)}`);
        }
        this.emit(`  ${variantName}`);
      }
      this.emit('}');
      this.emit('');

      // Generate ToJson
      this.emit(`///|`);
      this.emit(`pub impl @json.ToJson for ${name} with to_json(self) {`);
      this.emit(`  let s = match self {`);
      for (const val of enumDef.values) {
        const variantName = this.sanitizeEnumVariant(val.name);
        this.emit(`    ${variantName} => "${val.value}"`);
      }
      this.emit(`  }`);
      this.emit(`  @json.JsonValue::String(s)`);
      this.emit('}');
      this.emit('');

      // Generate FromJson
      this.emit(`///|`);
      this.emit(`pub impl @json.FromJson for ${name} with from_json(json) {`);
      this.emit(`  match json {`);
      this.emit(`    @json.JsonValue::String(s) => {`);
      this.emit(`      match s {`);
      for (const val of enumDef.values) {
        const variantName = this.sanitizeEnumVariant(val.name);
        this.emit(`        "${val.value}" => ${variantName}`);
      }
      this.emit(`        _ => raise @json.JsonError("invalid ${name}")`);
      this.emit(`      }`);
      this.emit(`    }`);
      this.emit(`    _ => raise @json.JsonError("expected string for ${name}")`);
      this.emit(`  }`);
      this.emit('}');
    } else {
      // Integer enum
      this.emit(`pub(all) enum ${name} {`);
      for (const val of enumDef.values) {
        const variantName = this.sanitizeEnumVariant(val.name);
        if (val.documentation) {
          this.emit(`  ///| ${this.formatDoc(val.documentation)}`);
        }
        this.emit(`  ${variantName}  // ${val.value}`);
      }
      this.emit('}');
      this.emit('');

      // Generate ToJson
      this.emit(`///|`);
      this.emit(`pub impl @json.ToJson for ${name} with to_json(self) {`);
      this.emit(`  let n = match self {`);
      for (const val of enumDef.values) {
        const variantName = this.sanitizeEnumVariant(val.name);
        this.emit(`    ${variantName} => ${val.value}`);
      }
      this.emit(`  }`);
      this.emit(`  @json.JsonValue::Number(n.to_double())`);
      this.emit('}');
      this.emit('');

      // Generate FromJson
      this.emit(`///|`);
      this.emit(`pub impl @json.FromJson for ${name} with from_json(json) {`);
      this.emit(`  match json {`);
      this.emit(`    @json.JsonValue::Number(n) => {`);
      this.emit(`      match n.to_int() {`);
      for (const val of enumDef.values) {
        const variantName = this.sanitizeEnumVariant(val.name);
        this.emit(`        ${val.value} => ${variantName}`);
      }
      this.emit(`        _ => raise @json.JsonError("invalid ${name}")`);
      this.emit(`      }`);
      this.emit(`    }`);
      this.emit(`    _ => raise @json.JsonError("expected number for ${name}")`);
      this.emit(`  }`);
      this.emit('}');
    }
    this.emit('');
  }

  private generateStructure(struct: Structure) {
    const name = this.sanitizeName(struct.name);
    if (this.generatedTypes.has(name)) return;
    if (SKIP_TYPES.has(name)) return;
    this.generatedTypes.add(name);

    // Collect all properties including inherited ones
    const allProperties = this.collectAllProperties(struct);

    if (struct.documentation) {
      this.emit(`///| ${this.formatDoc(struct.documentation)}`);
    }

    // Add note about inheritance
    if (struct.extends && struct.extends.length > 0) {
      this.emit(`///| Extends: ${struct.extends.map(e => this.resolveTypeName(e)).join(', ')}`);
    }
    if (struct.mixins && struct.mixins.length > 0) {
      this.emit(`///| Mixins: ${struct.mixins.map(m => this.resolveTypeName(m)).join(', ')}`);
    }

    this.emit(`pub struct ${name} {`);
    for (const prop of allProperties) {
      const propName = this.sanitizeFieldName(prop.name);
      const propType = this.resolveType(prop.type, prop.optional);
      if (prop.documentation) {
        this.emit(`  ///| ${this.formatDoc(prop.documentation)}`);
      }
      this.emit(`  ${propName} : ${propType}`);
    }
    this.emit('}');
    this.emit('');

    // Generate ToJson
    this.emit(`///|`);
    this.emit(`pub impl @json.ToJson for ${name} with to_json(self) {`);
    this.emit(`  let obj : Map[String, @json.JsonValue] = {}`);
    for (const prop of allProperties) {
      const propName = this.sanitizeFieldName(prop.name);
      const jsonKey = prop.name;
      const toJsonExpr = this.generateToJsonExpr(prop.type, `self.${propName}`);
      if (prop.optional) {
        this.emit(`  match self.${propName} {`);
        this.emit(`    Some(v) => obj.set("${jsonKey}", ${this.generateToJsonExpr(prop.type, 'v')})`);
        this.emit(`    None => ()`);
        this.emit(`  }`);
      } else {
        this.emit(`  obj.set("${jsonKey}", ${toJsonExpr})`);
      }
    }
    this.emit(`  @json.JsonValue::Object(obj)`);
    this.emit('}');
    this.emit('');

    // Generate FromJson
    this.emit(`///|`);
    this.emit(`pub impl @json.FromJson for ${name} with from_json(json) {`);
    this.emit(`  let obj = match json {`);
    this.emit(`    @json.JsonValue::Object(o) => o`);
    this.emit(`    _ => raise @json.JsonError("expected object for ${name}")`);
    this.emit(`  }`);
    for (const prop of allProperties) {
      const propName = this.sanitizeFieldName(prop.name);
      const jsonKey = prop.name;
      const propType = this.resolveType(prop.type, false);

      if (prop.optional) {
        if (this.isBaseType(prop.type)) {
          this.emit(`  let ${propName} : ${propType}? = match obj.get("${jsonKey}") {`);
          this.emit(`    Some(v) if not(v.is_null()) => Some(${this.generateFromJsonExpr(prop.type, 'v')})`);
          this.emit(`    _ => None`);
          this.emit(`  }`);
        } else if (prop.type.kind === 'or' || prop.type.kind === 'and' || prop.type.kind === 'literal' || prop.type.kind === 'map') {
          // Complex types - just pass through as JsonValue
          this.emit(`  let ${propName} : @json.JsonValue? = obj.get("${jsonKey}")`);
        } else if (prop.type.kind === 'array') {
          // Handle optional arrays
          this.emit(`  let ${propName} : ${propType}? = match obj.get("${jsonKey}") {`);
          this.emit(`    Some(v) if not(v.is_null()) => Some(${this.generateFromJsonExpr(prop.type, 'v')})`);
          this.emit(`    _ => None`);
          this.emit(`  }`);
        } else if (prop.type.kind === 'reference') {
          // Check if it's a string alias type
          if (STRING_ALIAS_TYPES.has(prop.type.name)) {
            this.emit(`  let ${propName} : ${propType}? = match obj.get("${jsonKey}") {`);
            this.emit(`    Some(v) if not(v.is_null()) => Some(match v { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") })`);
            this.emit(`    _ => None`);
            this.emit(`  }`);
          } else {
            this.emit(`  let ${propName} : ${propType}? = match obj.get("${jsonKey}") {`);
            this.emit(`    Some(v) if not(v.is_null()) => Some(${propType}::from_json(v))`);
            this.emit(`    _ => None`);
            this.emit(`  }`);
          }
        } else {
          // Other types - just use as-is
          this.emit(`  let ${propName} : ${propType}? = match obj.get("${jsonKey}") {`);
          this.emit(`    Some(v) if not(v.is_null()) => Some(${this.generateFromJsonExpr(prop.type, 'v')})`);
          this.emit(`    _ => None`);
          this.emit(`  }`);
        }
      } else {
        if (this.isBaseType(prop.type)) {
          this.emit(`  let ${propName} = match obj.get("${jsonKey}") {`);
          this.emit(`    Some(v) => ${this.generateFromJsonExpr(prop.type, 'v')}`);
          this.emit(`    None => raise @json.JsonError("missing ${jsonKey}")`);
          this.emit(`  }`);
        } else if (prop.type.kind === 'or' || prop.type.kind === 'and' || prop.type.kind === 'literal' || prop.type.kind === 'map') {
          // Complex types - just pass through as JsonValue
          this.emit(`  let ${propName} = match obj.get("${jsonKey}") {`);
          this.emit(`    Some(v) => v`);
          this.emit(`    None => raise @json.JsonError("missing ${jsonKey}")`);
          this.emit(`  }`);
        } else if (prop.type.kind === 'array') {
          this.emit(`  let ${propName} = match obj.get("${jsonKey}") {`);
          this.emit(`    Some(v) => ${this.generateFromJsonExpr(prop.type, 'v')}`);
          this.emit(`    None => raise @json.JsonError("missing ${jsonKey}")`);
          this.emit(`  }`);
        } else if (prop.type.kind === 'reference') {
          // Handle reference types
          this.emit(`  let ${propName} = match obj.get("${jsonKey}") {`);
          this.emit(`    Some(v) => ${this.generateFromJsonExpr(prop.type, 'v')}`);
          this.emit(`    None => raise @json.JsonError("missing ${jsonKey}")`);
          this.emit(`  }`);
        } else {
          // Other types - use as-is
          this.emit(`  let ${propName} = match obj.get("${jsonKey}") {`);
          this.emit(`    Some(v) => ${this.generateFromJsonExpr(prop.type, 'v')}`);
          this.emit(`    None => raise @json.JsonError("missing ${jsonKey}")`);
          this.emit(`  }`);
        }
      }
    }
    const fields = allProperties.map(p => this.sanitizeFieldName(p.name)).join(', ');
    this.emit(`  ${name}::{ ${fields} }`);
    this.emit('}');
    this.emit('');
  }

  private generateTypeAlias(alias: TypeAlias) {
    const name = this.sanitizeName(alias.name);
    if (this.generatedTypes.has(name)) return;
    if (SKIP_TYPES.has(name)) return;
    this.generatedTypes.add(name);

    // Handle union types (or)
    if (alias.type.kind === 'or') {
      if (alias.documentation) {
        this.emit(`///| ${this.formatDoc(alias.documentation)}`);
      }
      // For union types, we use JsonValue as a catch-all
      this.emit(`pub type ${name} = @json.JsonValue`);
    } else if (alias.type.kind === 'reference') {
      if (alias.documentation) {
        this.emit(`///| ${this.formatDoc(alias.documentation)}`);
      }
      const target = this.resolveTypeName(alias.type);
      this.emit(`pub type ${name} = ${target}`);
    } else if (alias.type.kind === 'array') {
      if (alias.documentation) {
        this.emit(`///| ${this.formatDoc(alias.documentation)}`);
      }
      const elemType = this.resolveType(alias.type.element, false);
      this.emit(`pub type ${name} = Array[${elemType}]`);
    } else {
      // Other types
      if (alias.documentation) {
        this.emit(`///| ${this.formatDoc(alias.documentation)}`);
      }
      const target = this.resolveType(alias.type, false);
      this.emit(`pub type ${name} = ${target}`);
    }
    this.emit('');
  }

  private resolveType(typeRef: TypeRef, optional: boolean = false): string {
    let type = this.resolveTypeName(typeRef);
    if (optional) {
      type = `${type}?`;
    }
    return type;
  }

  private resolveTypeName(typeRef: TypeRef): string {
    switch (typeRef.kind) {
      case 'base':
        return this.resolveBaseType(typeRef);
      case 'reference':
        return this.sanitizeName(typeRef.name);
      case 'array':
        return `Array[${this.resolveTypeName(typeRef.element)}]`;
      case 'map':
        // Map types - use JsonValue since we can't easily serialize/deserialize
        return '@json.JsonValue';
      case 'or':
        // Union types - use JsonValue as catch-all
        return '@json.JsonValue';
      case 'and':
        // Intersection types - use JsonValue
        return '@json.JsonValue';
      case 'literal':
        // Literal object type - use JsonValue
        return '@json.JsonValue';
      case 'stringLiteral':
        return 'String';
      case 'integerLiteral':
        return 'Int';
      case 'booleanLiteral':
        return 'Bool';
      case 'tuple':
        // Tuples - use JsonValue for now
        return '@json.JsonValue';
      default:
        return '@json.JsonValue';
    }
  }

  private resolveBaseType(typeRef: { kind: 'base'; name: string }): string {
    switch (typeRef.name) {
      case 'string':
        return 'String';
      case 'integer':
      case 'uinteger':
        return 'Int';
      case 'decimal':
        return 'Double';
      case 'boolean':
        return 'Bool';
      case 'null':
        return 'Unit';
      case 'DocumentUri':
      case 'URI':
        return 'String';  // Use String directly, or DocumentUri if defined
      case 'RegExp':
        return 'String';
      default:
        return '@json.JsonValue';
    }
  }

  // Generate ToJson expression for a type
  private generateToJsonExpr(typeRef: TypeRef, varName: string): string {
    switch (typeRef.kind) {
      case 'base':
        return this.generateBaseToJson(typeRef, varName);
      case 'stringLiteral':
        return `@json.JsonValue::String(${varName})`;
      case 'integerLiteral':
        return `@json.JsonValue::Number(${varName}.to_double())`;
      case 'booleanLiteral':
        return `@json.JsonValue::Bool(${varName})`;
      case 'reference':
        // Check if it's a string alias type
        if (STRING_ALIAS_TYPES.has(typeRef.name)) {
          return `@json.JsonValue::String(${varName})`;
        }
        return `${varName}.to_json()`;
      case 'array':
        // Arrays need special handling for primitive element types
        if (this.isBaseType(typeRef.element)) {
          const elemExpr = this.generateBaseToJson(typeRef.element as any, 'item');
          return `@json.JsonValue::Array(${varName}.map(fn(item) { ${elemExpr} }))`;
        }
        return `@json.JsonValue::Array(${varName}.map(fn(item) { item.to_json() }))`;
      case 'or':
      case 'and':
      case 'literal':
      case 'map':
        return varName; // Already JsonValue
      default:
        return `${varName}.to_json()`;
    }
  }

  private generateBaseToJson(typeRef: { kind: 'base'; name: string }, varName: string): string {
    switch (typeRef.name) {
      case 'string':
      case 'DocumentUri':
      case 'URI':
      case 'RegExp':
        return `@json.JsonValue::String(${varName})`;
      case 'integer':
      case 'uinteger':
        return `@json.JsonValue::Number(${varName}.to_double())`;
      case 'decimal':
        return `@json.JsonValue::Number(${varName})`;
      case 'boolean':
        return `@json.JsonValue::Bool(${varName})`;
      default:
        return varName;
    }
  }

  // Generate FromJson expression for a type
  private generateFromJsonExpr(typeRef: TypeRef, varName: string): string {
    switch (typeRef.kind) {
      case 'base':
        return this.generateBaseFromJson(typeRef, varName);
      case 'stringLiteral':
        return `match ${varName} { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }`;
      case 'integerLiteral':
        return `match ${varName} { @json.JsonValue::Number(n) => n.to_int(); _ => raise @json.JsonError("expected number") }`;
      case 'booleanLiteral':
        return `match ${varName} { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") }`;
      case 'reference':
        // Check if it's a string alias type
        if (STRING_ALIAS_TYPES.has(typeRef.name)) {
          return `match ${varName} { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }`;
        }
        return `${this.sanitizeName(typeRef.name)}::from_json(${varName})`;
      case 'array':
        // Handle array specially
        return this.generateArrayFromJson(typeRef, varName);
      default:
        return varName; // Return as JsonValue
    }
  }

  private generateBaseFromJson(typeRef: { kind: 'base'; name: string }, varName: string): string {
    switch (typeRef.name) {
      case 'string':
      case 'DocumentUri':
      case 'URI':
      case 'RegExp':
        return `match ${varName} { @json.JsonValue::String(s) => s; _ => raise @json.JsonError("expected string") }`;
      case 'integer':
      case 'uinteger':
        return `match ${varName} { @json.JsonValue::Number(n) => n.to_int(); _ => raise @json.JsonError("expected number") }`;
      case 'decimal':
        return `match ${varName} { @json.JsonValue::Number(n) => n; _ => raise @json.JsonError("expected number") }`;
      case 'boolean':
        return `match ${varName} { @json.JsonValue::Bool(b) => b; _ => raise @json.JsonError("expected boolean") }`;
      default:
        return varName;
    }
  }

  private generateArrayFromJson(typeRef: { kind: 'array'; element: TypeRef }, varName: string): string {
    const elemType = this.resolveTypeName(typeRef.element);
    // For base types, generate inline parsing
    if (typeRef.element.kind === 'base') {
      switch ((typeRef.element as { kind: 'base'; name: string }).name) {
        case 'string':
          return `match ${varName} { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::String(s) => s; _ => "" } }); _ => [] }`;
        case 'integer':
        case 'uinteger':
          return `match ${varName} { @json.JsonValue::Array(items) => items.map(fn(item) { match item { @json.JsonValue::Number(n) => n.to_int(); _ => 0 } }); _ => [] }`;
        default:
          return varName;
      }
    }
    // For reference types, call from_json on each element
    if (typeRef.element.kind === 'reference') {
      return `match ${varName} { @json.JsonValue::Array(items) => items.map(fn(item) { ${elemType}::from_json(item) }); _ => [] }`;
    }
    // For complex/union types that resolve to JsonValue, extract array items
    if (elemType === '@json.JsonValue') {
      return `match ${varName} { @json.JsonValue::Array(items) => items; _ => [] }`;
    }
    // Other cases - return as JsonValue
    return varName;
  }

  // Check if type is a base/primitive type
  private isBaseType(typeRef: TypeRef): boolean {
    if (typeRef.kind === 'base') {
      return ['string', 'integer', 'uinteger', 'decimal', 'boolean', 'DocumentUri', 'URI', 'RegExp'].includes(typeRef.name);
    }
    // Also treat literal types as base types
    if (typeRef.kind === 'stringLiteral' || typeRef.kind === 'integerLiteral' || typeRef.kind === 'booleanLiteral') {
      return true;
    }
    return false;
  }

  private sanitizeName(name: string): string {
    // MoonBit type names must start with uppercase
    if (name.startsWith('_')) {
      name = name.substring(1);
    }
    return name.charAt(0).toUpperCase() + name.slice(1);
  }

  private sanitizeFieldName(name: string): string {
    // MoonBit field names should be snake_case
    // Convert camelCase to snake_case
    let result = name.replace(/([A-Z])/g, '_$1').toLowerCase();
    if (result.startsWith('_')) {
      result = result.substring(1);
    }
    // Handle reserved words
    const reserved = ['type', 'fn', 'let', 'match', 'if', 'else', 'for', 'while', 'struct', 'enum', 'pub', 'priv'];
    if (reserved.includes(result)) {
      result = result + '_';
    }
    return result;
  }

  private sanitizeEnumVariant(name: string): string {
    // MoonBit enum variants must start with uppercase
    let result = name.charAt(0).toUpperCase() + name.slice(1);
    // Replace invalid characters
    result = result.replace(/[^a-zA-Z0-9_]/g, '_');
    return result;
  }

  private formatDoc(doc: string): string {
    // Truncate and format documentation
    const firstLine = doc.split('\n')[0];
    return firstLine.substring(0, 100);
  }
}

// Main
async function main() {
  const metaModelPath = path.join(import.meta.dirname!, 'metaModel.json');
  const outputPath = path.join(import.meta.dirname!, '..', 'types', 'generated.mbt');

  console.log('Reading metaModel.json...');
  const metaModel: MetaModel = JSON.parse(fs.readFileSync(metaModelPath, 'utf-8'));

  console.log(`LSP Version: ${metaModel.metaData.version}`);
  console.log(`Structures: ${metaModel.structures.length}`);
  console.log(`Enumerations: ${metaModel.enumerations.length}`);
  console.log(`Type Aliases: ${metaModel.typeAliases.length}`);

  console.log('Generating MoonBit code...');
  const generator = new MoonBitGenerator(metaModel);
  const code = generator.generate();

  console.log(`Writing to ${outputPath}...`);
  fs.writeFileSync(outputPath, code);

  console.log('Done!');
}

main().catch(console.error);
