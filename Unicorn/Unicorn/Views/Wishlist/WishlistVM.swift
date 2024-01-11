//
//  WishlistVM.swift
//  Unicorn
//
//  Created by Bager on 2024/1/7.
//

import SwiftUI

import SwiftUI
import Foundation
import Combine
import AppSchema
import Defaults

final class WishlistVM: ObservableObject {

    @Published var wishlist: [ProductModel] = []

    init() {
        wishlist = Defaults[.wishlist]
    }

    func addWishlist(product: AppSchema.GetProductByIdQuery.Data.Product) {

        for (index, item) in wishlist.enumerated() {
            if item.sid == product.id {
                wishlist.remove(at: index)
                break
            }
        }

        wishlist.append(ProductModel(sid: product.id, title: product.title, vendor: product.vendor, price: "\(product.variants.edges.first?.node.price.amount ?? "")", image: product.images.edges.first?.node.url ?? ""))

        Defaults[.wishlist] = wishlist
    }

    func removeWishlist(id: String) {
        for (index, item) in wishlist.enumerated() {
            if item.sid == id {
                wishlist.remove(at: index)
                break
            }
        }

        Defaults[.wishlist] = wishlist
    }

    func isAddedWishlist(product: AppSchema.GetProductByIdQuery.Data.Product) -> Bool {
        var isAdded = false
        for (index, item) in wishlist.enumerated() {
            if item.sid == product.id {
                isAdded = true
                break
            }
        }
        return isAdded
    }

}
