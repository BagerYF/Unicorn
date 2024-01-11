// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CustomerCreateMutation: GraphQLMutation {
  public static let operationName: String = "customerCreate"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation customerCreate($input: CustomerCreateInput!) { customerCreate(input: $input) { __typename customerUserErrors { __typename code field message } customer { __typename id } } }"#
    ))

  public var input: CustomerCreateInput

  public init(input: CustomerCreateInput) {
    self.input = input
  }

  public var __variables: Variables? { ["input": input] }

  public struct Data: AppSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("customerCreate", CustomerCreate?.self, arguments: ["input": .variable("input")]),
    ] }

    /// Creates a new customer.
    public var customerCreate: CustomerCreate? { __data["customerCreate"] }

    /// CustomerCreate
    ///
    /// Parent Type: `CustomerCreatePayload`
    public struct CustomerCreate: AppSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.CustomerCreatePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("customerUserErrors", [CustomerUserError].self),
        .field("customer", Customer?.self),
      ] }

      /// The list of errors that occurred from executing the mutation.
      public var customerUserErrors: [CustomerUserError] { __data["customerUserErrors"] }
      /// The created customer object.
      public var customer: Customer? { __data["customer"] }

      /// CustomerCreate.CustomerUserError
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

      /// CustomerCreate.Customer
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
}
