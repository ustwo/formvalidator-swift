//
//  PresentCondition.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation

/**
 *  The `PresentCondition` checks for the presence of a string.
 */
public struct PresentCondition: Condition {
    
    
    // MARK: - Properties
    
    public var localizedViolationString = StringLocalization.sharedInstance.localizedString("US2KeyConditionViolationPresent", comment: "")
    
    public let regex = ""
    
    public var shouldAllowViolation = true
    
    
    // MARK: - Initializers
    
    public init() { }
    
    
    // MARK: - Check
    
    public func check(_ text: String?) -> Bool {
        guard let sourceText = text else {
            return false
        }
        
        return !sourceText.isEmpty
    }
    
}
