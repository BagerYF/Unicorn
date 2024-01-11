//
//  ProductListVM.swift
//  Unicorn
//
//  Created by Bager on 2023/12/30.
//

import SwiftUI
import Foundation
import Combine
import AppSchema

final class ProductListVM: ObservableObject {

    @Published var isFinished = false

    @Published var isLoading: Bool = false

    var endCursor:String? = nil

    @Published var data:[AppSchema.CollectionQuery.Data.Collection.Products.Edge] = []

    @Published var showSortOrFilterView = false

    @Published var sortList: [ProductSortModel] = []

    @Published var sortModel = ProductSortModel(fromDictionary: ["name": "Most Relevant", "reverse": false, "sortKey": AppSchema.ProductCollectionSortKeys.relevance])


    @Published var allFilters: [AppSchema.CollectionQuery.Data.Collection.Products.Filter] = []
    var subFiltersName = ""
    var subFiltersIndex = 0
    @Published var subFilters: [AppSchema.CollectionQuery.Data.Collection.Products.Filter.Value] = []
    var currentFilters:[AppSchema.JSON] = [];

    init() {
        initData()
    }

    func initData() {
        self.data = []

        self.isFinished = false

        getData()

        if (sortList.isEmpty) {
            for item in kProductSortMap {
                let m = ProductSortModel.init(fromDictionary: item)
                if m.sortKey == .relevance {
                    m.selected = true
                }
                sortList.append(m)
            }
        }
    }

    func getData() {
        var tempfilters: [AppSchema.ProductFilter] = []

        for e in currentFilters {
            if let data = e.data(using: .utf8) {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
                    for (key, value) in json {
                        if key == "variantOption" {
                            let v = value as! [String:String]
                            let f = AppSchema.ProductFilter.init(variantOption: .some(AppSchema.VariantOptionFilter(name: v["name"] ?? "", value: v["value"] ?? "")))
                            tempfilters.append(f)
                        } else if key == "productVendor" {
                            let f = AppSchema.ProductFilter.init(productVendor: .some(value as! String))
                            tempfilters.append(f)
                        } else if key == "productType" {
                            let f = AppSchema.ProductFilter.init(productType: .some(value as! String))
                            tempfilters.append(f)
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }

        Network.shared.apollo.fetch(query: AppSchema.CollectionQuery(id: AppConstants.collectionGid, first: 6, after: endCursor != nil ? .some(endCursor!):nil, sortKey: .some(.case(sortModel.sortKey)), filters: .some(tempfilters), reverse: .some(sortModel.reverse)), cachePolicy: .fetchIgnoringCacheData) { result in
            switch result {
            case .success(let response):
                let tempData = response.data?.collection?.products.edges

                self.data.append(contentsOf: tempData!)

                self.endCursor = response.data?.collection?.products.pageInfo.endCursor

                self.isLoading = false

                if (response.data?.collection?.products.pageInfo.hasNextPage == false) {
                    print("no more data")
                    self.isFinished = true
                } else {
                    self.isFinished = false
                }

                self.initFilters(tempFilters: response.data?.collection?.products.filters ?? [])

            case .failure(let error):
                print("error===\(error)")
            }
        }
    }

    func sortClick(item: ProductSortModel) {
        sortModel = item
        showSortOrFilterView = false

        initData()
    }

    func initFilters(tempFilters: [AppSchema.CollectionQuery.Data.Collection.Products.Filter]) {
        if (allFilters.count == 0) {
            allFilters = tempFilters
            if (allFilters.count > 0) {
                var tempSubFilters = allFilters.first
                subFiltersName = tempSubFilters?.label ?? ""
                tempSubFilters?.selected = true
                subFilters = tempSubFilters?.values ?? [];
                allFilters[0] = tempSubFilters!
            }
        }
        else {
            allFilters = []
            allFilters = tempFilters;
            if (allFilters.count > subFiltersIndex) {
                allFilters[subFiltersIndex].selected = true
                subFilters = []
                subFilters = allFilters[subFiltersIndex].values
                for var (i,s) in subFilters.enumerated() {
                    for c in currentFilters {
                        if s.input == c {
                            subFilters[i].selected = true
                        }
                    }
                }
            }
        }
    }

    func leftFilterClick(index: Int) {
        for  (i,_) in allFilters.enumerated() {
            allFilters[i].selected = false
        }
        let e = allFilters[index]
        subFiltersName = e.label
        subFilters = e.values
        for  (i,s) in subFilters.enumerated() {
            for c in currentFilters {
                if s.input == c {
                    subFilters[i].selected = true
                }
            }
        }
        subFiltersIndex = index
        allFilters[index].selected = true
    }

    func rightFilterClick(index: Int) {
        subFilters[index].selected = !subFilters[index].selected
        let tempSubFilters = subFilters[index]
        if (tempSubFilters.selected) {
                //            let data = tempSubFilters.input.data(using: String.Encoding.utf8, allowLossyConversion: false) ?? Data()
                //            guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {
                //                 return
                //            }
            currentFilters.append(tempSubFilters.input)
        } else {
            for element in currentFilters {
                if (element == tempSubFilters.input) {
                    if let index = currentFilters.firstIndex(of: element) {
                        currentFilters.remove(at: index)
                    }
                    break;
                }
            }
        }

        initData()
    }

    func clearFilter() {
        if (currentFilters.count > 0) {
            for element in allFilters {
                for var e in element.values {
                    e.selected = false;
                }
            }
            currentFilters = [];

            initData()
        }
    }
}
