// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetProductByIdQuery: GraphQLQuery {
  public static let operationName: String = "getProductById"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query getProductById($id: ID!) { product(id: $id) { __typename id title vendor productType handle description images(first: 5) { __typename edges { __typename node { __typename id url } } } variants(first: 10) { __typename edges { __typename node { __typename id compareAtPrice { __typename amount currencyCode } title price { __typename amount currencyCode } price { __typename amount currencyCode } quantityAvailable selectedOptions { __typename name value } } } } } }"#
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
      .field("product", Product?.self, arguments: ["id": .variable("id")]),
    ] }

    /// Fetch a specific `Product` by one of its unique attributes.
    public var product: Product? { __data["product"] }

    /// Product
    ///
    /// Parent Type: `Product`
      public struct Product: AppSchema.SelectionSet {
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
        .field("description", String.self),
        .field("images", Images.self, arguments: ["first": 5]),
        .field("variants", Variants.self, arguments: ["first": 10]),
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
      /// Stripped description of the product, single line with HTML tags removed.
      public var description: String { __data["description"] }
      /// List of images associated with the product.
      public var images: Images { __data["images"] }
      /// List of the product’s variants.
      public var variants: Variants { __data["variants"] }

      /// Product.Images
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

        /// Product.Images.Edge
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

          /// Product.Images.Edge.Node
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

      /// Product.Variants
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

        /// Product.Variants.Edge
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

          /// Product.Variants.Edge.Node
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
              .field("quantityAvailable", Int?.self),
              .field("selectedOptions", [SelectedOption].self),
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
            /// List of product options applied to the variant.
            public var selectedOptions: [SelectedOption] { __data["selectedOptions"] }

            /// Product.Variants.Edge.Node.CompareAtPrice
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

            /// Product.Variants.Edge.Node.Price
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

            /// Product.Variants.Edge.Node.SelectedOption
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
          }
        }
      }
    }
  }
}
