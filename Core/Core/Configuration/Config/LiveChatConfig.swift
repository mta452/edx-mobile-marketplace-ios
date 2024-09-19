//
//  LiveChatConfig.swift
//  Core
//
//  Created by Anton Yarmolenka on 19/09/2024.
//

import Foundation

private enum Keys: String, RawStringExtractable {
    case enabled = "ENABLED"
    case xpertKey = "XPERTKEY"
    case useCase = "USECASE"
    case segmentKey = "SEGMENTKEY"
    case appId = "APPID"
    case configId = "CONFIGID"
}

public final class LiveChatConfig {
    public var enabled: Bool = false
    public var xpertKey: String = ""
    public var useCase: String = ""
    public var segmentKey: String = ""
    public var appId: String = ""
    public var configId: String = ""
    
    init(dictionary: [String: AnyObject]) {
        xpertKey = dictionary[Keys.xpertKey] as? String ?? ""
        useCase = dictionary[Keys.useCase] as? String ?? ""
        segmentKey = dictionary[Keys.segmentKey] as? String ?? ""
        appId = dictionary[Keys.appId] as? String ?? ""
        configId = dictionary[Keys.configId] as? String ?? ""
        enabled = !xpertKey.isEmpty && dictionary[Keys.enabled] as? Bool ?? false
    }
}

private let configKey = "XPERT_FIVE9"
extension Config {
    public var liveChat: LiveChatConfig {
        LiveChatConfig(dictionary: self[configKey] as? [String: AnyObject] ?? [:])
    }
}
