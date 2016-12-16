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
    
    public var localizedViolationString = StringLocalization.sharedInstance.localizedString("US2KeyConditionViolationAlphabetic", comment: "")
    
    public let regex: String
    
    public var shouldAllowViolation = true
    
    /// Whether or not to allow Unicode letters. If `false` then only ASCII letters (A-Z, a-z) are allowed.
    public let allowsUnicode: Bool
    /// Whether or not to allow whitespace.
    public let allowsWhitespace: Bool
    
    
    // MARK: - Initializers
    
    /**
    Initializes a `AlphabeticCondition` that does not allow Unicode or whitespace.
    */
    public init() {
        self.init(allowsUnicode: false, allowsWhitespace: false)
    }
    
    /**
    Initializes a `AlphabeticCondition`.
    - parameter allowsUnicode: Whether or not to allow Unicode letters. If `false` then only ASCII letters (A-Z, a-z) are allowed. Default is `false`.
    - parameter allowsWhitespace: Whether or not to allow whitespace. Default is `false`.
    */
    public init(allowsUnicode: Bool = false, allowsWhitespace: Bool = false) {
        self.allowsWhitespace = allowsWhitespace
        self.allowsUnicode = allowsUnicode
        
        let regexLetters = allowsUnicode ? "\\p{L}" : "a-zA-Z"
        let regexWhiteSpace = allowsWhitespace ? "\\s" : ""
        
        regex = "[\(regexLetters)\(regexWhiteSpace)]"
    }
    
    
    // MARK: - Check
    
    public func check(_ text: String?) -> Bool {
        guard let sourceText = text,
            !sourceText.isEmpty,
            let regExpression = try? NSRegularExpression(pattern: regex, options: .caseInsensitive) else {
                
                return false
        }
        
        return regExpression.numberOfMatches(in: sourceText, options: [], range: NSRange(location: 0, length: sourceText.characters.count)) == sourceText.characters.count
    }
    
}
