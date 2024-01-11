// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CheckoutCompleteWithCreditCardV2Mutation: GraphQLMutation {
  public static let operationName: String = "checkoutCompleteWithCreditCardV2"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation checkoutCompleteWithCreditCardV2($checkoutId: ID!, $payment: CreditCardPaymentInputV2!) { checkoutCompleteWithCreditCardV2(checkoutId: $checkoutId, payment: $payment) { __typename checkout { __typename ...CheckoutCommon availableShippingRates { __typename ready shippingRates { __typename handle priceV2 { __typename amount currencyCode } title } } shippingLine { __typename handle priceV2 { __typename amount currencyCode } title } } checkoutUserErrors { __typename code field message } payment { __typename id } } }"#,
      fragments: [CheckoutCommon.self]
    ))

  public var checkoutId: ID
  public var payment: CreditCardPaymentInputV2

  public init(
    checkoutId: ID,
    payment: CreditCardPaymentInputV2
  ) {
    self.checkoutId = checkoutId
    self.payment = payment
  }

  public var __variables: Variables? { [
    "checkoutId": checkoutId,
    "payment": payment
  ] }

  public struct Data: AppSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("checkoutCompleteWithCreditCardV2", CheckoutCompleteWithCreditCardV2?.self, arguments: [
        "checkoutId": .variable("checkoutId"),
        "payment": .variable("payment")
      ]),
    ] }

    /// Completes a checkout using a credit card token from Shopify's card vault. Before you can complete checkouts using CheckoutCompleteWithCreditCardV2, you need to  [_request payment processing_](https://shopify.dev/apps/channels/getting-started#request-payment-processing).
    public var checkoutCompleteWithCreditCardV2: CheckoutCompleteWithCreditCardV2? { __data["checkoutCompleteWithCreditCardV2"] }

    /// CheckoutCompleteWithCreditCardV2
    ///
    /// Parent Type: `CheckoutCompleteWithCreditCardV2Payload`
    public struct CheckoutCompleteWithCreditCardV2: AppSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.CheckoutCompleteWithCreditCardV2Payload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("checkout", Checkout?.self),
        .field("checkoutUserErrors", [CheckoutUserError].self),
        .field("payment", Payment?.self),
      ] }

      /// The checkout on which the payment was applied.
      public var checkout: Checkout? { __data["checkout"] }
      /// The list of errors that occurred from executing the mutation.
      public var checkoutUserErrors: [CheckoutUserError] { __data["checkoutUserErrors"] }
      /// A representation of the attempted payment.
      public var payment: Payment? { __data["payment"] }

      /// CheckoutCompleteWithCreditCardV2.Checkout
      ///
      /// Parent Type: `Checkout`
      public struct Checkout: AppSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Checkout }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("availableShippingRates", AvailableShippingRates?.self),
          .field("shippingLine", ShippingLine?.self),
          .fragment(CheckoutCommon.self),
        ] }

        /// The available shipping rates for this Checkout.
        /// Should only be used when checkout `requiresShipping` is `true` and
        /// the shipping address is valid.
        public var availableShippingRates: AvailableShippingRates? { __data["availableShippingRates"] }
        /// Once a shipping rate is selected by the customer it's transitioned to a `shipping_line` object.
        public var shippingLine: ShippingLine? { __data["shippingLine"] }
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

        /// CheckoutCompleteWithCreditCardV2.Checkout.AvailableShippingRates
        ///
        /// Parent Type: `AvailableShippingRates`
        public struct AvailableShippingRates: AppSchema.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.AvailableShippingRates }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("ready", Bool.self),
            .field("shippingRates", [ShippingRate]?.self),
          ] }

          /// Whether or not the shipping rates are ready.
          /// The `shippingRates` field is `null` when this value is `false`.
          /// This field should be polled until its value becomes `true`.
          public var ready: Bool { __data["ready"] }
          /// The fetched shipping rates. `null` until the `ready` field is `true`.
          public var shippingRates: [ShippingRate]? { __data["shippingRates"] }

          /// CheckoutCompleteWithCreditCardV2.Checkout.AvailableShippingRates.ShippingRate
          ///
          /// Parent Type: `ShippingRate`
          public struct ShippingRate: AppSchema.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.ShippingRate }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("handle", String.self),
              .field("priceV2", PriceV2.self),
              .field("title", String.self),
            ] }

            /// Human-readable unique identifier for this shipping rate.
            public var handle: String { __data["handle"] }
            /// Price of this shipping rate.
            @available(*, deprecated, message: "Use `price` instead.")
            public var priceV2: PriceV2 { __data["priceV2"] }
            /// Title of this shipping rate.
            public var title: String { __data["title"] }

            /// CheckoutCompleteWithCreditCardV2.Checkout.AvailableShippingRates.ShippingRate.PriceV2
            ///
            /// Parent Type: `MoneyV2`
            public struct PriceV2: AppSchema.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.MoneyV2 }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("amount", AppSchema.Decimal.self),
                .field("currencyCode", GraphQLEnum<AppSchema.CurrencyCode>.self),
              ] }

              /// Decimal money amount.
              public var amount: AppSchema.Decimal { __data["amount"] }
              /// Currency of the money.
              public var currencyCode: GraphQLEnum<AppSchema.CurrencyCode> { __data["currencyCode"] }
            }
          }
        }

        /// CheckoutCompleteWithCreditCardV2.Checkout.ShippingLine
        ///
        /// Parent Type: `ShippingRate`
        public struct ShippingLine: AppSchema.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.ShippingRate }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("handle", String.self),
            .field("priceV2", PriceV2.self),
            .field("title", String.self),
          ] }

          /// Human-readable unique identifier for this shipping rate.
          public var handle: String { __data["handle"] }
          /// Price of this shipping rate.
          @available(*, deprecated, message: "Use `price` instead.")
          public var priceV2: PriceV2 { __data["priceV2"] }
          /// Title of this shipping rate.
          public var title: String { __data["title"] }

          /// CheckoutCompleteWithCreditCardV2.Checkout.ShippingLine.PriceV2
          ///
          /// Parent Type: `MoneyV2`
          public struct PriceV2: AppSchema.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.MoneyV2 }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("amount", AppSchema.Decimal.self),
              .field("currencyCode", GraphQLEnum<AppSchema.CurrencyCode>.self),
            ] }

            /// Decimal money amount.
            public var amount: AppSchema.Decimal { __data["amount"] }
            /// Currency of the money.
            public var currencyCode: GraphQLEnum<AppSchema.CurrencyCode> { __data["currencyCode"] }
          }
        }
      }

      /// CheckoutCompleteWithCreditCardV2.CheckoutUserError
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

      /// CheckoutCompleteWithCreditCardV2.Payment
      ///
      /// Parent Type: `Payment`
      public struct Payment: AppSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Payment }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", AppSchema.ID.self),
        ] }

        /// A globally-unique ID.
        public var id: AppSchema.ID { __data["id"] }
      }
    }
  }
}
