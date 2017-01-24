//
//  CreditCardConditionTests.swift
//  FormValidatorSwift
//
//  Created by Onur Ersel on 2016-11-02.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class CreditCardConditionTests: XCTestCase {
    
    
    // MARK: - Properties
    
    // Conditions
    let conditionAll                = CreditCardCondition()
    
    let cardNumberWhitespace        = "3760 3171  0126       369"
    let cardNumberDashes            = "3760-3171-0126-369"
    let cardNumberDigitsAndChars    = "3760Das3171Uyn0126‘[Æº369"
    
    // Invalid Card Numbers
    let cardNumberInvalid_1         = "0000000000000000"
    let cardNumberInvalid_2         = "67628 568"
    
    // Condition - Valid Card Number pairs
    let cardConditionsAndNumbers: [(CreditCardType, CreditCardCondition, String)] = [
        (CreditCardType.americanExpress,    CreditCardCondition(configuration: CreditCardConfiguration(cardType: .americanExpress)),        "376031710126369"),
        (CreditCardType.dinersClub,         CreditCardCondition(configuration: CreditCardConfiguration(cardType: .dinersClub)),             "30085182354725"),
        (CreditCardType.discover,           CreditCardCondition(configuration: CreditCardConfiguration(cardType: .discover)),               "6011359046468736"),
        (CreditCardType.jcb,                CreditCardCondition(configuration: CreditCardConfiguration(cardType: .jcb)),                    "3535983484092395"),
        (CreditCardType.maestro,            CreditCardCondition(configuration: CreditCardConfiguration(cardType: .maestro)),                "6762856858323942"),
        (CreditCardType.mastercard,         CreditCardCondition(configuration: CreditCardConfiguration(cardType: .mastercard)),             "5480785928215247"),
        (CreditCardType.visa,               CreditCardCondition(configuration: CreditCardConfiguration(cardType: .visa)),                   "4024007127428075"),
    ]
    
    
    
    // MARK: - Test Success
    
    func testCreditCardCondition_Success() {
        // Given
        let expectedResult = true
        
        // Test
        for pair in cardConditionsAndNumbers {
            AssertCondition(conditionAll, testInput: pair.2, expectedResult: expectedResult)
        }
        
        for pair in cardConditionsAndNumbers {
            AssertCondition(pair.1, testInput: pair.2, expectedResult: expectedResult)
        }
        
        for card in cardConditionsAndNumbers {
            for pair in cardConditionsAndNumbers {
                AssertCondition(card.1, testInput: pair.2,   expectedResult: (pair.0 == card.0))
            }
        }
        
        
        
        AssertCondition(conditionAll, testInput: cardNumberWhitespace, expectedResult: expectedResult)
        AssertCondition(conditionAll, testInput: cardNumberDashes, expectedResult: expectedResult)
        AssertCondition(conditionAll, testInput: cardNumberDigitsAndChars, expectedResult: expectedResult)
    }
    
    
    // MARK: - Test Failure
    
    func testCreditCardCondition_Failure () {
        // Given
        let expectedResult = false
        
        // Test
        AssertCondition(conditionAll, testInput: cardNumberInvalid_1, expectedResult: expectedResult)
        AssertCondition(conditionAll, testInput: cardNumberInvalid_2, expectedResult: expectedResult)
    }
}
