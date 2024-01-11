//
//  InputModel.swift
//  Unicorn
//
//  Created by Bager on 2024/1/4.
//

import SwiftUI

class InputModel: ObservableObject, Identifiable {
    let id = UUID()
    @Published var title: String
    @Published var text: String = ""
    @Published var optional: Bool = false
    @Published var line: Bool = true
    @Published var error: String?
    @Published var showError = false
    @Published var requireds = true
    @Published var callBack: CallBacks?
    @Published var leftImg: String?
    @Published var rightImg: String?
    @Published var show = true
    @Published var placeHolder: String?
    @Published var hideTitle = false
    @Published var lineColor = Color(.black)

    init(title: String, text: String = "", optional: Bool = false, line: Bool = true, error: String? = nil, showError: Bool = false, requireds: Bool = true, callBack: CallBacks? = nil, leftImg: String? = nil, rightImg: String? = nil, show: Bool = true, placeHolder: String = "", hideTitle: Bool = false, lineColor: Color = Color(.black)) {
        self.title = title
        self.text = text
        self.optional = optional
        self.line = line
        self.error = error
        self.showError = showError
        self.requireds = requireds
        self.callBack = callBack
        self.leftImg = leftImg
        self.rightImg = rightImg
        self.show = show
        self.placeHolder = placeHolder
        self.hideTitle = hideTitle
        self.lineColor = lineColor
    }
}
