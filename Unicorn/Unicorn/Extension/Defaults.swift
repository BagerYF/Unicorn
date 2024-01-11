//
//  Defaults.swift
//  Unicorn
//
//  Created by Bager on 2023/12/28.
//

import SwiftUI
import Defaults
import AppSchema

extension Defaults.Keys {
    static let quality = Key<Double>("quality", default: 0.8)
    //            ^            ^         ^                ^
    //           Key          Type   UserDefaults name   Default value
    static let searchHistory = Key<[String]>("searchHistory", default: [])
    static let cartId = Key<String>("cartId", default: "")
    static let token = Key<String>("token", default: "")
    static let wishlist = Key<[ProductModel]>("wishlist", default: [])
}
