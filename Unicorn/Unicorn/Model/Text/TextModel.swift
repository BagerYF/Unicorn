//
//  TextModel.swift
//  Unicorn
//
//  Created by Bager on 2023/12/29.
//

import SwiftUI

struct TextModel: Identifiable {
    let id = UUID()
    let name: String

    init(names: String){
        name = names
    }
}
