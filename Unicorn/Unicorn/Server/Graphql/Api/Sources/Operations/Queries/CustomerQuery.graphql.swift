// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CustomerQuery: GraphQLQuery {
  public static let operationName: String = "customer"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query customer($customerAccessToken: String!) { customer(customerAccessToken: $customerAccessToken) { __typename id acceptsMarketing displayName email firstName lastName phone addresses(first: 100) { __typename edges { __typename node { __typename id address1 address2 city country countryCodeV2 firstName lastName name phone province provinceCode zip } } } orders(first: 100) { __typename edges { __typename node { __typename id orderNumber processedAt email name phone originalTotalPrice { __typename amount currencyCode } subtotalPriceV2 { __typename amount currencyCode } totalPriceV2 { __typename amount currencyCode } totalShippingPriceV2 { __typename amount currencyCode } totalTaxV2 { __typename amount currencyCode } currentSubtotalPrice { __typename amount currencyCode } currentTotalPrice { __typename amount currencyCode } currentTotalTax { __typename amount currencyCode } shippingAddress { __typename id address1 address2 city country countryCodeV2 firstName lastName name phone province provinceCode zip } processedAt lineItems(first: 100) { __typename edges { __typename node { __typename variant { __typename image { __typename url } title price { __typename amount currencyCode } selectedOptions { __typename name value } product { __typename productType } } title quantity originalTotalPrice { __typename amount currencyCode } } } } } } } } }"#
    ))

  public var customerAccessToken: String

  public init(customerAccessToken: String) {
    self.customerAccessToken = customerAccessToken
  }

  public var __variables: Variables? { ["customerAccessToken": customerAccessToken] }

  public struct Data: AppSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("customer", Customer?.self, arguments: ["customerAccessToken": .variable("customerAccessToken")]),
    ] }

    /// The customer associated with the given access token. Tokens are obtained by using the
    /// [`customerAccessTokenCreate` mutation](https://shopify.dev/docs/api/storefront/latest/mutations/customerAccessTokenCreate).
    public var customer: Customer? { __data["customer"] }

    /// Customer
    ///
    /// Parent Type: `Customer`
    public struct Customer: AppSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Customer }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", AppSchema.ID.self),
        .field("acceptsMarketing", Bool.self),
        .field("displayName", String.self),
        .field("email", String?.self),
        .field("firstName", String?.self),
        .field("lastName", String?.self),
        .field("phone", String?.self),
        .field("addresses", Addresses.self, arguments: ["first": 100]),
        .field("orders", Orders.self, arguments: ["first": 100]),
      ] }

      /// A unique ID for the customer.
      public var id: AppSchema.ID { __data["id"] }
      /// Indicates whether the customer has consented to be sent marketing material via email.
      public var acceptsMarketing: Bool { __data["acceptsMarketing"] }
      /// The customer’s name, email or phone number.
      public var displayName: String { __data["displayName"] }
      /// The customer’s email address.
      public var email: String? { __data["email"] }
      /// The customer’s first name.
      public var firstName: String? { __data["firstName"] }
      /// The customer’s last name.
      public var lastName: String? { __data["lastName"] }
      /// The customer’s phone number.
      public var phone: String? { __data["phone"] }
      /// A list of addresses for the customer.
      public var addresses: Addresses { __data["addresses"] }
      /// The orders associated with the customer.
      public var orders: Orders { __data["orders"] }

      /// Customer.Addresses
      ///
      /// Parent Type: `MailingAddressConnection`
      public struct Addresses: AppSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.MailingAddressConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge].self),
        ] }

        /// A list of edges.
        public var edges: [Edge] { __data["edges"] }

        /// Customer.Addresses.Edge
        ///
        /// Parent Type: `MailingAddressEdge`
        public struct Edge: AppSchema.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.MailingAddressEdge }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("node", Node.self),
          ] }

          /// The item at the end of MailingAddressEdge.
          public var node: Node { __data["node"] }

          /// Customer.Addresses.Edge.Node
          ///
          /// Parent Type: `MailingAddress`
          public struct Node: AppSchema.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.MailingAddress }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", AppSchema.ID.self),
              .field("address1", String?.self),
              .field("address2", String?.self),
              .field("city", String?.self),
              .field("country", String?.self),
              .field("countryCodeV2", GraphQLEnum<AppSchema.CountryCode>?.self),
              .field("firstName", String?.self),
              .field("lastName", String?.self),
              .field("name", String?.self),
              .field("phone", String?.self),
              .field("province", String?.self),
              .field("provinceCode", String?.self),
              .field("zip", String?.self),
            ] }

            /// A globally-unique ID.
            public var id: AppSchema.ID { __data["id"] }
            /// The first line of the address. Typically the street address or PO Box number.
            public var address1: String? { __data["address1"] }
            /// The second line of the address. Typically the number of the apartment, suite, or unit.
            public var address2: String? { __data["address2"] }
            /// The name of the city, district, village, or town.
            public var city: String? { __data["city"] }
            /// The name of the country.
            public var country: String? { __data["country"] }
            /// The two-letter code for the country of the address.
            ///
            /// For example, US.
            public var countryCodeV2: GraphQLEnum<AppSchema.CountryCode>? { __data["countryCodeV2"] }
            /// The first name of the customer.
            public var firstName: String? { __data["firstName"] }
            /// The last name of the customer.
            public var lastName: String? { __data["lastName"] }
            /// The full name of the customer, based on firstName and lastName.
            public var name: String? { __data["name"] }
            /// A unique phone number for the customer.
            ///
            /// Formatted using E.164 standard. For example, _+16135551111_.
            public var phone: String? { __data["phone"] }
            /// The region of the address, such as the province, state, or district.
            public var province: String? { __data["province"] }
            /// The two-letter code for the region.
            ///
            /// For example, ON.
            public var provinceCode: String? { __data["provinceCode"] }
            /// The zip or postal code of the address.
            public var zip: String? { __data["zip"] }
          }
        }
      }

      /// Customer.Orders
      ///
      /// Parent Type: `OrderConnection`
      public struct Orders: AppSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.OrderConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge].self),
        ] }

        /// A list of edges.
        public var edges: [Edge] { __data["edges"] }

        /// Customer.Orders.Edge
        ///
        /// Parent Type: `OrderEdge`
        public struct Edge: AppSchema.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.OrderEdge }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("node", Node.self),
          ] }

          /// The item at the end of OrderEdge.
          public var node: Node { __data["node"] }

          /// Customer.Orders.Edge.Node
          ///
          /// Parent Type: `Order`
          public struct Node: AppSchema.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Order }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", AppSchema.ID.self),
              .field("orderNumber", Int.self),
              .field("processedAt", AppSchema.DateTime.self),
              .field("email", String?.self),
              .field("name", String.self),
              .field("phone", String?.self),
              .field("originalTotalPrice", OriginalTotalPrice.self),
              .field("subtotalPriceV2", SubtotalPriceV2?.self),
              .field("totalPriceV2", TotalPriceV2.self),
              .field("totalShippingPriceV2", TotalShippingPriceV2.self),
              .field("totalTaxV2", TotalTaxV2?.self),
              .field("currentSubtotalPrice", CurrentSubtotalPrice.self),
              .field("currentTotalPrice", CurrentTotalPrice.self),
              .field("currentTotalTax", CurrentTotalTax.self),
              .field("shippingAddress", ShippingAddress?.self),
              .field("lineItems", LineItems.self, arguments: ["first": 100]),
            ] }

            /// A globally-unique ID.
            public var id: AppSchema.ID { __data["id"] }
            /// A unique numeric identifier for the order for use by shop owner and customer.
            public var orderNumber: Int { __data["orderNumber"] }
            /// The date and time when the order was imported.
            /// This value can be set to dates in the past when importing from other systems.
            /// If no value is provided, it will be auto-generated based on current date and time.
            public var processedAt: AppSchema.DateTime { __data["processedAt"] }
            /// The customer's email address.
            public var email: String? { __data["email"] }
            /// Unique identifier for the order that appears on the order.
            /// For example, _#1000_ or _Store1001.
            public var name: String { __data["name"] }
            /// The customer's phone number for receiving SMS notifications.
            public var phone: String? { __data["phone"] }
            /// The total price of the order before any applied edits.
            public var originalTotalPrice: OriginalTotalPrice { __data["originalTotalPrice"] }
            /// Price of the order before duties, shipping and taxes.
            @available(*, deprecated, message: "Use `subtotalPrice` instead.")
            public var subtotalPriceV2: SubtotalPriceV2? { __data["subtotalPriceV2"] }
            /// The sum of all the prices of all the items in the order, duties, taxes and discounts included (must be positive).
            @available(*, deprecated, message: "Use `totalPrice` instead.")
            public var totalPriceV2: TotalPriceV2 { __data["totalPriceV2"] }
            /// The total cost of shipping.
            @available(*, deprecated, message: "Use `totalShippingPrice` instead.")
            public var totalShippingPriceV2: TotalShippingPriceV2 { __data["totalShippingPriceV2"] }
            /// The total cost of taxes.
            @available(*, deprecated, message: "Use `totalTax` instead.")
            public var totalTaxV2: TotalTaxV2? { __data["totalTaxV2"] }
            /// The subtotal of line items and their discounts, excluding line items that have been removed. Does not contain order-level discounts, duties, shipping costs, or shipping discounts. Taxes aren't included unless the order is a taxes-included order.
            public var currentSubtotalPrice: CurrentSubtotalPrice { __data["currentSubtotalPrice"] }
            /// The total amount of the order, including duties, taxes and discounts, minus amounts for line items that have been removed.
            public var currentTotalPrice: CurrentTotalPrice { __data["currentTotalPrice"] }
            /// The total of all taxes applied to the order, excluding taxes for returned line items.
            public var currentTotalTax: CurrentTotalTax { __data["currentTotalTax"] }
            /// The address to where the order will be shipped.
            public var shippingAddress: ShippingAddress? { __data["shippingAddress"] }
            /// List of the order’s line items.
            public var lineItems: LineItems { __data["lineItems"] }

            /// Customer.Orders.Edge.Node.OriginalTotalPrice
            ///
            /// Parent Type: `MoneyV2`
            public struct OriginalTotalPrice: AppSchema.SelectionSet {
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

            /// Customer.Orders.Edge.Node.SubtotalPriceV2
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

            /// Customer.Orders.Edge.Node.TotalPriceV2
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

            /// Customer.Orders.Edge.Node.TotalShippingPriceV2
            ///
            /// Parent Type: `MoneyV2`
            public struct TotalShippingPriceV2: AppSchema.SelectionSet {
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

            /// Customer.Orders.Edge.Node.TotalTaxV2
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

            /// Customer.Orders.Edge.Node.CurrentSubtotalPrice
            ///
            /// Parent Type: `MoneyV2`
            public struct CurrentSubtotalPrice: AppSchema.SelectionSet {
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

            /// Customer.Orders.Edge.Node.CurrentTotalPrice
            ///
            /// Parent Type: `MoneyV2`
            public struct CurrentTotalPrice: AppSchema.SelectionSet {
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

            /// Customer.Orders.Edge.Node.CurrentTotalTax
            ///
            /// Parent Type: `MoneyV2`
            public struct CurrentTotalTax: AppSchema.SelectionSet {
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

            /// Customer.Orders.Edge.Node.ShippingAddress
            ///
            /// Parent Type: `MailingAddress`
            public struct ShippingAddress: AppSchema.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.MailingAddress }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("id", AppSchema.ID.self),
                .field("address1", String?.self),
                .field("address2", String?.self),
                .field("city", String?.self),
                .field("country", String?.self),
                .field("countryCodeV2", GraphQLEnum<AppSchema.CountryCode>?.self),
                .field("firstName", String?.self),
                .field("lastName", String?.self),
                .field("name", String?.self),
                .field("phone", String?.self),
                .field("province", String?.self),
                .field("provinceCode", String?.self),
                .field("zip", String?.self),
              ] }

              /// A globally-unique ID.
              public var id: AppSchema.ID { __data["id"] }
              /// The first line of the address. Typically the street address or PO Box number.
              public var address1: String? { __data["address1"] }
              /// The second line of the address. Typically the number of the apartment, suite, or unit.
              public var address2: String? { __data["address2"] }
              /// The name of the city, district, village, or town.
              public var city: String? { __data["city"] }
              /// The name of the country.
              public var country: String? { __data["country"] }
              /// The two-letter code for the country of the address.
              ///
              /// For example, US.
              public var countryCodeV2: GraphQLEnum<AppSchema.CountryCode>? { __data["countryCodeV2"] }
              /// The first name of the customer.
              public var firstName: String? { __data["firstName"] }
              /// The last name of the customer.
              public var lastName: String? { __data["lastName"] }
              /// The full name of the customer, based on firstName and lastName.
              public var name: String? { __data["name"] }
              /// A unique phone number for the customer.
              ///
              /// Formatted using E.164 standard. For example, _+16135551111_.
              public var phone: String? { __data["phone"] }
              /// The region of the address, such as the province, state, or district.
              public var province: String? { __data["province"] }
              /// The two-letter code for the region.
              ///
              /// For example, ON.
              public var provinceCode: String? { __data["provinceCode"] }
              /// The zip or postal code of the address.
              public var zip: String? { __data["zip"] }
            }

            /// Customer.Orders.Edge.Node.LineItems
            ///
            /// Parent Type: `OrderLineItemConnection`
            public struct LineItems: AppSchema.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.OrderLineItemConnection }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("edges", [Edge].self),
              ] }

              /// A list of edges.
              public var edges: [Edge] { __data["edges"] }

              /// Customer.Orders.Edge.Node.LineItems.Edge
              ///
              /// Parent Type: `OrderLineItemEdge`
              public struct Edge: AppSchema.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.OrderLineItemEdge }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("node", Node.self),
                ] }

                /// The item at the end of OrderLineItemEdge.
                public var node: Node { __data["node"] }

                /// Customer.Orders.Edge.Node.LineItems.Edge.Node
                ///
                /// Parent Type: `OrderLineItem`
                public struct Node: AppSchema.SelectionSet {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.OrderLineItem }
                  public static var __selections: [ApolloAPI.Selection] { [
                    .field("__typename", String.self),
                    .field("variant", Variant?.self),
                    .field("title", String.self),
                    .field("quantity", Int.self),
                    .field("originalTotalPrice", OriginalTotalPrice.self),
                  ] }

                  /// The product variant object associated to the line item.
                  public var variant: Variant? { __data["variant"] }
                  /// The title of the product combined with title of the variant.
                  public var title: String { __data["title"] }
                  /// The number of products variants associated to the line item.
                  public var quantity: Int { __data["quantity"] }
                  /// The total price of the line item, not including any discounts. The total price is calculated using the original unit price multiplied by the quantity, and it's displayed in the presentment currency.
                  public var originalTotalPrice: OriginalTotalPrice { __data["originalTotalPrice"] }

                  /// Customer.Orders.Edge.Node.LineItems.Edge.Node.Variant
                  ///
                  /// Parent Type: `ProductVariant`
                  public struct Variant: AppSchema.SelectionSet {
                    public let __data: DataDict
                    public init(_dataDict: DataDict) { __data = _dataDict }

                    public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.ProductVariant }
                    public static var __selections: [ApolloAPI.Selection] { [
                      .field("__typename", String.self),
                      .field("image", Image?.self),
                      .field("title", String.self),
                      .field("price", Price.self),
                      .field("selectedOptions", [SelectedOption].self),
                      .field("product", Product.self),
                    ] }

                    /// Image associated with the product variant. This field falls back to the product image if no image is available.
                    public var image: Image? { __data["image"] }
                    /// The product variant’s title.
                    public var title: String { __data["title"] }
                    /// The product variant’s price.
                    public var price: Price { __data["price"] }
                    /// List of product options applied to the variant.
                    public var selectedOptions: [SelectedOption] { __data["selectedOptions"] }
                    /// The product object that the product variant belongs to.
                    public var product: Product { __data["product"] }

                    /// Customer.Orders.Edge.Node.LineItems.Edge.Node.Variant.Image
                    ///
                    /// Parent Type: `Image`
                    public struct Image: AppSchema.SelectionSet {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Image }
                      public static var __selections: [ApolloAPI.Selection] { [
                        .field("__typename", String.self),
                        .field("url", AppSchema.URL.self),
                      ] }

                      /// The location of the image as a URL.
                      ///
                      /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
                      ///
                      /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
                      ///
                      /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
                      public var url: AppSchema.URL { __data["url"] }
                    }

                    /// Customer.Orders.Edge.Node.LineItems.Edge.Node.Variant.Price
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

                    /// Customer.Orders.Edge.Node.LineItems.Edge.Node.Variant.SelectedOption
                    ///
                    /// Parent Type: `SelectedOption`
                    public struct SelectedOption: AppSchema.SelectionSet {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.SelectedOption }
                      public static var __selections: [ApolloAPI.Selection] { [
                        .field("__typename", String.self),
                        .field("name", String.self),
                        .field("value", String.self),
                      ] }

                      /// The product option’s name.
                      public var name: String { __data["name"] }
                      /// The product option’s value.
                      public var value: String { __data["value"] }
                    }

                    /// Customer.Orders.Edge.Node.LineItems.Edge.Node.Variant.Product
                    ///
                    /// Parent Type: `Product`
                    public struct Product: AppSchema.SelectionSet {
                      public let __data: DataDict
                      public init(_dataDict: DataDict) { __data = _dataDict }

                      public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Product }
                      public static var __selections: [ApolloAPI.Selection] { [
                        .field("__typename", String.self),
                        .field("productType", String.self),
                      ] }

                      /// A categorization that a product can be tagged with, commonly used for filtering and searching.
                      public var productType: String { __data["productType"] }
                    }
                  }

                  /// Customer.Orders.Edge.Node.LineItems.Edge.Node.OriginalTotalPrice
                  ///
                  /// Parent Type: `MoneyV2`
                  public struct OriginalTotalPrice: AppSchema.SelectionSet {
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
    }
  }
}
