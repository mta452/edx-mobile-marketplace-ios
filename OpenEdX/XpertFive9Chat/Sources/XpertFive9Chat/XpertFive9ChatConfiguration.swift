//
//  XpertFive9ChatConfiguration.swift
//  XpertFive9Chat
//
//  Created by Anton Yarmolenka on 19/09/2024.
//

import Foundation

// Xpert
public struct XpertChatConfiguration {
    var xpertKey: String
    var useCase: String
    var segmentKey: String
    
    public init(xpertKey: String, useCase: String, segmentKey: String) {
        self.xpertKey = xpertKey
        self.useCase = useCase
        self.segmentKey = segmentKey
    }
}

// Five9
public enum Five9FormDataField {
    case contactName
    case contactEmail
    case question
    case formLabel
    case contactFirstName
    case contactLastName
}

public struct Five9ChatConfiguration {
    var appId: String
    var configID: String
    var formSubtitle: String
    var userName: String
    var userFirstName: String
    var userLastName: String
    var userEmail: String
    var formFields: [Five9FormDataField]
    var formdataLabel: String
    
    public init(
        appId: String,
        configID: String,
        formSubtitle: String,
        userName: String,
        userFirstName: String,
        userLastName: String,
        userEmail: String,
        formFields: [Five9FormDataField],
        formdataLabel: String
    ) {
        self.appId = appId
        self.configID = configID
        self.formSubtitle = formSubtitle
        self.userName = userName
        self.userFirstName = userFirstName
        self.userLastName = userLastName
        self.userEmail = userEmail
        self.formFields = formFields
        self.formdataLabel = formdataLabel
    }
}
