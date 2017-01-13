//
//  ValidatorTextViewTests.swift
//  FormValidatorSwift
//
//  Created by John Mann on 1/13/17.
//  Copyright © 2017 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift

class ValidatorTextViewTests: XCTestCase {
    
    func testAlphabeticCondition_DefaultInit() {
        // Given
        let validatorTextView = ValidatorTextView(validator: AlphabeticValidator())
        let expectShouldAllowViolation = false
        let expectValidateOnFocusLossOnly = false
        
        // When
        let actualShouldAllowViolation = validatorTextView.shouldAllowViolation
        let actualValidateOnFocusLossOnly = validatorTextView.validateOnFocusLossOnly
        
        // Test
        XCTAssertEqual(actualShouldAllowViolation,
                       expectShouldAllowViolation,
                       "Expected shouldAllowViolation to be: \(expectShouldAllowViolation) but found: \(actualShouldAllowViolation)")
        
        // Test
        XCTAssertEqual(actualValidateOnFocusLossOnly,
                       expectValidateOnFocusLossOnly,
                       "Expected validateOnFocusLossOnly to be: \(expectValidateOnFocusLossOnly) but found: \(actualValidateOnFocusLossOnly)")
    }
    
    
}
