//
//  CreditCardTypeTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 21/12/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class CreditCardTypeTests: XCTestCase {
    
    
    // MARK: - Configuration
    
    private struct TestableCreditCardType {
        let cardType: CreditCardType
        let expectedDescription: String
        let identifier: String
    }
    
    private let testCases: [TestableCreditCardType] = [
        TestableCreditCardType(cardType: .all,
                               expectedDescription: "American Express, Diners Club, Discover, JCB, Maestro, Master Card, VISA",
                               identifier: "All"),
        TestableCreditCardType(cardType: [.americanExpress, .visa],
                               expectedDescription: "American Express, VISA",
                               identifier: "Some"),
        TestableCreditCardType(cardType: [],
                               expectedDescription: "",
                               identifier: "None")
                                                      ]
    
    
    // MARK: - Test Properties
    
    func testCreditCardType_Description() {
        for testCase in testCases {
            // When
            let actualResult = testCase.cardType.description
            
            // Test
            XCTAssertEqual(testCase.expectedDescription,
                           actualResult,
                           "For case: \(testCase.identifier) expected the description to be: \(testCase.expectedDescription) but found: \(actualResult)")
        }
    }
    
}
