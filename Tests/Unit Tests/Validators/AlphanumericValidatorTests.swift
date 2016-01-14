//
//  AlphanumericValidatorTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class AlphanumericValidatorTests: XCTestCase {
    
    
    // MARK: - Properties
    
    let validator   = AlphanumericValidator()
    
    
    // MARK: - Test Success
    
    func testAlphanumericValidator_Success() {
        // Given
        let testInput                       = "abcdefgh1234567890"
        let expectedResult: [Condition]?    = nil
        
        // When
        let actualResult = validator.checkConditions(testInput)
        
        // Test
        XCTAssertNil(actualResult, "The `\(validator.dynamicType)` should respond with \(expectedResult) and but received \(actualResult).")
    }
    
    
    // MARK: - Test Failure
    
    func testAlphanumericValidator_Failure() {
        // Given
        let testInput                       = "a?1"
        let expectedResult: [Condition]?    = validator.conditions
        
        // When
        let actualResult = validator.checkConditions(testInput)
        
        // Test
        XCTAssertNotNil(actualResult, "The `\(validator.dynamicType)` should respond with \(expectedResult) and but received \(actualResult).")
    }
    
}
