//
//  PostcodeCondition.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  The `PostcodeCondition` checks a string for a post code.
 */
public struct PostcodeCondition: ConfigurableCondition {
    
    
    // MARK: - Properties
    
    public var localizedViolationString = StringLocalization.sharedInstance.localizedString("US2KeyConditionViolationPostcodeUK", comment: "")
    
    public var regex: String {
        return configuration.country.regex
    }
    
    public var shouldAllowViolation = true
    
    public var configuration: PostcodeConfiguration
    
    
    // MARK: - Initializer
    
    public init(configuration: PostcodeConfiguration) {
        self.configuration = configuration
    }
    
}
