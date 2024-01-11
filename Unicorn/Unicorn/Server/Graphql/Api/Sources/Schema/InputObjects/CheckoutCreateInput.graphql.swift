// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields required to create a checkout.
public struct CheckoutCreateInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    email: GraphQLNullable<String> = nil,
    lineItems: GraphQLNullable<[CheckoutLineItemInput]> = nil,
    shippingAddress: GraphQLNullable<MailingAddressInput> = nil,
    note: GraphQLNullable<String> = nil,
    customAttributes: GraphQLNullable<[AttributeInput]> = nil,
    allowPartialAddresses: GraphQLNullable<Bool> = nil,
    buyerIdentity: GraphQLNullable<CheckoutBuyerIdentityInput> = nil
  ) {
    __data = InputDict([
      "email": email,
      "lineItems": lineItems,
      "shippingAddress": shippingAddress,
      "note": note,
      "customAttributes": customAttributes,
      "allowPartialAddresses": allowPartialAddresses,
      "buyerIdentity": buyerIdentity
    ])
  }

  /// The email with which the customer wants to checkout.
  public var email: GraphQLNullable<String> {
    get { __data["email"] }
    set { __data["email"] = newValue }
  }

  /// A list of line item objects, each one containing information about an item in the checkout.
  ///
  /// The input must not contain more than `250` values.
  public var lineItems: GraphQLNullable<[CheckoutLineItemInput]> {
    get { __data["lineItems"] }
    set { __data["lineItems"] = newValue }
  }

  /// The shipping address to where the line items will be shipped.
  public var shippingAddress: GraphQLNullable<MailingAddressInput> {
    get { __data["shippingAddress"] }
    set { __data["shippingAddress"] = newValue }
  }

  /// The text of an optional note that a shop owner can attach to the checkout.
  public var note: GraphQLNullable<String> {
    get { __data["note"] }
    set { __data["note"] = newValue }
  }

  /// A list of extra information that's added to the checkout.
  ///
  /// The input must not contain more than `250` values.
  public var customAttributes: GraphQLNullable<[AttributeInput]> {
    get { __data["customAttributes"] }
    set { __data["customAttributes"] = newValue }
  }

  /// Allows setting partial addresses on a Checkout, skipping the full validation of attributes.
  /// The required attributes are city, province, and country.
  /// Full validation of addresses is still done at completion time. Defaults to `null`.
  public var allowPartialAddresses: GraphQLNullable<Bool> {
    get { __data["allowPartialAddresses"] }
    set { __data["allowPartialAddresses"] = newValue }
  }

  /// The identity of the customer associated with the checkout.
  public var buyerIdentity: GraphQLNullable<CheckoutBuyerIdentityInput> {
    get { __data["buyerIdentity"] }
    set { __data["buyerIdentity"] = newValue }
  }
}
