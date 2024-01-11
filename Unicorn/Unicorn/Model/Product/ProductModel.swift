//
//  ProductModel.swift
//  Unicorn
//
//  Created by Bager on 2023/12/30.
//

import SwiftUI
import AppSchema
import Defaults

public struct ProductModel: Identifiable {
    public let id = UUID()
    var sid: String
    var title : String
    var vendor : String
    var price : String
    var image : String
}

extension ProductModel: Defaults.Serializable {
    public static let bridge = DefaultsProductBridge()
}

public final class DefaultsProductBridge: Defaults.Bridge {
    public typealias Value = ProductModel
    public typealias Serializable = [String: String]

    public func serialize(_ value: Value?) -> Serializable? {
        guard let value else {
            return nil
        }

        return ["sid": value.sid, "title": value.title, "vendor": value.vendor, "price": value.price, "image": value.image]
    }

    public func deserialize(_ object: Serializable?) -> Value? {
        guard
            let object,
            let sid = object["sid"],
            let title = object["title"],
            let vendor = object["vendor"],
            let price = object["price"],
            let image = object["image"]
        else {
            return nil
        }

        return ProductModel(sid: sid, title: title, vendor: vendor, price: price, image: image)
    }
}

class ProductSortModel: Identifiable {

    let id = UUID()
    var key : String!
    var name : String!
    var selected : Bool!
    var reverse: Bool!
    var sortKey: AppSchema.ProductCollectionSortKeys!

    init(fromDictionary dictionary: [String:Any]){
        key = dictionary["key"] as? String
        name = dictionary["name"] as? String
        selected = false
        reverse = dictionary["reverse"] as? Bool
        sortKey = dictionary["sortKey"] as? AppSchema.ProductCollectionSortKeys
    }
}

let kProductSortMap = [
    ["name": "Most Relevant", "reverse": false, "sortKey": AppSchema.ProductCollectionSortKeys.relevance],
    ["name": "Alphabetically, A-Z", "reverse": false, "sortKey": AppSchema.ProductCollectionSortKeys.title],
    ["name": "Alphabetically, Z-A", "reverse": true, "sortKey": AppSchema.ProductCollectionSortKeys.title],
    ["name": "New In", "reverse": false, "sortKey": AppSchema.ProductCollectionSortKeys.created],
    ["name": "Price, low to high", "reverse": false, "sortKey": AppSchema.ProductCollectionSortKeys.price],
    ["name": "Price, high to low", "reverse": true, "sortKey": AppSchema.ProductCollectionSortKeys.price],
]

