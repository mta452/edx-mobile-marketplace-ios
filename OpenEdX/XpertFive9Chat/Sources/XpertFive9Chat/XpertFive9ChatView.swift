//
//  XpertFive9ChatView.swift
//  XpertFive9Chat
//
//  Created by Anton Yarmolenka on 19/09/2024.
//

import SwiftUI

public struct XpertFive9ChatView: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var model: XpertFive9ChatViewModel
    @State var closeChat: Bool = false
    @State var openFive9: Bool = false
    
    public init(xpertConfig: XpertChatConfiguration, five9Config: Five9ChatConfiguration) {
        self._model = .init(wrappedValue: XpertFive9ChatViewModel(xpertConfig: xpertConfig, five9Config: five9Config))
    }
    
    public var body: some View {
        VStack {
            XpertFive9HTMLWebViewRepresentable(
                html: model.currentChatType == .xpert ? model.xpertHTML : model.five9HTML,
                baseURL: nil,
                closeChat: $closeChat,
                openFive9: $openFive9
            )
            .ignoresSafeArea(.keyboard)
        }
        .onChange(of: closeChat) { newValue in
            if newValue {
                dismiss()
                closeChat = false
            }
        }
        .onChange(of: openFive9) { newValue in
            if newValue {
                model.currentChatType = .five9
                openFive9 = false
            }
        }
    }
}

#if DEBUG
struct XpertFive9ChatView_Previews: PreviewProvider {
    static var previews: some View {
        let xpertConfig = XpertChatConfiguration(xpertKey: "", useCase: "", segmentKey: "")
        let five9Config = Five9ChatConfiguration(
            appId: "",
            configID: "",
            formSubtitle: "",
            userName: "",
            userFirstName: "",
            userLastName: "",
            userEmail: "",
            formFields: [],
            formdataLabel: "",
            emailLabel: "",
            questionLabel: ""
        )
        XpertFive9ChatView(xpertConfig: xpertConfig, five9Config: five9Config)
    }
}
#endif
