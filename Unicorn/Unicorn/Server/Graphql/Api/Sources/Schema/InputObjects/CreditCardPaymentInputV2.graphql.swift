// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// Specifies the fields required to complete a checkout with
/// a Shopify vaulted credit card payment.
public struct CreditCardPaymentInputV2: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    paymentAmount: MoneyInput,
    idempotencyKey: String,
    billingAddress: MailingAddressInput,
    vaultId: String,
    test: GraphQLNullable<Bool> = nil
  ) {
    __data = InputDict([
      "paymentAmount": paymentAmount,
      "idempotencyKey": idempotencyKey,
      "billingAddress": billingAddress,
      "vaultId": vaultId,
      "test": test
    ])
  }

  /// The amount and currency of the payment.
  public var paymentAmount: MoneyInput {
    get { __data["paymentAmount"] }
    set { __data["paymentAmount"] = newValue }
  }

  /// A unique client generated key used to avoid duplicate charges. When a duplicate payment is found, the original is returned instead of creating a new one. For more information, refer to [Idempotent requests](https://shopify.dev/api/usage/idempotent-requests).
  public var idempotencyKey: String {
    get { __data["idempotencyKey"] }
    set { __data["idempotencyKey"] = newValue }
  }

  /// The billing address for the payment.
  public var billingAddress: MailingAddressInput {
    get { __data["billingAddress"] }
    set { __data["billingAddress"] = newValue }
  }

  /// The ID returned by Shopify's Card Vault.
  public var vaultId: String {
    get { __data["vaultId"] }
    set { __data["vaultId"] = newValue }
  }

  /// Executes the payment in test mode if possible. Defaults to `false`.
  public var test: GraphQLNullable<Bool> {
    get { __data["test"] }
    set { __data["test"] = newValue }
  }
}
