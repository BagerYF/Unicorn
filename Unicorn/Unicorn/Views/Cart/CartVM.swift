//
//  CartVM.swift
//  Unicorn
//
//  Created by Bager on 2024/1/3.
//

import SwiftUI
import Foundation
import Combine
import AppSchema
import Defaults

final class CartVM: ObservableObject {

    @Published var cart: AppSchema.CartCommon?

    @Published var variantId = ""

    @Published var showToast = false

    @Published var showQty = false

    @Published var qtyIndex = 0

    @Published var qtyList: [String] = []

    init() {
        initData()
    }

    func initData() {

        let cartId: String = Defaults[.cartId]
        if cartId.count > 0 {
            queryCart(cartId: cartId)
        }
    }

    func queryCart(cartId: String) {
        Network.shared.apollo.fetch(query: AppSchema.QueryCartQuery(id: cartId)) { [weak self] result in
            switch result {
            case .success(let response):
                self!.cart = response.data?.cart?.fragments.cartCommon
                if (self!.cart == nil) {
                    Defaults[.cartId] = ""
                }

            case .failure(let error):
                print("error===\(error)")
            }
        }
    }

    func addProductsToCart(variantId: String) {
        if (cart != nil) {
            addProductsToExistCart(variantId: variantId)
        } else {
            createCart(variantId: variantId)
        }
    }

    func createCart(variantId: String) {
        let lines: [AppSchema.CartLineInput] = [AppSchema.CartLineInput(attributes: [AppSchema.AttributeInput(key: "cart_attribute", value: "This is a cart attribute")], quantity: 1, merchandiseId: variantId)]
        showLoading()
        Network.shared.apollo.perform(mutation: AppSchema.CreateCartMutation(input: AppSchema.CartInput(lines: .some(lines)))) {[weak self] result in
            hideLoading()
            switch result {
            case .success(let response):
                self!.cart = response.data?.cartCreate?.cart?.fragments.cartCommon
                Defaults[.cartId] = self!.cart?.id ?? ""
                self!.showToast = true
            case .failure(let error):
                print("error===\(error)")
            }
        }
    }

    func addProductsToExistCart(variantId: String) {
        let lines: [AppSchema.CartLineInput] = [AppSchema.CartLineInput(attributes: [AppSchema.AttributeInput(key: "cart_attribute", value: "This is a cart attribute")], quantity: 1, merchandiseId: variantId)]
        showLoading()
        Network.shared.apollo.perform(mutation: AppSchema.AddProductsToCartMutation(cartId: cart!.id, lines: lines)) {[weak self] result in
            hideLoading()
            switch result {
            case .success(let response):
                self!.cart = response.data?.cartLinesAdd?.cart?.fragments.cartCommon
                self!.showToast = true
            case .failure(let error):
                print("error===\(error)")
            }
        }
    }

    func updateProductQuantityInCart(quantity: Int) {
        showQty = false
        let lines: [AppSchema.CartLineUpdateInput] = [AppSchema.CartLineUpdateInput(id: variantId, quantity: .some(quantity))]
        showLoading()
        Network.shared.apollo.perform(mutation: AppSchema.UpdateProductQuantityInCartMutation(cartId: cart!.id, lines: lines)) {[weak self] result in
            hideLoading()
            switch result {
            case .success(let response):
                self!.cart = response.data?.cartLinesUpdate?.cart?.fragments.cartCommon
            case .failure(let error):
                print("error===\(error)")
            }
        }
    }

    func removeProductFromCart(variantId: String) {
        let lines: [String] = [variantId]
        showLoading()
        Network.shared.apollo.perform(mutation: AppSchema.RemoveProductFromCartMutation(cartId: cart!.id, lineIds: lines)) {[weak self] result in
            hideLoading()
            switch result {
            case .success(let response):
                self!.cart = response.data?.cartLinesRemove?.cart?.fragments.cartCommon
            case .failure(let error):
                print("error===\(error)")
            }
        }
    }

    func qtyPick(item: AppSchema.CartCommon.Lines.Edge?) {
        qtyIndex = 0
        variantId = item?.node.id ?? ""
        if item?.node.merchandise.asProductVariant?.quantityAvailable ?? 0 > 0 {
            for i in 1...(item?.node.merchandise.asProductVariant?.quantityAvailable)! {
                if i > 5 {
                    break
                }
                qtyList.append("\(i)")
            }
        }
        if qtyList.count == 0 {
            return
        } else {
            showQty = true
        }
    }

    func getCartQty() -> String {
        var text = ""
        let total = cart?.totalQuantity ?? 0
        if total == 0 {
            text = ""
        } else if total > 99 {
            text = "99+";
        } else {
            text = "\(total)"
        }
        return text
    }
}
