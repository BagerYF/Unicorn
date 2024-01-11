//
//  DesignerAllVM.swift
//  Unicorn
//
//  Created by Bager on 2023/12/22.
//

import SwiftUI
import Foundation
import Combine

final class DesignerListVM: ObservableObject {

    @Published var searchText: String = ""

    var allList:[DesignerModel] = []
    @Published var showData:[String:[DesignerModel]] = [:]
    @Published var group:[AlphabetModel] = []
    @Published var groupStr:[String] = []

    init() {
        for k in kDesignersAllMaps.keys.sorted() {
            let m = DesignerModel(names: k)
            allList.append(m)
        }

        searchData()
    }

    func searchData() {
        showData = [:];
        for designer in allList {
            if showData.keys.contains(designer.firstCharacter) {
                var tempList = showData[designer.firstCharacter]!
                if searchText.count > 0 {
                    if designer.name.lowercased().contains(searchText.lowercased()) {
                        tempList.append(designer)
                    }
                } else {
                    tempList.append(designer)
                }
                showData.updateValue(tempList, forKey: designer.firstCharacter)
            } else {
                if designer.isCharacter {
                    var tempList:[DesignerModel] = [];
                    if searchText.count > 0 {
                        if designer.name.lowercased().contains(searchText.lowercased()) {
                            tempList.append(designer)
                            showData[designer.firstCharacter] = tempList
                        }
                    } else {
                        tempList.append(designer)
                        showData[designer.firstCharacter] = tempList
                    }
                } else {
                    if showData.keys.contains("#") {
                        var tempList = showData["#"]!
                        if searchText.count > 0 {
                            if designer.name.lowercased().contains(searchText.lowercased()) {
                                tempList.append(designer)
                            }
                        } else {
                            tempList.append(designer)
                        }
                        showData.updateValue(tempList, forKey: "#")
                    } else {
                        var tempList:[DesignerModel] = [];
                        if searchText.count > 0 {
                            if designer.name.lowercased().contains(searchText.lowercased()) {
                                tempList.append(designer)
                                showData["#"] = tempList
                            }
                        } else {
                            tempList.append(designer)
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
