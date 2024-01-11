// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields for a filter used to view a subset of products in a collection matching a specific price range.
public struct PriceRangeFilter: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    min: GraphQLNullable<Double> = nil,
    max: GraphQLNullable<Double> = nil
  ) {
    __data = InputDict([
      "min": min,
      "max": max
    ])
  }

  /// The minimum price in the range. Defaults to zero.
  public var min: GraphQLNullable<Double> {
    get { __data["min"] }
    set { __data["min"] = newValue }
  }

  /// The maximum price in the range. Empty indicates no max price.
  public var max: GraphQLNullable<Double> {
    get { __data["max"] }
    set { __data["max"] = newValue }
  }
}
