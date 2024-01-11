//
//  NavigationLazyView.swift
//  Unicorn
//
//  Created by Bager on 2024/1/2.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
