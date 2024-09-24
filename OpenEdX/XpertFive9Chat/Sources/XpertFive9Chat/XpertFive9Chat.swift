// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public class XpertFive9Chat {
    @MainActor
    public class func show(
        on topController: UIViewController,
        xpertConfig: XpertChatConfiguration,
        five9Config: Five9ChatConfiguration,
        animated: Bool
    ) {
        let chatView = XpertFive9ChatView(xpertConfig: xpertConfig, five9Config: five9Config)
        let controller = UIHostingController(rootView: chatView)
        controller.modalTransitionStyle = .coverVertical
        controller.modalPresentationStyle = .automatic
        topController.present(controller, animated: animated)
    }
}
