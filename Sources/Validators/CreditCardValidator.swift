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
    
    
    /**
     Returns card types which are valid with given number.
    
     - Parameters:
      - creditCardNumber: Credit card number.
      - completion: Completion callback, returns valid card types for given number.
     */
    public func cardTypeOf (creditCardNumber: String, completion : @escaping (CreditCardType) -> Void) {
        
        
        DispatchQueue.global().async {
            
            var types: CreditCardType = []
            defer {
                DispatchQueue.main.async {
                    completion(types)
                }
            }
            
            let creditCardCondition = CreditCardCondition(cardType: .all)
            let trimmedCardNumber = String(creditCardNumber.characters.filter { $0 != " " })
            
            let cardTypes: [CreditCardType] = [.americanExpress, .dinersClub, .discover, .jcb, .maestro, .mastercard, .visa]
            for type in cardTypes {
                if let regex = try? NSRegularExpression(pattern: type.regex, options: .caseInsensitive),
                    creditCardCondition.check(trimmedCardNumber, withRegex: regex) {
                    types.insert(type)
                }
            }
            
        }
        
        
    }
}
