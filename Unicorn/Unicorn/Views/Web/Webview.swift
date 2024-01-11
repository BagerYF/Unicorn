//
//  Webview.swift
//  Unicorn
//
//  Created by Bager on 2024/1/11.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    let url: URL

    func makeUIView(context: Context) -> WKWebView {

        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {

        let request = URLRequest(url: url)
        webView.load(request)
    }
}

//        WebView(url: URL(string: "https://google.com.hk")!)

