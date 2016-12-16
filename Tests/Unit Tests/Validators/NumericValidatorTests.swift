//
//  NumericValidatorTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class NumericValidatorTests: XCTestCase {
    
    
    // MARK: - Properties
    
    let validator   = NumericValidator()
    
    
    // MARK: - Test Success
    
    func testNumericValidator_Success() {
        // Given
        let testInput                       = "1234567890"
        let expectedResult: [Condition]?    = nil
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - Test Failure
    
    func testNumericValidator_Failure() {
        // Given
        let testInput                       = "123a"
        let expectedResult: [Condition]?    = validator.conditions
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
}
