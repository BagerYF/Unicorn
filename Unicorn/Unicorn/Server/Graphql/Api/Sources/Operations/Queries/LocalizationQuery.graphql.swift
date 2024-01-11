// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class LocalizationQuery: GraphQLQuery {
  public static let operationName: String = "localization"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query localization { localization { __typename availableCountries { __typename name currency { __typename name symbol isoCode } isoCode unitSystem availableLanguages { __typename name isoCode endonymName } } } }"#
    ))

  public init() {}

  public struct Data: AppSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("localization", Localization.self),
    ] }

    /// Returns the localized experiences configured for the shop.
    public var localization: Localization { __data["localization"] }

    /// Localization
    ///
    /// Parent Type: `Localization`
    public struct Localization: AppSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Localization }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("availableCountries", [AvailableCountry].self),
      ] }

      /// The list of countries with enabled localized experiences.
      public var availableCountries: [AvailableCountry] { __data["availableCountries"] }

      /// Localization.AvailableCountry
      ///
      /// Parent Type: `Country`
      public struct AvailableCountry: AppSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Country }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String.self),
          .field("currency", Currency.self),
          .field("isoCode", GraphQLEnum<AppSchema.CountryCode>.self),
          .field("unitSystem", GraphQLEnum<AppSchema.UnitSystem>.self),
          .field("availableLanguages", [AvailableLanguage].self),
        ] }

        /// The name of the country.
        public var name: String { __data["name"] }
        /// The currency of the country.
        public var currency: Currency { __data["currency"] }
        /// The ISO code of the country.
        public var isoCode: GraphQLEnum<AppSchema.CountryCode> { __data["isoCode"] }
        /// The unit system used in the country.
        public var unitSystem: GraphQLEnum<AppSchema.UnitSystem> { __data["unitSystem"] }
        /// The languages available for the country.
        public var availableLanguages: [AvailableLanguage] { __data["availableLanguages"] }

        /// Localization.AvailableCountry.Currency
        ///
        /// Parent Type: `Currency`
        public struct Currency: AppSchema.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Currency }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
            .field("symbol", String.self),
            .field("isoCode", GraphQLEnum<AppSchema.CurrencyCode>.self),
          ] }

          /// The name of the currency.
          public var name: String { __data["name"] }
          /// The symbol of the currency.
          public var symbol: String { __data["symbol"] }
          /// The ISO code of the currency.
          public var isoCode: GraphQLEnum<AppSchema.CurrencyCode> { __data["isoCode"] }
        }

        /// Localization.AvailableCountry.AvailableLanguage
        ///
        /// Parent Type: `Language`
        public struct AvailableLanguage: AppSchema.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AppSchema.Objects.Language }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
            .field("isoCode", GraphQLEnum<AppSchema.LanguageCode>.self),
            .field("endonymName", String.self),
          ] }

          /// The name of the language in the current language.
          public var name: String { __data["name"] }
          /// The ISO code.
          public var isoCode: GraphQLEnum<AppSchema.LanguageCode> { __data["isoCode"] }
          /// The name of the language in the language itself. If the language uses capitalization, it is capitalized for a mid-sentence position.
          public var endonymName: String { __data["endonymName"] }
        }
      }
    }
  }
}
