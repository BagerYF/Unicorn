//
//  DesignerVM.swift
//  Unicorn
//
//  Created by Bager on 2023/12/21.
//

import SwiftUI
import Foundation
import Combine

final class DesignerVM: ObservableObject {

    var designerList: [DesignerModel] = []

    init() {
        kDesigersMaps.forEach { name in
            designerList.append(DesignerModel(names: name))
        }
    }
}
