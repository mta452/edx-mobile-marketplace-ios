// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public class XpertFive9Chat {
    @MainActor
    public class func show(on topController: UIViewController, config: XpertFive9ChatConfiguration, animated: Bool) {
        let chatView = XpertFive9ChatView(configuration: config)
        let controller = UIHostingController(rootView: chatView)
        controller.modalTransitionStyle = .coverVertical
        controller.modalPresentationStyle = .pageSheet
        topController.present(controller, animated: animated)
    }
}
