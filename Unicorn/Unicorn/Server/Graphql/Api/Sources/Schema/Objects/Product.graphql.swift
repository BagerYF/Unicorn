// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// A product represents an individual item for sale in a Shopify store. Products are often physical, but they don't have to be.
  /// For example, a digital download (such as a movie, music or ebook file) also
  /// qualifies as a product, as do services (such as equipment rental, work for hire,
  /// customization of another product or an extended warranty).
  static let Product = ApolloAPI.Object(
    typename: "Product",
    implementedInterfaces: [
      Interfaces.HasMetafields.self,
      Interfaces.Node.self,
      Interfaces.OnlineStorePublishable.self,
      Interfaces.Trackable.self
    ]
  )
}