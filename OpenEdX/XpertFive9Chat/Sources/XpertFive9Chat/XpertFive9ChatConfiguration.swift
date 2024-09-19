//
//  XpertFive9ChatConfiguration.swift
//  XpertFive9Chat
//
//  Created by Anton Yarmolenka on 19/09/2024.
//

import Foundation

public struct XpertFive9ChatConfiguration {
    var appId: String
    var xpertKey: String
    var configID: String
    var useCase: String
    var segmentKey: String
    
    public init(appId: String, xpertKey: String, configID: String, useCase: String, segmentKey: String) {
        self.appId = appId
        self.xpertKey = xpertKey
        self.configID = configID
        self.useCase = useCase
        self.segmentKey = segmentKey
    }
}
