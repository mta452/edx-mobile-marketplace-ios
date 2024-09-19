//
//  XpertFive9HTMLWebViewRepresentable.swift
//  XpertFive9Chat
//
//  Created by Anton Yarmolenka on 19/09/2024.
//

import Foundation
import SwiftUI
import WebKit

struct XpertFive9HTMLWebViewRepresentable: UIViewRepresentable {
    var html: String?
    var baseURL: URL?
    
    init(html: String?, baseURL: URL?) {
        self.html = html
        self.baseURL = baseURL
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences.preferredContentMode = .mobile
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.navigationDelegate = context.coordinator
        webView.uiDelegate = context.coordinator
        webView.backgroundColor = .clear
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
//        context.coordinator.wkWebview = webView
        if let html = html {
            webView.loadHTMLString(html, baseURL: baseURL)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        let coordinator: Coordinator = Coordinator()
        return coordinator
    }
    
}

extension XpertFive9HTMLWebViewRepresentable {
    class Coordinator: NSObject, WKNavigationDelegate, WKUIDelegate {
//        weak var wkWebview: WKWebView?
    }
}
