//
//  XpertFive9HTMLWebViewRepresentable.swift
//  XpertFive9Chat
//
//  Created by Anton Yarmolenka on 19/09/2024.
//

import Foundation
import SwiftUI
import WebKit

enum WKScriptEvent: String {
    case closeChat
    case openChat
    case shouldOpenFive9
}

struct XpertFive9HTMLWebViewRepresentable: UIViewRepresentable {
    var html: String?
    var baseURL: URL?
    @Binding var closeChat: Bool
    @Binding var openFive9: Bool
    
    init(html: String?, baseURL: URL?, closeChat: Binding<Bool>, openFive9: Binding<Bool>) {
        self.html = html
        self.baseURL = baseURL
        self._closeChat = closeChat
        self._openFive9 = openFive9
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences.preferredContentMode = .mobile
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.navigationDelegate = context.coordinator
        webView.uiDelegate = context.coordinator
        webView.backgroundColor = .clear
        
        webView.configuration.userContentController.add(
            context.coordinator,
            name: WKScriptEvent.closeChat.rawValue
        )
        webView.configuration.userContentController.add(
            context.coordinator,
            name: WKScriptEvent.shouldOpenFive9.rawValue
        )
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
//        context.coordinator.wkWebview = webView
        if let html = html {
            webView.loadHTMLString(html, baseURL: baseURL)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        let coordinator: Coordinator = Coordinator(closeChat: $closeChat, openFive9: $openFive9)
        return coordinator
    }
    
    static func dismantleUIView(_ uiView: WKWebView, coordinator: Coordinator) {
        uiView.configuration.userContentController.removeScriptMessageHandler(
            forName: WKScriptEvent.closeChat.rawValue
        )
        uiView.configuration.userContentController.removeScriptMessageHandler(
            forName: WKScriptEvent.shouldOpenFive9.rawValue
        )
    }
}

extension XpertFive9HTMLWebViewRepresentable {
    class Coordinator: NSObject, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {
        @Binding var closeChat: Bool
        @Binding var openFive9: Bool
        
        init(closeChat: Binding<Bool>, openFive9: Binding<Bool>) {
            self._closeChat = closeChat
            self._openFive9 = openFive9
        }
//        weak var wkWebview: WKWebView?
        
        func userContentController(
            _ userContentController: WKUserContentController,
            didReceive message: WKScriptMessage
        ) {
            if message.name == WKScriptEvent.closeChat.rawValue {
                if !closeChat {
                    closeChat = true
                }
            }
            if message.name == WKScriptEvent.shouldOpenFive9.rawValue {
                if !openFive9 {
                    openFive9 = true
                }
            }
        }
    }
}
