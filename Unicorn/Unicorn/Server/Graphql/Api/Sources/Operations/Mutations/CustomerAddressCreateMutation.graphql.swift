// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CustomerAddressCreateMutation: GraphQLMutation {
  public static let operationName: String = "customerAddressCreate"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation customerAddressCreate($address: MailingAddressInput!, $customerAccessToken: String!) { customerAddressCreate( address: $address customerAccessToken: $customerAccessToken ) { __typename customerAddress { __typename id } customerUserErrors { __typename code field message } } }"#
    ))

  public var address: MailingAddressInput
  public var customerAccessToken: String

  public init(
    address: MailingAddressInput,
    customerAccessToken: String
  ) {
    self.address = address
    self.customerAccessToken = customerAccessToken
  }

  public var __variables: Variables? { [
    "address": address,
    "customerAccessToken": customerAccessToken
  ] }

  public struct Data: AppSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("customerAddressCreate", CustomerAddressCreate?.self, arguments: [
        "address": .variable("address"),
        "customerAccessToken": .variable("customerAccessToken")
      ]),
    ] }

    /// Creates a new address for a customer.
    public var customerAddressCreate: CustomerAddressCreate? { __data["customerAddressCreate"] }

    /// CustomerAddressCreate
    ///
    /// Parent Type: `CustomerAddressCreatePayload`
    public struct CustomerAddressCreate: AppSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.CustomerAddressCreatePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("customerAddress", CustomerAddress?.self),
        .field("customerUserErrors", [CustomerUserError].self),
      ] }

      /// The new customer address object.
      public var customerAddress: CustomerAddress? { __data["customerAddress"] }
      /// The list of errors that occurred from executing the mutation.
      public var customerUserErrors: [CustomerUserError] { __data["customerUserErrors"] }

      /// CustomerAddressCreate.CustomerAddress
      ///
      /// Parent Type: `MailingAddress`
      public struct CustomerAddress: AppSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.MailingAddress }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", AppSchema.ID.self),
        ] }

        /// A globally-unique ID.
        public var id: AppSchema.ID { __data["id"] }
      }

      /// CustomerAddressCreate.CustomerUserError
      ///
      /// Parent Type: `CustomerUserError`
      public struct CustomerUserError: AppSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.CustomerUserError }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("code", GraphQLEnum<AppSchema.CustomerErrorCode>?.self),
          .field("field", [String]?.self),
          .field("message", String.self),
        ] }

        /// The error code.
        public var code: GraphQLEnum<AppSchema.CustomerErrorCode>? { __data["code"] }
        /// The path to the input field that caused the error.
        public var field: [String]? { __data["field"] }
        /// The error message.
        public var message: String { __data["message"] }
      }
    }
  }
}
