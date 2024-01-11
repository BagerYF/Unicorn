// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct CartCommon: AppSchema.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment CartCommon on Cart { __typename id totalQuantity createdAt updatedAt lines(first: 10) { __typename edges { __typename node { __typename id quantity cost { __typename totalAmount { __typename amount currencyCode } subtotalAmount { __typename amount currencyCode } } merchandise { __typename ... on ProductVariant { id compareAtPrice { __typename amount currencyCode } title price { __typename amount currencyCode } quantityAvailable image { __typename id url } product { __typename title vendor productType } } } attributes { __typename key value } } } } attributes { __typename key value } cost { __typename totalAmount { __typename amount currencyCode } subtotalAmount { __typename amount currencyCode } totalTaxAmount { __typename amount currencyCode } totalDutyAmount { __typename amount currencyCode } } buyerIdentity { __typename email phone customer { __typename id } countryCode } }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Cart }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", AppSchema.ID.self),
    .field("totalQuantity", Int.self),
    .field("createdAt", AppSchema.DateTime.self),
    .field("updatedAt", AppSchema.DateTime.self),
    .field("lines", Lines.self, arguments: ["first": 10]),
    .field("attributes", [Attribute].self),
    .field("cost", Cost.self),
    .field("buyerIdentity", BuyerIdentity.self),
  ] }

  /// A globally-unique ID.
  public var id: AppSchema.ID { __data["id"] }
  /// The total number of items in the cart.
  public var totalQuantity: Int { __data["totalQuantity"] }
  /// The date and time when the cart was created.
  public var createdAt: AppSchema.DateTime { __data["createdAt"] }
  /// The date and time when the cart was updated.
  public var updatedAt: AppSchema.DateTime { __data["updatedAt"] }
  /// A list of lines containing information about the items the customer intends to purchase.
  public var lines: Lines { __data["lines"] }
  /// The attributes associated with the cart. Attributes are represented as key-value pairs.
  public var attributes: [Attribute] { __data["attributes"] }
  /// The estimated costs that the buyer will pay at checkout. The costs are subject to change and changes will be reflected at checkout. The `cost` field uses the `buyerIdentity` field to determine [international pricing](https://shopify.dev/custom-storefronts/internationalization/international-pricing).
  public var cost: Cost { __data["cost"] }
  /// Information about the buyer that's interacting with the cart.
  public var buyerIdentity: BuyerIdentity { __data["buyerIdentity"] }

  /// Lines
  ///
  /// Parent Type: `BaseCartLineConnection`
  public struct Lines: AppSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.BaseCartLineConnection }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("edges", [Edge].self),
    ] }

    /// A list of edges.
    public var edges: [Edge] { __data["edges"] }

    /// Lines.Edge
    ///
    /// Parent Type: `BaseCartLineEdge`
    public struct Edge: AppSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.BaseCartLineEdge }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("node", Node.self),
      ] }

      /// The item at the end of BaseCartLineEdge.
      public var node: Node { __data["node"] }

      /// Lines.Edge.Node
      ///
      /// Parent Type: `BaseCartLine`
      public struct Node: AppSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AppSchema.Interfaces.BaseCartLine }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", AppSchema.ID.self),
          .field("quantity", Int.self),
          .field("cost", Cost.self),
          .field("merchandise", Merchandise.self),
          .field("attributes", [Attribute].self),
        ] }

        /// A globally-unique ID.
        public var id: AppSchema.ID { __data["id"] }
        /// The quantity of the merchandise that the customer intends to purchase.
        public var quantity: Int { __data["quantity"] }
        /// The cost of the merchandise that the buyer will pay for at checkout. The costs are subject to change and changes will be reflected at checkout.
        public var cost: Cost { __data["cost"] }
        /// The merchandise that the buyer intends to purchase.
        public var merchandise: Merchandise { __data["merchandise"] }
        /// The attributes associated with the cart line. Attributes are represented as key-value pairs.
        public var attributes: [Attribute] { __data["attributes"] }

        /// Lines.Edge.Node.Cost
        ///
        /// Parent Type: `CartLineCost`
        public struct Cost: AppSchema.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.CartLineCost }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("totalAmount", TotalAmount.self),
            .field("subtotalAmount", SubtotalAmount.self),
          ] }

          /// The total cost of the merchandise line.
          public var totalAmount: TotalAmount { __data["totalAmount"] }
          /// The cost of the merchandise line before line-level discounts.
          public var subtotalAmount: SubtotalAmount { __data["subtotalAmount"] }

          /// Lines.Edge.Node.Cost.TotalAmount
          ///
          /// Parent Type: `MoneyV2`
          public struct TotalAmount: AppSchema.SelectionSet {
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

          /// Lines.Edge.Node.Cost.SubtotalAmount
          ///
          /// Parent Type: `MoneyV2`
          public struct SubtotalAmount: AppSchema.SelectionSet {
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

        /// Lines.Edge.Node.Merchandise
        ///
        /// Parent Type: `Merchandise`
        public struct Merchandise: AppSchema.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AppSchema.Unions.Merchandise }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .inlineFragment(AsProductVariant.self),
          ] }

          public var asProductVariant: AsProductVariant? { _asInlineFragment() }

          /// Lines.Edge.Node.Merchandise.AsProductVariant
          ///
          /// Parent Type: `ProductVariant`
          public struct AsProductVariant: AppSchema.InlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = CartCommon.Lines.Edge.Node.Merchandise
            public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.ProductVariant }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("id", AppSchema.ID.self),
              .field("compareAtPrice", CompareAtPrice?.self),
              .field("title", String.self),
              .field("price", Price.self),
              .field("quantityAvailable", Int?.self),
              .field("image", Image?.self),
              .field("product", Product.self),
            ] }

            /// A globally-unique ID.
            public var id: AppSchema.ID { __data["id"] }
            /// The compare at price of the variant. This can be used to mark a variant as on sale, when `compareAtPrice` is higher than `price`.
            public var compareAtPrice: CompareAtPrice? { __data["compareAtPrice"] }
            /// The product variant’s title.
            public var title: String { __data["title"] }
            /// The product variant’s price.
            public var price: Price { __data["price"] }
            /// The total sellable quantity of the variant for online sales channels.
            public var quantityAvailable: Int? { __data["quantityAvailable"] }
            /// Image associated with the product variant. This field falls back to the product image if no image is available.
            public var image: Image? { __data["image"] }
            /// The product object that the product variant belongs to.
            public var product: Product { __data["product"] }

            /// Lines.Edge.Node.Merchandise.AsProductVariant.CompareAtPrice
            ///
            /// Parent Type: `MoneyV2`
            public struct CompareAtPrice: AppSchema.SelectionSet {
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

            /// Lines.Edge.Node.Merchandise.AsProductVariant.Price
            ///
            /// Parent Type: `MoneyV2`
            public struct Price: AppSchema.SelectionSet {
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

            /// Lines.Edge.Node.Merchandise.AsProductVariant.Image
            ///
            /// Parent Type: `Image`
            public struct Image: AppSchema.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Image }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("id", AppSchema.ID?.self),
                .field("url", AppSchema.URL.self),
              ] }

              /// A unique ID for the image.
              public var id: AppSchema.ID? { __data["id"] }
              /// The location of the image as a URL.
              ///
              /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
              ///
              /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
              ///
              /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
              public var url: AppSchema.URL { __data["url"] }
            }

            /// Lines.Edge.Node.Merchandise.AsProductVariant.Product
            ///
            /// Parent Type: `Product`
            public struct Product: AppSchema.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Product }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("title", String.self),
                .field("vendor", String.self),
                .field("productType", String.self),
              ] }

              /// The product’s title.
              public var title: String { __data["title"] }
              /// The product’s vendor name.
              public var vendor: String { __data["vendor"] }
              /// A categorization that a product can be tagged with, commonly used for filtering and searching.
              public var productType: String { __data["productType"] }
            }
          }
        }

        /// Lines.Edge.Node.Attribute
        ///
        /// Parent Type: `Attribute`
        public struct Attribute: AppSchema.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Attribute }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("key", String.self),
            .field("value", String?.self),
          ] }

          /// Key or name of the attribute.
          public var key: String { __data["key"] }
          /// Value of the attribute.
          public var value: String? { __data["value"] }
        }
      }
    }
  }

  /// Attribute
  ///
  /// Parent Type: `Attribute`
  public struct Attribute: AppSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Attribute }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("key", String.self),
      .field("value", String?.self),
    ] }

    /// Key or name of the attribute.
    public var key: String { __data["key"] }
    /// Value of the attribute.
    public var value: String? { __data["value"] }
  }

  /// Cost
  ///
  /// Parent Type: `CartCost`
  public struct Cost: AppSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.CartCost }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("totalAmount", TotalAmount.self),
      .field("subtotalAmount", SubtotalAmount.self),
      .field("totalTaxAmount", TotalTaxAmount?.self),
      .field("totalDutyAmount", TotalDutyAmount?.self),
    ] }

    /// The total amount for the customer to pay.
    public var totalAmount: TotalAmount { __data["totalAmount"] }
    /// The amount, before taxes and cart-level discounts, for the customer to pay.
    public var subtotalAmount: SubtotalAmount { __data["subtotalAmount"] }
    /// The tax amount for the customer to pay at checkout.
    public var totalTaxAmount: TotalTaxAmount? { __data["totalTaxAmount"] }
    /// The duty amount for the customer to pay at checkout.
    public var totalDutyAmount: TotalDutyAmount? { __data["totalDutyAmount"] }

    /// Cost.TotalAmount
    ///
    /// Parent Type: `MoneyV2`
    public struct TotalAmount: AppSchema.SelectionSet {
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

    /// Cost.SubtotalAmount
    ///
    /// Parent Type: `MoneyV2`
    public struct SubtotalAmount: AppSchema.SelectionSet {
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

    /// Cost.TotalTaxAmount
    ///
    /// Parent Type: `MoneyV2`
    public struct TotalTaxAmount: AppSchema.SelectionSet {
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

    /// Cost.TotalDutyAmount
    ///
    /// Parent Type: `MoneyV2`
    public struct TotalDutyAmount: AppSchema.SelectionSet {
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

  /// BuyerIdentity
  ///
  /// Parent Type: `CartBuyerIdentity`
  public struct BuyerIdentity: AppSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.CartBuyerIdentity }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("email", String?.self),
      .field("phone", String?.self),
      .field("customer", Customer?.self),
      .field("countryCode", GraphQLEnum<AppSchema.CountryCode>?.self),
    ] }

    /// The email address of the buyer that's interacting with the cart.
    public var email: String? { __data["email"] }
    /// The phone number of the buyer that's interacting with the cart.
    public var phone: String? { __data["phone"] }
    /// The customer account associated with the cart.
    public var customer: Customer? { __data["customer"] }
    /// The country where the buyer is located.
    public var countryCode: GraphQLEnum<AppSchema.CountryCode>? { __data["countryCode"] }

    /// BuyerIdentity.Customer
    ///
    /// Parent Type: `Customer`
    public struct Customer: AppSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Customer }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", AppSchema.ID.self),
      ] }

      /// A unique ID for the customer.
      public var id: AppSchema.ID { __data["id"] }
    }
  }
}
