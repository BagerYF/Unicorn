// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields for a filter used to view a subset of products in a collection matching a specific variant option.
public struct VariantOptionFilter: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    name: String,
    value: String
  ) {
    __data = InputDict([
      "name": name,
      "value": value
    ])
  }

  /// The name of the variant option to filter on.
  public var name: String {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }

  /// The value of the variant option to filter on.
  public var value: String {
    get { __data["value"] }
    set { __data["value"] = newValue }
  }
}
