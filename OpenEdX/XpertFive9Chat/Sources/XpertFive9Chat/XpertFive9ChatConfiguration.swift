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
    
    func formDataString(emailLabel: String, questionLabel: String) -> String {
        var formDataString: String = ""
        formDataString.append("{")
        switch self {
        case .contactName:
            formDataString.append(
                """
                "label": "Name",
                "cav": "contact.name",
                "formType": "both",
                "type": "text",
                "required": true,
                "readOnly": false,
                "value": "###NAME###"
                """
            )
        case .contactEmail:
            formDataString.append(
                """
                "label": "\(emailLabel)",
                "cav": "contact.email",
                "formType": "both",
                "type": "email",
                "required": true,
                "value": "###EMAIL###"
                """
            )
        case .question:
            formDataString.append(
                """
                "label": "\(questionLabel)",
                "cav": "Question",
                "formType": "both",
                "type": "textarea",
                "required": true,
                "readOnly": false
                """
            )
        case .formLabel:
            formDataString.append(
                """
                "type": "static text",
                "formType": "both",
                "required": false,
                "label": '###LABEL###'
                """
            )
        case .contactFirstName:
            formDataString.append(
                """
                "label": "First Name",
                "cav": "contact.firstName",
                "formType": "both",
                "type": "text",
                "required": true,
                "readOnly": false,
                "value": "###FIRSTNAME###"
                """
            )
        case .contactLastName:
            formDataString.append(
                """
                "label": "Last Name",
                "cav": "contact.lastName",
                "formType": "both",
                "type": "text",
                "required": true,
                "readOnly": false,
                "value": "###LASTNAME###"
                """
            )
        }
        formDataString.append("},")
        return formDataString
    }
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
    var emailLabel: String
    var questionLabel: String
    
    public init(
        appId: String,
        configID: String,
        formSubtitle: String,
        userName: String,
        userFirstName: String,
        userLastName: String,
        userEmail: String,
        formFields: [Five9FormDataField],
        formdataLabel: String,
        emailLabel: String,
        questionLabel: String
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
        self.emailLabel = emailLabel
        self.questionLabel = questionLabel
    }
}
