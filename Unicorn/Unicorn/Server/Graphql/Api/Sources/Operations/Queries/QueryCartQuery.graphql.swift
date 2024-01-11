// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class QueryCartQuery: GraphQLQuery {
  public static let operationName: String = "queryCart"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query queryCart($id: ID!) { cart(id: $id) { __typename ...CartCommon } }"#,
      fragments: [CartCommon.self]
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
      .field("cart", Cart?.self, arguments: ["id": .variable("id")]),
    ] }

    /// Retrieve a cart by its ID. For more information, refer to
    /// [Manage a cart with the Storefront API](https://shopify.dev/custom-storefronts/cart/manage).
    public var cart: Cart? { __data["cart"] }

    /// Cart
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
