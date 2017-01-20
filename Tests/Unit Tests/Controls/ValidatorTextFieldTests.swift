//
//  ValidatorTextFieldTests.swift
//  FormValidatorSwift
//
//  Created by John Mann on 1/13/17.
//  Copyright © 2017 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift

class ValidatorTextFieldTests: XCTestCase {
    
    func testAlphabeticCondition_DefaultInit() {
        // Given
        let validatorTextField = ValidatorTextField(validator: AlphabeticValidator())
        let expectShouldAllowViolation = false
        let expectValidateOnFocusLossOnly = false
        
        // When
        let actualShouldAllowViolation = validatorTextField.shouldAllowViolation
        let actualValidateOnFocusLossOnly = validatorTextField.validateOnFocusLossOnly
        
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
