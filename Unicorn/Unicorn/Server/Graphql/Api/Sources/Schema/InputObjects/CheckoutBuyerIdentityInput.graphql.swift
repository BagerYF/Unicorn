// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields for the identity of the customer associated with the checkout.
public struct CheckoutBuyerIdentityInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    countryCode: GraphQLEnum<CountryCode>
  ) {
    __data = InputDict([
      "countryCode": countryCode
    ])
  }

  /// The country code of one of the shop's
  /// [enabled countries](https://help.shopify.com/en/manual/payments/shopify-payments/multi-currency/setup).
  /// For example, `CA`. Including this field creates a checkout in the specified country's currency.
  public var countryCode: GraphQLEnum<CountryCode> {
    get { __data["countryCode"] }
    set { __data["countryCode"] = newValue }
  }
}
