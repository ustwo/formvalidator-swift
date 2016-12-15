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
     Returns valid card types for a credit card number asynchronously.
    
     - Parameters:
      - creditCardNumber: Credit card number.
      - completion: Completion callback, returns valid card types for given number.
     */
    public func validCardTypes(`for` creditCardNumber: String, completion : @escaping (CreditCardType) -> Void) {
        
        DispatchQueue.global().async {
            
            var validCardTypes: CreditCardType = []
            defer {
                DispatchQueue.main.async {
                    completion(validCardTypes)
                }
            }
            
            let creditCardCondition = CreditCardCondition(cardType: .all)
            let trimmedCardNumber = String(creditCardNumber.characters.filter { $0 != " " })
            
            for cardType in CreditCardType.allArray {
                if let regex = try? NSRegularExpression(pattern: cardType.regex, options: .caseInsensitive),
                    creditCardCondition.check(trimmedCardNumber, withRegex: regex) {
                    validCardTypes.insert(cardType)
                }
            }
            
        }
        
        
    }
}
