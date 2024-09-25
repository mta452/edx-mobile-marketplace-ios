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
