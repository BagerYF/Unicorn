// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CheckoutCreateMutation: GraphQLMutation {
  public static let operationName: String = "checkoutCreate"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation checkoutCreate($input: CheckoutCreateInput!) { checkoutCreate(input: $input) { __typename checkout { __typename ...CheckoutCommon } checkoutUserErrors { __typename code field message } queueToken } }"#,
      fragments: [CheckoutCommon.self]
    ))

  public var input: CheckoutCreateInput

  public init(input: CheckoutCreateInput) {
    self.input = input
  }

  public var __variables: Variables? { ["input": input] }

  public struct Data: AppSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("checkoutCreate", CheckoutCreate?.self, arguments: ["input": .variable("input")]),
    ] }

    /// Creates a new checkout.
    public var checkoutCreate: CheckoutCreate? { __data["checkoutCreate"] }

    /// CheckoutCreate
    ///
    /// Parent Type: `CheckoutCreatePayload`
    public struct CheckoutCreate: AppSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.CheckoutCreatePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("checkout", Checkout?.self),
        .field("checkoutUserErrors", [CheckoutUserError].self),
        .field("queueToken", String?.self),
      ] }

      /// The new checkout object.
      public var checkout: Checkout? { __data["checkout"] }
      /// The list of errors that occurred from executing the mutation.
      public var checkoutUserErrors: [CheckoutUserError] { __data["checkoutUserErrors"] }
      /// The checkout queue token. Available only to selected stores.
      public var queueToken: String? { __data["queueToken"] }

      /// CheckoutCreate.Checkout
      ///
      /// Parent Type: `Checkout`
      public struct Checkout: AppSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Checkout }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(CheckoutCommon.self),
        ] }

        /// A globally-unique ID.
        public var id: AppSchema.ID { __data["id"] }
        /// The url pointing to the checkout accessible from the web.
        public var webUrl: AppSchema.URL { __data["webUrl"] }
        /// A list of line item objects, each one containing information about an item in the checkout.
        public var lineItems: CheckoutCommon.LineItems { __data["lineItems"] }
        /// The currency code for the checkout.
        public var currencyCode: GraphQLEnum<AppSchema.CurrencyCode> { __data["currencyCode"] }
        /// The amount left to be paid. This is equal to the cost of the line items, duties, taxes, and shipping, minus discounts and gift cards.
        @available(*, deprecated, message: "Use `paymentDue` instead.")
        public var paymentDueV2: CheckoutCommon.PaymentDueV2 { __data["paymentDueV2"] }
        /// The price at checkout before duties, shipping, and taxes.
        @available(*, deprecated, message: "Use `subtotalPrice` instead.")
        public var subtotalPriceV2: CheckoutCommon.SubtotalPriceV2 { __data["subtotalPriceV2"] }
        /// The sum of all the prices of all the items in the checkout, including taxes and duties.
        @available(*, deprecated, message: "Use `totalPrice` instead.")
        public var totalPriceV2: CheckoutCommon.TotalPriceV2 { __data["totalPriceV2"] }
        /// The sum of all the taxes applied to the line items and shipping lines in the checkout.
        @available(*, deprecated, message: "Use `totalTax` instead.")
        public var totalTaxV2: CheckoutCommon.TotalTaxV2 { __data["totalTaxV2"] }
        /// The sum of all the duties applied to the line items in the checkout.
        public var totalDuties: CheckoutCommon.TotalDuties? { __data["totalDuties"] }
        /// The sum of all the prices of all the items in the checkout. Duties, taxes, shipping and discounts excluded.
        public var lineItemsSubtotalPrice: CheckoutCommon.LineItemsSubtotalPrice { __data["lineItemsSubtotalPrice"] }
        /// Whether the checkout is tax exempt.
        public var taxExempt: Bool { __data["taxExempt"] }
        /// Whether taxes are included in the line item and shipping line prices.
        public var taxesIncluded: Bool { __data["taxesIncluded"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var checkoutCommon: CheckoutCommon { _toFragment() }
        }
      }

      /// CheckoutCreate.CheckoutUserError
      ///
      /// Parent Type: `CheckoutUserError`
      public struct CheckoutUserError: AppSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.CheckoutUserError }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("code", GraphQLEnum<AppSchema.CheckoutErrorCode>?.self),
          .field("field", [String]?.self),
          .field("message", String.self),
        ] }

        /// The error code.
        public var code: GraphQLEnum<AppSchema.CheckoutErrorCode>? { __data["code"] }
        /// The path to the input field that caused the error.
        public var field: [String]? { __data["field"] }
        /// The error message.
        public var message: String { __data["message"] }
      }
    }
  }
}
