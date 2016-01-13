//
//  AlphanumericCondition.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


/**
 *  The `AlphanumericCondition` checks a string for occurrences of letters and/or numbers.
 */
public struct AlphanumericCondition: Condition {
    
    
    // MARK: - Properties
    
    public var localizedViolationString = StringLocalization.localizedString("US2KeyConditionViolationAlphanumeric", comment: "")
    
    public let regex = "[a-zA-Z0-9]"
    
    public var shouldAllowViolation = true
    
    
    // MARK: - Check
    
    public func check(text: String?) -> Bool {
        guard let sourceText = text
            where !sourceText.isEmpty,
            let regExpression = try? NSRegularExpression(pattern: regex, options: .CaseInsensitive) else {
                
                return false
        }
        
        return regExpression.numberOfMatchesInString(sourceText, options: [], range: NSRange(location: 0, length: sourceText.utf16.count)) == sourceText.utf16.count
    }
    
}
