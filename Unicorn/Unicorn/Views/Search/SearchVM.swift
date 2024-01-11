//
//  SearchVM.swift
//  Unicorn
//
//  Created by Bager on 2023/12/27.
//

import SwiftUI
import Foundation
import Combine
import Defaults

final class SearchVM: ObservableObject {

    var categoryList: [CategoryModel] = []
    var suggestList: [DesignerModel] = []
    var type = ""

    @Published var searchText: String = ""

    init() {
        kCategoryMaps.forEach { data in
            categoryList.append(CategoryModel(fromDictionary: data))
        }

        initSearchData()
    }

    func initSearchData() {
        searchText = ""
        suggestList = []
        let result = Defaults[.searchHistory]
        if result.isEmpty {
            type = "Suggested"
            kSuggestedMaps.forEach { name in
                suggestList.append(DesignerModel(names: name))
            }
        } else {
            type = "Search History"
            result.forEach { name in
                suggestList.append(DesignerModel(names: name))
            }
        }
    }

    func search() {
        if searchText.count == 0 {
            return
        }

        var result = Defaults[.searchHistory]

        for item in result {
            if item == searchText {
                result.remove(at: result.firstIndex(of: item)!)
                break
            }
        }
        result.insert(searchText, at: 0)
        if result.count == 6 {
            result.remove(at: 5)
        }
        Defaults[.searchHistory] = result

        initSearchData()
    }
}
