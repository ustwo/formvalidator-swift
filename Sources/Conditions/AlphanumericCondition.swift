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
    
    public var localizedViolationString = StringLocalization.sharedInstance.localizedString("US2KeyConditionViolationAlphanumeric", comment: "")
    
    public let regex: String
    
    public var shouldAllowViolation = true
    
    /// Whether or not to allow Unicode letters and numbers. If `false` then only ASCII letters (A-Z, a-z, 0-9) are allowed.
    public let allowsUnicode: Bool
    /// Whether or not to allow whitespace.
    public let allowsWhitespace: Bool
    
    
    // MARK: - Initializers
    
    public init() {
        self.init(allowsUnicode: false, allowsWhitespace: false)
    }
    
    /// Initializes an `AlphanumericCondition`.
    ///
    /// - Parameters:
    ///   - allowsUnicode: Whether or not to allow Unicode letters and numbers. If `false` then only ASCII letters (A-Z, a-z, 0-9) are allowed. Default is `false`.
    ///   - allowsWhitespace: Whether or not to allow whitespace. Default is false.
    public init(allowsUnicode: Bool = false, allowsWhitespace: Bool = false) {
        self.allowsWhitespace = allowsWhitespace
        self.allowsUnicode = allowsUnicode
        
        let regexLettersNumbers = allowsUnicode ? "\\p{L}\\p{N}" : "a-zA-Z0-9"
        let regexWhiteSpace = allowsWhitespace ? "\\s" : ""
        
        regex = "[\(regexLettersNumbers)\(regexWhiteSpace)]"
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
