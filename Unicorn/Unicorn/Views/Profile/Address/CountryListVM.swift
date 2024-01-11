//
//  CountryListVM.swift
//  Unicorn
//
//  Created by Bager on 2024/1/7.
//

import SwiftUI

import AppSchema
import Kingfisher
import Defaults

final class CountryListVM: ObservableObject {

    @Published var searchText: String = ""

    @Published var allList:[CountryModel] = []

    @Published var showData:[String:[CountryModel]] = [:]

    @Published var group:[AlphabetModel] = []

    @Published var selectCode = ""

    @Published var groupStr:[String] = []

    @Published var isCountryOrState = true // true: country, false: state

    
    func searchData() {
        showData = [:]
        for item in allList {
            if showData.keys.contains(item.firstCharacter) {
                var tempList = showData[item.firstCharacter]!
                if searchText.count > 0 {
                    if item.name.lowercased().contains(searchText.lowercased()) {
                        tempList.append(item)
                    }
                } else {
                    tempList.append(item)
                }
                showData.updateValue(tempList, forKey: item.firstCharacter)
            } else {
                if item.isCharacter {
                    var tempList:[CountryModel] = [];
                    if searchText.count > 0 {
                        if item.name.lowercased().contains(searchText.lowercased()) {
                            tempList.append(item)
                            showData[item.firstCharacter] = tempList
                        }
                    } else {
                        tempList.append(item)
                        showData[item.firstCharacter] = tempList
                    }
                } else {
                    if showData.keys.contains("#") {
                        var tempList = showData["#"]!
                        if searchText.count > 0 {
                            if item.name.lowercased().contains(searchText.lowercased()) {
                                tempList.append(item)
                            }
                        } else {
                            tempList.append(item)
                        }
                        showData.updateValue(tempList, forKey: "#")
                    } else {
                        var tempList:[CountryModel] = [];
                        if searchText.count > 0 {
                            if item.name.lowercased().contains(searchText.lowercased()) {
                                tempList.append(item)
                                showData["#"] = tempList
                            }
                        } else {
                            tempList.append(item)
                            showData["#"] = tempList
                        }
                    }
                }
            }
        }

        group = []
        groupStr = []
        for key in showData.keys {
            group.append(AlphabetModel(name: key))
            groupStr.append(key)
            group = group.sorted(by: { a1, a2 in
                a1.name < a2.name
            })
            groupStr = groupStr.sorted()
        }
    }

}
