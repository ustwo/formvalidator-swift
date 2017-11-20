//
//  CreditCardValidator.swift
//  FormValidatorSwift
//
//  Created by Onur Ersel on 02/11/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation

/**
 *  The `CreditCardValidator` contains an `CreditCardCondition`. A valid string is a credit card number.
 *  - seealso: `CreditCardCondition`
 */
public struct CreditCardValidator: ConfigurableValidator {
    
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init(configuration: CreditCardConfiguration) {
        conditions = [CreditCardCondition(configuration: configuration)]
    }
    
    
    // MARK: - Validity
    
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
            
            let creditCardCondition = CreditCardCondition()
            let trimmedCardNumber = String(creditCardNumber.filter { $0 != " " })
            
            for cardType in CreditCardType.allArray {
                if let regex = try? NSRegularExpression(pattern: cardType.regex, options: .caseInsensitive),
                    creditCardCondition.check(trimmedCardNumber, withRegex: regex) {
                    validCardTypes.insert(cardType)
                }
            }
            
        }
        
        
    }
}
