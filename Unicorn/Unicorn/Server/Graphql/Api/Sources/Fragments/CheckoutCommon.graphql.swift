// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct CheckoutCommon: AppSchema.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment CheckoutCommon on Checkout { __typename id webUrl lineItems(first: 5) { __typename edges { __typename node { __typename id title quantity } } } currencyCode paymentDueV2 { __typename amount currencyCode } subtotalPriceV2 { __typename amount currencyCode } totalPriceV2 { __typename amount currencyCode } totalTaxV2 { __typename amount currencyCode } totalDuties { __typename amount currencyCode } lineItemsSubtotalPrice { __typename amount currencyCode } taxExempt taxesIncluded }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Checkout }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", AppSchema.ID.self),
    .field("webUrl", AppSchema.URL.self),
    .field("lineItems", LineItems.self, arguments: ["first": 5]),
    .field("currencyCode", GraphQLEnum<AppSchema.CurrencyCode>.self),
    .field("paymentDueV2", PaymentDueV2.self),
    .field("subtotalPriceV2", SubtotalPriceV2.self),
    .field("totalPriceV2", TotalPriceV2.self),
    .field("totalTaxV2", TotalTaxV2.self),
    .field("totalDuties", TotalDuties?.self),
    .field("lineItemsSubtotalPrice", LineItemsSubtotalPrice.self),
    .field("taxExempt", Bool.self),
    .field("taxesIncluded", Bool.self),
  ] }

  /// A globally-unique ID.
  public var id: AppSchema.ID { __data["id"] }
  /// The url pointing to the checkout accessible from the web.
  public var webUrl: AppSchema.URL { __data["webUrl"] }
  /// A list of line item objects, each one containing information about an item in the checkout.
  public var lineItems: LineItems { __data["lineItems"] }
  /// The currency code for the checkout.
  public var currencyCode: GraphQLEnum<AppSchema.CurrencyCode> { __data["currencyCode"] }
  /// The amount left to be paid. This is equal to the cost of the line items, duties, taxes, and shipping, minus discounts and gift cards.
  @available(*, deprecated, message: "Use `paymentDue` instead.")
  public var paymentDueV2: PaymentDueV2 { __data["paymentDueV2"] }
  /// The price at checkout before duties, shipping, and taxes.
  @available(*, deprecated, message: "Use `subtotalPrice` instead.")
  public var subtotalPriceV2: SubtotalPriceV2 { __data["subtotalPriceV2"] }
  /// The sum of all the prices of all the items in the checkout, including taxes and duties.
  @available(*, deprecated, message: "Use `totalPrice` instead.")
  public var totalPriceV2: TotalPriceV2 { __data["totalPriceV2"] }
  /// The sum of all the taxes applied to the line items and shipping lines in the checkout.
  @available(*, deprecated, message: "Use `totalTax` instead.")
  public var totalTaxV2: TotalTaxV2 { __data["totalTaxV2"] }
  /// The sum of all the duties applied to the line items in the checkout.
  public var totalDuties: TotalDuties? { __data["totalDuties"] }
  /// The sum of all the prices of all the items in the checkout. Duties, taxes, shipping and discounts excluded.
  public var lineItemsSubtotalPrice: LineItemsSubtotalPrice { __data["lineItemsSubtotalPrice"] }
  /// Whether the checkout is tax exempt.
  public var taxExempt: Bool { __data["taxExempt"] }
  /// Whether taxes are included in the line item and shipping line prices.
  public var taxesIncluded: Bool { __data["taxesIncluded"] }

  /// LineItems
  ///
  /// Parent Type: `CheckoutLineItemConnection`
  public struct LineItems: AppSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.CheckoutLineItemConnection }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("edges", [Edge].self),
    ] }

    /// A list of edges.
    public var edges: [Edge] { __data["edges"] }

    /// LineItems.Edge
    ///
    /// Parent Type: `CheckoutLineItemEdge`
    public struct Edge: AppSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.CheckoutLineItemEdge }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("node", Node.self),
      ] }

      /// The item at the end of CheckoutLineItemEdge.
      public var node: Node { __data["node"] }

      /// LineItems.Edge.Node
      ///
      /// Parent Type: `CheckoutLineItem`
      public struct Node: AppSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.CheckoutLineItem }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", AppSchema.ID.self),
          .field("title", String.self),
          .field("quantity", Int.self),
        ] }

        /// A globally-unique ID.
        public var id: AppSchema.ID { __data["id"] }
        /// Title of the line item. Defaults to the product's title.
        public var title: String { __data["title"] }
        /// The quantity of the line item.
        public var quantity: Int { __data["quantity"] }
      }
    }
  }

  /// PaymentDueV2
  ///
  /// Parent Type: `MoneyV2`
  public struct PaymentDueV2: AppSchema.SelectionSet {
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

  /// SubtotalPriceV2
  ///
  /// Parent Type: `MoneyV2`
  public struct SubtotalPriceV2: AppSchema.SelectionSet {
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

  /// TotalPriceV2
  ///
  /// Parent Type: `MoneyV2`
  public struct TotalPriceV2: AppSchema.SelectionSet {
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

  /// TotalTaxV2
  ///
  /// Parent Type: `MoneyV2`
  public struct TotalTaxV2: AppSchema.SelectionSet {
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

  /// TotalDuties
  ///
  /// Parent Type: `MoneyV2`
  public struct TotalDuties: AppSchema.SelectionSet {
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

  /// LineItemsSubtotalPrice
  ///
  /// Parent Type: `MoneyV2`
  public struct LineItemsSubtotalPrice: AppSchema.SelectionSet {
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
