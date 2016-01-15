//
//  AlphabeticCondition.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 12/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


/**
 *  The `AlphabeticCondition` checks a string for occurrences of letters.
 */
public struct AlphabeticCondition: Condition {
    
    
    // MARK: - Properties
    
    public var localizedViolationString = StringLocalization.localizedString("US2KeyConditionViolationAlphabetic", comment: "")
    
    public let regex: String
    
    public var shouldAllowViolation = true
    
    /// Whether or not to allow whitespace.
    public let allowsWhitespace: Bool
    
    
    // MARK: - Initializers
    
    /**
    Initializes a `AlphabeticCondition` that does not allow whitespace.
    */
    public init() {
        self.init(allowsWhitespace: false)
    }
    
    /**
    Initializes a `AlphabeticCondition`.
    - parameter allowsWhitespace: Whether or not to allow whitespace.
    */
    public init(allowsWhitespace: Bool) {
        self.allowsWhitespace = allowsWhitespace
        
        if allowsWhitespace {
            regex = "[a-zA-Z\\s]"
        } else {
            regex = "[a-zA-Z]"
        }
    }
    
    
    // MARK: - Check
    
    public func check(text: String?) -> Bool {
        guard let sourceText = text
            where !sourceText.isEmpty,
            let regExpression = try? NSRegularExpression(pattern: regex, options: .CaseInsensitive) else {
                
                return false
        }
        
        return regExpression.numberOfMatchesInString(sourceText, options: [], range: NSRange(location: 0, length: sourceText.characters.count)) == sourceText.characters.count
    }
    
}
