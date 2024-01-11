// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CheckoutShippingLinesQuery: GraphQLQuery {
  public static let operationName: String = "checkoutShippingLines"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query checkoutShippingLines($id: ID!) { node(id: $id) { __typename ... on Checkout { id webUrl availableShippingRates { __typename ready shippingRates { __typename handle priceV2 { __typename amount currencyCode } title } } } } }"#
    ))

  public var id: ID

  public init(id: ID) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: AppSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("node", Node?.self, arguments: ["id": .variable("id")]),
    ] }

    /// Returns a specific node by ID.
    public var node: Node? { __data["node"] }

    /// Node
    ///
    /// Parent Type: `Node`
    public struct Node: AppSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AppSchema.Interfaces.Node }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .inlineFragment(AsCheckout.self),
      ] }

      public var asCheckout: AsCheckout? { _asInlineFragment() }

      /// Node.AsCheckout
      ///
      /// Parent Type: `Checkout`
      public struct AsCheckout: AppSchema.InlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = CheckoutShippingLinesQuery.Data.Node
        public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Checkout }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("id", AppSchema.ID.self),
          .field("webUrl", AppSchema.URL.self),
          .field("availableShippingRates", AvailableShippingRates?.self),
        ] }

        /// A globally-unique ID.
        public var id: AppSchema.ID { __data["id"] }
        /// The url pointing to the checkout accessible from the web.
        public var webUrl: AppSchema.URL { __data["webUrl"] }
        /// The available shipping rates for this Checkout.
        /// Should only be used when checkout `requiresShipping` is `true` and
        /// the shipping address is valid.
        public var availableShippingRates: AvailableShippingRates? { __data["availableShippingRates"] }

        /// Node.AsCheckout.AvailableShippingRates
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

          /// Node.AsCheckout.AvailableShippingRates.ShippingRate
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

            /// Node.AsCheckout.AvailableShippingRates.ShippingRate.PriceV2
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
      }
    }
  }
}
