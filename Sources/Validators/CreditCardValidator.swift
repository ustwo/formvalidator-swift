//
//  CreditCardValidator.swift
//  FormValidatorSwift
//
//  Created by Onur Ersel on 2016-11-02.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation

/**
 *  The `CreditCardValidator` contains an `CreditCardCondition`. A valid string is a credit card number.
 *  - seealso: `CreditCardCondition`
 */
public struct CreditCardValidator: Validator {
    
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    /**
     Initializes a `CreditCardValidator` with all card types.
     */
    public init() {
        self.init(cardType: .all)
    }
    
    /**
     Initializes a `CreditCardValidator`.
     - parameter cardType: Credit card type.
     */
    public init(cardType: CreditCardType) {
        conditions = [CreditCardCondition(cardType: cardType)]
    }
    
    /// Return card types valid with number given.
    ///
    /// - Parameter creditCardNumber: Credit card number.
    /// - Returns: Valid card types.
    public func cardTypeOf (creditCardNumber: String) -> [CreditCardType] {
        
        var types = [CreditCardType]()
        
        if conditions.count == 0 || !(conditions[0] is CreditCardCondition) {
            return types
        }
        
        let creditCardCondition = conditions[0] as! CreditCardCondition
        let trimmedCardNumber = String(creditCardNumber.characters.filter{ $0 != " " })
        
        // American Express
        if let regex = try? NSRegularExpression(pattern: CreditCardType.americanExpress.regex, options: .caseInsensitive),
            creditCardCondition.check(trimmedCardNumber, withRegex: regex) {
            types.append(CreditCardType.americanExpress)
        }
        
        // Diner's Club
        if let regex = try? NSRegularExpression(pattern: CreditCardType.dinersClub.regex, options: .caseInsensitive),
            creditCardCondition.check(trimmedCardNumber, withRegex: regex) {
            types.append(CreditCardType.dinersClub)
        }
        
        // Discover
        if let regex = try? NSRegularExpression(pattern: CreditCardType.discover.regex, options: .caseInsensitive),
            creditCardCondition.check(trimmedCardNumber, withRegex: regex) {
            types.append(CreditCardType.discover)
        }
        
        // JCB
        if let regex = try? NSRegularExpression(pattern: CreditCardType.jcb.regex, options: .caseInsensitive),
            creditCardCondition.check(trimmedCardNumber, withRegex: regex) {
            types.append(CreditCardType.jcb)
        }
        
        // Maestro
        if let regex = try? NSRegularExpression(pattern: CreditCardType.maestro.regex, options: .caseInsensitive),
            creditCardCondition.check(trimmedCardNumber, withRegex: regex) {
            types.append(CreditCardType.maestro)
        }
        
        // Master Card
        if let regex = try? NSRegularExpression(pattern: CreditCardType.mastercard.regex, options: .caseInsensitive),
            creditCardCondition.check(trimmedCardNumber, withRegex: regex) {
            types.append(CreditCardType.mastercard)
        }
        
        // Visa
        if let regex = try? NSRegularExpression(pattern: CreditCardType.visa.regex, options: .caseInsensitive),
            creditCardCondition.check(trimmedCardNumber, withRegex: regex) {
            types.append(CreditCardType.visa)
        }
        
        return types
    }
}
