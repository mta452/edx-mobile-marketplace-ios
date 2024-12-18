//
//  FullStoryConfig.swift
//  Core
//
//  Created by Shafqat Muneer on 12/16/24.
//

import Foundation
import OEXFoundation

private enum Keys: String, RawStringExtractable {
    case enabled = "ENABLED"
    case orgID = "ORG_ID"
}

public final class FullStoryConfig {
    public var enabled: Bool = false
    public var orgID: String = ""
    
    init(dictionary: [String: AnyObject]) {
        orgID = dictionary[Keys.orgID] as? String ?? ""
        enabled = !orgID.isEmpty && dictionary[Keys.enabled] as? Bool ?? false
    }
}

private let configKey = "FULLSTORY"
extension Config {
    public var fullStory: FullStoryConfig {
        FullStoryConfig(dictionary: self[configKey] as? [String: AnyObject] ?? [:])
    }
}
