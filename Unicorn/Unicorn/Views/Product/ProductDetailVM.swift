//
//  ProductDetailVM.swift
//  Unicorn
//
//  Created by Bager on 2023/12/30.
//

import SwiftUI
import Foundation
import Combine
import AppSchema

final class ProductDetailVM: ObservableObject {

    var id: String = ""
    @Published var product: AppSchema.GetProductByIdQuery.Data.Product?
    @Published var variant: AppSchema.GetProductByIdQuery.Data.Product.Variants.Edge?
    @Published var variants: [AppSchema.GetProductByIdQuery.Data.Product.Variants.Edge] = []
    @Published var recommendedData : [AppSchema.ProductRecommendationsQuery.Data.ProductRecommendation] = []
    @Published var images: [AppSchema.GetProductByIdQuery.Data.Product.Images.Edge] = []

    @Published var showSize = false

    @Published var variantIndex = 0
    @Published var variantEnable = false

    func getData(id: String) {
        self.id = id

        getData()
    }

    func getData() {
        Network.shared.apollo.fetch(query: AppSchema.GetProductByIdQuery(id: id), cachePolicy: .fetchIgnoringCacheData) { [self] result in
            switch result {
            case .success(let response):
                self.product = response.data?.product
                self.images = self.product?.images.edges ?? []
                self.variants = response.data?.product?.variants.edges ?? []
                self.initData()
            case .failure(let error):
                print("error===\(error)")
            }
        }
    }

    func initData() {
        for (i,item) in (product?.variants.edges ?? []).enumerated() {
            if item.node.quantityAvailable ?? 0 > 0 {
                variantIndex = i
                variant = item
                variantEnable = true
                print(i)
                break
            }
        }
        getRecommendedData()
    }

    func getRecommendedData() {
        Network.shared.apollo.fetch(query: AppSchema.ProductRecommendationsQuery(productId: product?.id ?? ""), cachePolicy: .fetchIgnoringCacheData) { [self] result in
            switch result {
            case .success(let response):
                self.recommendedData = response.data?.productRecommendations ?? []
            case .failure(let error):
                print("error===\(error)")
            }
        }
    }

    func sizeClick() {
        if variantEnable == true {
            variant = variants[variantIndex]
            showSize = false
        }
    }

    func sizeChange() {
        let v = variants[variantIndex]
        if v.node.quantityAvailable ?? 0 > 0 {
            variantEnable = true
        } else {
            variantEnable = false
        }
    }
}
