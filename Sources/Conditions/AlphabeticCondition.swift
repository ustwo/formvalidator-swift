//
//  AlphabeticCondition.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 12/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  The `AlphabeticCondition` checks a string for occurrences of letters.
 */
public struct AlphabeticCondition: ConfigurableCondition {
    
    
    // MARK: - Properties
    
    public var localizedViolationString = StringLocalization.sharedInstance.localizedString("US2KeyConditionViolationAlphabetic", comment: "")
    
    public let regex: String
    
    public var shouldAllowViolation = true
    
    public let configuration: AlphabeticConfiguration
    
    
    // MARK: - Initializers
    
    public init(configuration: AlphabeticConfiguration) {
        self.configuration = configuration
        
        let regexLetters = configuration.allowsUnicode ? "\\p{L}" : "a-zA-Z"
        let regexWhiteSpace = configuration.allowsWhitespace ? "\\s" : ""
        
        regex = "[\(regexLetters)\(regexWhiteSpace)]"
    }
    
    
    // MARK: - Check
    
    public func check(_ text: String?) -> Bool {
        guard let sourceText = text,
            !sourceText.isEmpty,
            let regExpression = try? NSRegularExpression(pattern: regex, options: .caseInsensitive) else {
                
                return false
        }
        
        return regExpression.numberOfMatches(in: sourceText, options: [], range: NSRange(location: 0, length: sourceText.count)) == sourceText.count
    }
    
}
