//
//  AlphanumericCondition.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  The `AlphanumericCondition` checks a string for occurrences of letters and/or numbers.
 */
public struct AlphanumericCondition: ConfigurableCondition {
    
    
    // MARK: - Properties
    
    public var localizedViolationString = StringLocalization.sharedInstance.localizedString("US2KeyConditionViolationAlphanumeric", comment: "")
    
    public let regex: String
    
    public var shouldAllowViolation = true
    
    public let configuration: AlphanumericConfiguration
    
    
    // MARK: - Initializers
    
    public init(configuration: AlphanumericConfiguration) {
        self.configuration = configuration
        
        let regexLettersNumbers = configuration.allowsUnicode ? "\\p{L}\\p{N}" : "a-zA-Z0-9"
        let regexWhiteSpace = configuration.allowsWhitespace ? "\\s" : ""
        
        regex = "[\(regexLettersNumbers)\(regexWhiteSpace)]"
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
