// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AddProductsToCartMutation: GraphQLMutation {
  public static let operationName: String = "addProductsToCart"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation addProductsToCart($cartId: ID!, $lines: [CartLineInput!]!) { cartLinesAdd(cartId: $cartId, lines: $lines) { __typename cart { __typename ...CartCommon } } }"#,
      fragments: [CartCommon.self]
    ))

  public var cartId: ID
  public var lines: [CartLineInput]

  public init(
    cartId: ID,
    lines: [CartLineInput]
  ) {
    self.cartId = cartId
    self.lines = lines
  }

  public var __variables: Variables? { [
    "cartId": cartId,
    "lines": lines
  ] }

  public struct Data: AppSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("cartLinesAdd", CartLinesAdd?.self, arguments: [
        "cartId": .variable("cartId"),
        "lines": .variable("lines")
      ]),
    ] }

    /// Adds a merchandise line to the cart.
    public var cartLinesAdd: CartLinesAdd? { __data["cartLinesAdd"] }

    /// CartLinesAdd
    ///
    /// Parent Type: `CartLinesAddPayload`
    public struct CartLinesAdd: AppSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.CartLinesAddPayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("cart", Cart?.self),
      ] }

      /// The updated cart.
      public var cart: Cart? { __data["cart"] }

      /// CartLinesAdd.Cart
      ///
      /// Parent Type: `Cart`
      public struct Cart: AppSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Cart }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(CartCommon.self),
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
        public var lines: CartCommon.Lines { __data["lines"] }
        /// The attributes associated with the cart. Attributes are represented as key-value pairs.
        public var attributes: [CartCommon.Attribute] { __data["attributes"] }
        /// The estimated costs that the buyer will pay at checkout. The costs are subject to change and changes will be reflected at checkout. The `cost` field uses the `buyerIdentity` field to determine [international pricing](https://shopify.dev/custom-storefronts/internationalization/international-pricing).
        public var cost: CartCommon.Cost { __data["cost"] }
        /// Information about the buyer that's interacting with the cart.
        public var buyerIdentity: CartCommon.BuyerIdentity { __data["buyerIdentity"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var cartCommon: CartCommon { _toFragment() }
        }
      }
    }
  }
}
