//
//  CreditCardCondition.swift
//  FormValidatorSwift
//
//  Created by Onur Ersel on 02/11/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  The `CreditCardCondition` checks a string for a credit card number.
 */
public struct CreditCardCondition: ConfigurableCondition {
    
    // MARK: - Properties
    
    public var localizedViolationString = StringLocalization.sharedInstance.localizedString("US2KeyConditionViolationCreditCard", comment: "")
    
    public var regex: String {
        return configuration.cardType.regex
    }
    
    public var shouldAllowViolation = true
    
    public var configuration: CreditCardConfiguration
    
    
    // MARK: - Initializers
    
    public init(configuration: CreditCardConfiguration) {
        self.configuration = configuration
    }
    
    
    // MARK: - Check
    
    /**
     Checks if the string is a valid credit card number, after removes all whitespace.
     */
    public func check(_ text: String?) -> Bool {
        guard let sourceText = text,
            let regExp = try? NSRegularExpression(pattern: self.regex, options: .caseInsensitive) else {
            return false
        }
        
        let sourceTextNs = sourceText as NSString
        let trimmedText = sourceTextNs.replacingOccurrences(of: "\\D", with: "", options: .regularExpression, range: NSRange(location: 0, length: sourceTextNs.length)) as String
        
        return check(trimmedText, withRegex: regExp)
    }
    
    public func check(_ trimmedText: String, withRegex regExp: NSRegularExpression) -> Bool {
        return regExp.firstMatch(in: trimmedText, options: [], range: NSRange(location: 0, length: trimmedText.count)) != nil
    }
}
