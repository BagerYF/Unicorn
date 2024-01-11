// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// A filter used to view a subset of products in a collection matching a specific metafield value.
///
/// Only the following metafield types are currently supported:
/// - `number_integer`
/// - `number_decimal`
/// - `single_line_text_field`
/// - `boolean` as of 2022-04.
public struct MetafieldFilter: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    namespace: String,
    key: String,
    value: String
  ) {
    __data = InputDict([
      "namespace": namespace,
      "key": key,
      "value": value
    ])
  }

  /// The namespace of the metafield to filter on.
  public var namespace: String {
    get { __data["namespace"] }
    set { __data["namespace"] = newValue }
  }

  /// The key of the metafield to filter on.
  public var key: String {
    get { __data["key"] }
    set { __data["key"] = newValue }
  }

  /// The value of the metafield.
  public var value: String {
    get { __data["value"] }
    set { __data["value"] = newValue }
  }
}
