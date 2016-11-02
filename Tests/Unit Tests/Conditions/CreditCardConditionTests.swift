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
    let conditionAmericanExpress    = CreditCardCondition(cardType: .americanExpress)
    let conditionDinersClub         = CreditCardCondition(cardType: .dinersClub)
    let conditionDiscover           = CreditCardCondition(cardType: .discover)
    let conditionJcb                = CreditCardCondition(cardType: .jcb)
    let conditionMaestro            = CreditCardCondition(cardType: .maestro)
    let conditionMasterCard         = CreditCardCondition(cardType: .mastercard)
    let conditionVisa               = CreditCardCondition(cardType: .visa)
    
    // Valid Card Numbers
    let cardNumberAmericanExpress   = "376031710126369"
    let cardNumberDinersClub        = "30085182354725"
    let cardNumberDiscover          = "6011359046468736"
    let cardNumberJcb               = "3535983484092395"
    let cardNumberMaestro           = "6762856858323942"
    let cardNumberMastercard        = "5480785928215247"
    let cardNumberVisa              = "4024007127428075"
    
    let cardNumberWhitespace        = "3760 3171  0126       369"
    
    // Invalid Card Numbers
    let cardNumberInvalid_1         = "0000000000000000"
    let cardNumberInvalid_2         = "67628 568"
    
    
    
    // MARK: - Test Success
    
    func testCreditCardCondition_Success() {
        // Given
        let expectedResult = true
        
        // Test
        AssertCondition(conditionAll, testInput: cardNumberAmericanExpress, expectedResult: expectedResult)
        AssertCondition(conditionAll, testInput: cardNumberDinersClub,      expectedResult: expectedResult)
        AssertCondition(conditionAll, testInput: cardNumberDiscover,        expectedResult: expectedResult)
        AssertCondition(conditionAll, testInput: cardNumberJcb,             expectedResult: expectedResult)
        AssertCondition(conditionAll, testInput: cardNumberMaestro,         expectedResult: expectedResult)
        AssertCondition(conditionAll, testInput: cardNumberMastercard,      expectedResult: expectedResult)
        AssertCondition(conditionAll, testInput: cardNumberVisa,            expectedResult: expectedResult)
        
        AssertCondition(conditionAmericanExpress,   testInput: cardNumberAmericanExpress,   expectedResult: expectedResult)
        AssertCondition(conditionDinersClub,        testInput: cardNumberDinersClub,        expectedResult: expectedResult)
        AssertCondition(conditionDiscover,          testInput: cardNumberDiscover,          expectedResult: expectedResult)
        AssertCondition(conditionJcb,               testInput: cardNumberJcb,               expectedResult: expectedResult)
        AssertCondition(conditionMaestro,           testInput: cardNumberMaestro,           expectedResult: expectedResult)
        AssertCondition(conditionMasterCard,        testInput: cardNumberMastercard,        expectedResult: expectedResult)
        AssertCondition(conditionVisa,              testInput: cardNumberVisa,              expectedResult: expectedResult)
        
        AssertCondition(conditionAll, testInput: cardNumberWhitespace, expectedResult: expectedResult)
    }
    
    
    // MARK: - Test Failure
    
    func testCreditCardCondition_Failure () {
        // Given
        let expectedResult = false
        
        // Test
        AssertCondition(conditionAll, testInput: cardNumberInvalid_1, expectedResult: expectedResult)
        AssertCondition(conditionAll, testInput: cardNumberInvalid_2, expectedResult: expectedResult)
    }
    
    func testCreditCardCondition_AmericanExpress_Failure () {
        AssertCondition(conditionAmericanExpress, testInput: cardNumberAmericanExpress,   expectedResult: true)
        AssertCondition(conditionAmericanExpress, testInput: cardNumberDinersClub,        expectedResult: false)
        AssertCondition(conditionAmericanExpress, testInput: cardNumberDiscover,          expectedResult: false)
        AssertCondition(conditionAmericanExpress, testInput: cardNumberJcb,               expectedResult: false)
        AssertCondition(conditionAmericanExpress, testInput: cardNumberMaestro,           expectedResult: false)
        AssertCondition(conditionAmericanExpress, testInput: cardNumberMastercard,        expectedResult: false)
        AssertCondition(conditionAmericanExpress, testInput: cardNumberVisa,              expectedResult: false)
    }
    
    func testCreditCardCondition_DinersClub_Failure () {
        AssertCondition(conditionDinersClub, testInput: cardNumberAmericanExpress,   expectedResult: false)
        AssertCondition(conditionDinersClub, testInput: cardNumberDinersClub,        expectedResult: true)
        AssertCondition(conditionDinersClub, testInput: cardNumberDiscover,          expectedResult: false)
        AssertCondition(conditionDinersClub, testInput: cardNumberJcb,               expectedResult: false)
        AssertCondition(conditionDinersClub, testInput: cardNumberMaestro,           expectedResult: false)
        AssertCondition(conditionDinersClub, testInput: cardNumberMastercard,        expectedResult: false)
        AssertCondition(conditionDinersClub, testInput: cardNumberVisa,              expectedResult: false)
    }
    
    func testCreditCardCondition_Discover_Failure () {
        AssertCondition(conditionDiscover, testInput: cardNumberAmericanExpress,   expectedResult: false)
        AssertCondition(conditionDiscover, testInput: cardNumberDinersClub,        expectedResult: false)
        AssertCondition(conditionDiscover, testInput: cardNumberDiscover,          expectedResult: true)
        AssertCondition(conditionDiscover, testInput: cardNumberJcb,               expectedResult: false)
        AssertCondition(conditionDiscover, testInput: cardNumberMaestro,           expectedResult: false)
        AssertCondition(conditionDiscover, testInput: cardNumberMastercard,        expectedResult: false)
        AssertCondition(conditionDiscover, testInput: cardNumberVisa,              expectedResult: false)
    }
    
    func testCreditCardCondition_Jcb_Failure () {
        AssertCondition(conditionJcb, testInput: cardNumberAmericanExpress,   expectedResult: false)
        AssertCondition(conditionJcb, testInput: cardNumberDinersClub,        expectedResult: false)
        AssertCondition(conditionJcb, testInput: cardNumberDiscover,          expectedResult: false)
        AssertCondition(conditionJcb, testInput: cardNumberJcb,               expectedResult: true)
        AssertCondition(conditionJcb, testInput: cardNumberMaestro,           expectedResult: false)
        AssertCondition(conditionJcb, testInput: cardNumberMastercard,        expectedResult: false)
        AssertCondition(conditionJcb, testInput: cardNumberVisa,              expectedResult: false)
    }
    
    func testCreditCardCondition_Maestro_Failure () {
        AssertCondition(conditionMaestro, testInput: cardNumberAmericanExpress,   expectedResult: false)
        AssertCondition(conditionMaestro, testInput: cardNumberDinersClub,        expectedResult: false)
        AssertCondition(conditionMaestro, testInput: cardNumberDiscover,          expectedResult: false)
        AssertCondition(conditionMaestro, testInput: cardNumberJcb,               expectedResult: false)
        AssertCondition(conditionMaestro, testInput: cardNumberMaestro,           expectedResult: true)
        AssertCondition(conditionMaestro, testInput: cardNumberMastercard,        expectedResult: false)
        AssertCondition(conditionMaestro, testInput: cardNumberVisa,              expectedResult: false)
    }
    
    func testCreditCardCondition_MasterCard_Failure () {
        AssertCondition(conditionMasterCard, testInput: cardNumberAmericanExpress,   expectedResult: false)
        AssertCondition(conditionMasterCard, testInput: cardNumberDinersClub,        expectedResult: false)
        AssertCondition(conditionMasterCard, testInput: cardNumberDiscover,          expectedResult: false)
        AssertCondition(conditionMasterCard, testInput: cardNumberJcb,               expectedResult: false)
        AssertCondition(conditionMasterCard, testInput: cardNumberMaestro,           expectedResult: false)
        AssertCondition(conditionMasterCard, testInput: cardNumberMastercard,        expectedResult: true)
        AssertCondition(conditionMasterCard, testInput: cardNumberVisa,              expectedResult: false)
    }
    
    func testCreditCardCondition_Visa_Failure () {
        AssertCondition(conditionVisa, testInput: cardNumberAmericanExpress,   expectedResult: false)
        AssertCondition(conditionVisa, testInput: cardNumberDinersClub,        expectedResult: false)
        AssertCondition(conditionVisa, testInput: cardNumberDiscover,          expectedResult: false)
        AssertCondition(conditionVisa, testInput: cardNumberJcb,               expectedResult: false)
        AssertCondition(conditionVisa, testInput: cardNumberMaestro,           expectedResult: false)
        AssertCondition(conditionVisa, testInput: cardNumberMastercard,        expectedResult: false)
        AssertCondition(conditionVisa, testInput: cardNumberVisa,              expectedResult: true)
    }
}
