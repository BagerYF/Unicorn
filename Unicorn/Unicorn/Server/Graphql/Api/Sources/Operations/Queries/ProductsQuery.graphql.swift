// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ProductsQuery: GraphQLQuery {
  public static let operationName: String = "products"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query products($first: Int!, $after: String, $sortKey: ProductSortKeys, $query: String) { products( first: $first reverse: true after: $after sortKey: $sortKey query: $query ) { __typename edges { __typename node { __typename id title vendor productType handle images(first: 5) { __typename edges { __typename node { __typename id url } } } variants(first: 5) { __typename edges { __typename node { __typename id compareAtPrice { __typename amount currencyCode } title price { __typename amount currencyCode } image { __typename url } } } } } } pageInfo { __typename endCursor hasNextPage hasPreviousPage startCursor } filters { __typename id label type values { __typename id count input label } } } }"#
    ))

  public var first: Int
  public var after: GraphQLNullable<String>
  public var sortKey: GraphQLNullable<GraphQLEnum<ProductSortKeys>>
  public var query: GraphQLNullable<String>

  public init(
    first: Int,
    after: GraphQLNullable<String>,
    sortKey: GraphQLNullable<GraphQLEnum<ProductSortKeys>>,
    query: GraphQLNullable<String>
  ) {
    self.first = first
    self.after = after
    self.sortKey = sortKey
    self.query = query
  }

  public var __variables: Variables? { [
    "first": first,
    "after": after,
    "sortKey": sortKey,
    "query": query
  ] }

  public struct Data: AppSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("products", Products.self, arguments: [
        "first": .variable("first"),
        "reverse": true,
        "after": .variable("after"),
        "sortKey": .variable("sortKey"),
        "query": .variable("query")
      ]),
    ] }

    /// List of the shop’s products. For storefront search, use [`search` query](https://shopify.dev/docs/api/storefront/latest/queries/search).
    public var products: Products { __data["products"] }

    /// Products
    ///
    /// Parent Type: `ProductConnection`
    public struct Products: AppSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.ProductConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("edges", [Edge].self),
        .field("pageInfo", PageInfo.self),
        .field("filters", [Filter].self),
      ] }

      /// A list of edges.
      public var edges: [Edge] { __data["edges"] }
      /// Information to aid in pagination.
      public var pageInfo: PageInfo { __data["pageInfo"] }
      /// A list of available filters.
      public var filters: [Filter] { __data["filters"] }

      /// Products.Edge
      ///
      /// Parent Type: `ProductEdge`
      public struct Edge: AppSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.ProductEdge }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("node", Node.self),
        ] }

        /// The item at the end of ProductEdge.
        public var node: Node { __data["node"] }

        /// Products.Edge.Node
        ///
        /// Parent Type: `Product`
        public struct Node: AppSchema.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Product }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", AppSchema.ID.self),
            .field("title", String.self),
            .field("vendor", String.self),
            .field("productType", String.self),
            .field("handle", String.self),
            .field("images", Images.self, arguments: ["first": 5]),
            .field("variants", Variants.self, arguments: ["first": 5]),
          ] }

          /// A globally-unique ID.
          public var id: AppSchema.ID { __data["id"] }
          /// The product’s title.
          public var title: String { __data["title"] }
          /// The product’s vendor name.
          public var vendor: String { __data["vendor"] }
          /// A categorization that a product can be tagged with, commonly used for filtering and searching.
          public var productType: String { __data["productType"] }
          /// A human-friendly unique string for the Product automatically generated from its title.
          /// They are used by the Liquid templating language to refer to objects.
          public var handle: String { __data["handle"] }
          /// List of images associated with the product.
          public var images: Images { __data["images"] }
          /// List of the product’s variants.
          public var variants: Variants { __data["variants"] }

          /// Products.Edge.Node.Images
          ///
          /// Parent Type: `ImageConnection`
          public struct Images: AppSchema.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.ImageConnection }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("edges", [Edge].self),
            ] }

            /// A list of edges.
            public var edges: [Edge] { __data["edges"] }

            /// Products.Edge.Node.Images.Edge
            ///
            /// Parent Type: `ImageEdge`
            public struct Edge: AppSchema.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.ImageEdge }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("node", Node.self),
              ] }

              /// The item at the end of ImageEdge.
              public var node: Node { __data["node"] }

              /// Products.Edge.Node.Images.Edge.Node
              ///
              /// Parent Type: `Image`
              public struct Node: AppSchema.SelectionSet {
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
            }
          }

          /// Products.Edge.Node.Variants
          ///
          /// Parent Type: `ProductVariantConnection`
          public struct Variants: AppSchema.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.ProductVariantConnection }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("edges", [Edge].self),
            ] }

            /// A list of edges.
            public var edges: [Edge] { __data["edges"] }

            /// Products.Edge.Node.Variants.Edge
            ///
            /// Parent Type: `ProductVariantEdge`
            public struct Edge: AppSchema.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.ProductVariantEdge }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("node", Node.self),
              ] }

              /// The item at the end of ProductVariantEdge.
              public var node: Node { __data["node"] }

              /// Products.Edge.Node.Variants.Edge.Node
              ///
              /// Parent Type: `ProductVariant`
              public struct Node: AppSchema.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.ProductVariant }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("id", AppSchema.ID.self),
                  .field("compareAtPrice", CompareAtPrice?.self),
                  .field("title", String.self),
                  .field("price", Price.self),
                  .field("image", Image?.self),
                ] }

                /// A globally-unique ID.
                public var id: AppSchema.ID { __data["id"] }
                /// The compare at price of the variant. This can be used to mark a variant as on sale, when `compareAtPrice` is higher than `price`.
                public var compareAtPrice: CompareAtPrice? { __data["compareAtPrice"] }
                /// The product variant’s title.
                public var title: String { __data["title"] }
                /// The product variant’s price.
                public var price: Price { __data["price"] }
                /// Image associated with the product variant. This field falls back to the product image if no image is available.
                public var image: Image? { __data["image"] }

                /// Products.Edge.Node.Variants.Edge.Node.CompareAtPrice
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

                /// Products.Edge.Node.Variants.Edge.Node.Price
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

                /// Products.Edge.Node.Variants.Edge.Node.Image
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
              }
            }
          }
        }
      }

      /// Products.PageInfo
      ///
      /// Parent Type: `PageInfo`
      public struct PageInfo: AppSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.PageInfo }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("endCursor", String?.self),
          .field("hasNextPage", Bool.self),
          .field("hasPreviousPage", Bool.self),
          .field("startCursor", String?.self),
        ] }

        /// The cursor corresponding to the last node in edges.
        public var endCursor: String? { __data["endCursor"] }
        /// Whether there are more pages to fetch following the current page.
        public var hasNextPage: Bool { __data["hasNextPage"] }
        /// Whether there are any pages prior to the current page.
        public var hasPreviousPage: Bool { __data["hasPreviousPage"] }
        /// The cursor corresponding to the first node in edges.
        public var startCursor: String? { __data["startCursor"] }
      }

      /// Products.Filter
      ///
      /// Parent Type: `Filter`
      public struct Filter: AppSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Filter }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", String.self),
          .field("label", String.self),
          .field("type", GraphQLEnum<AppSchema.FilterType>.self),
          .field("values", [Value].self),
        ] }

        /// A unique identifier.
        public var id: String { __data["id"] }
        /// A human-friendly string for this filter.
        public var label: String { __data["label"] }
        /// An enumeration that denotes the type of data this filter represents.
        public var type: GraphQLEnum<AppSchema.FilterType> { __data["type"] }
        /// The list of values for this filter.
        public var values: [Value] { __data["values"] }

        /// Products.Filter.Value
        ///
        /// Parent Type: `FilterValue`
        public struct Value: AppSchema.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.FilterValue }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", String.self),
            .field("count", Int.self),
            .field("input", AppSchema.JSON.self),
            .field("label", String.self),
          ] }

          /// A unique identifier.
          public var id: String { __data["id"] }
          /// The number of results that match this filter value.
          public var count: Int { __data["count"] }
          /// An input object that can be used to filter by this value on the parent field.
          ///
          /// The value is provided as a helper for building dynamic filtering UI. For
          /// example, if you have a list of selected `FilterValue` objects, you can combine
          /// their respective `input` values to use in a subsequent query.
          public var input: AppSchema.JSON { __data["input"] }
          /// A human-friendly string for this filter value.
          public var label: String { __data["label"] }
        }
      }
    }
  }
}
