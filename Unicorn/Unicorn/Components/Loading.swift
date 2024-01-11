    //
    //  SwiftUIView.swift
    //  Unicorn
    //
    //  Created by Bager on 2023/12/31.
    //

import SwiftUI
import ActivityIndicatorView

struct Loading: View {
    @State private var progress = 0.2

    @State private var showLoadingIndicator: Bool = true

    var body: some View {
        ActivityIndicatorView(isVisible:$showLoadingIndicator, type:
                .growingArc(.black, lineWidth: 2)
        )
        .frame(width: 30, height: 30)
    }
}

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.black)
    }
}

func showLoading() {
    UserDefaults.standard.setValue(true, forKey: "appshowloading")
}

func hideLoading() {
    UserDefaults.standard.setValue(false, forKey: "appshowloading")
}
