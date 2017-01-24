//
//  URLShorthandCondition.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  The `URLShorthandCondition` checks a string for a valid URL.
 *  - note: No scheme (protocol) is needed for a valid URL. If you want a check for more strict URLs see `URLCondition`.
 */
public struct URLShorthandCondition: Condition {
    
    
    // MARK: - Properties
    
    public var localizedViolationString = StringLocalization.sharedInstance.localizedString("US2KeyConditionViolationShorthandURL", comment: "")
    
    public let regex = "^((https?)://)?[a-z0-9-]+(\\.[a-z0-9-]+)+([/?].*)?$"
    
    public var shouldAllowViolation = true
    
    
    // MARK: - Initializers
    
    public init() { }
    
}
