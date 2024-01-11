//
//  HomeVM.swift
//  Unicorn
//
//  Created by Bager on 2023/12/29.
//

import SwiftUI
import Foundation
import Combine

final class HomeVM: ObservableObject {

    var sectionList: [HomeModel] = []

    init() {
        kHomeMaps.forEach { data in
            sectionList.append(HomeModel(fromDictionary: data))
        }
    }
}
