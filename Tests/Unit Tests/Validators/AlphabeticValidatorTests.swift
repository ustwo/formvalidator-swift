//
//  AlphabeticValidatorTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class AlphabeticValidatorTests: XCTestCase {
    
    
    // MARK: - Test Success
    
    func testAlphabeticValidator_NoWhitespace_Success() {
        // Given
        let testInput                       = "abcdefgh"
        let validator                       = AlphabeticValidator(allowsWhitespace: false)
        let expectedResult: [Condition]?    = nil
        
        // When
        let actualResult = validator.checkConditions(testInput)
        
        // Test
        XCTAssertNil(actualResult, "The `\(validator.dynamicType)` should respond with \(expectedResult) and but received \(actualResult).")
    }
    
    func testAlphabeticValidator_Whitespace_Success() {
        // Given
        let testInput                       = "abc def gh"
        let validator                       = AlphabeticValidator(allowsWhitespace: true)
        let expectedResult: [Condition]?    = nil
        
        // When
        let actualResult = validator.checkConditions(testInput)
        
        // Test
        XCTAssertNil(actualResult, "The `\(validator.dynamicType)` should respond with \(expectedResult) and but received \(actualResult).")
    }
    
    
    // MARK: - Test Failure
    
    func testAlphabeticValidator_NoWhitespace_Failure() {
        // Given
        let testInput       = "abc def gh"
        let validator       = AlphabeticValidator(allowsWhitespace: false)
        let expectedResult  = validator.conditions
        
        // When
        let actualResult = validator.checkConditions(testInput)
        
        // Test
        XCTAssertNotNil(actualResult, "The `\(validator.dynamicType)` should respond with \(expectedResult) and but received \(actualResult).")
    }
    
    func testAlphabeticValidator_Whitespace_Failure() {
        // Given
        let testInput       = "abc def gh1"
        let validator       = AlphabeticValidator(allowsWhitespace: true)
        let expectedResult  = validator.conditions
        
        // When
        let actualResult = validator.checkConditions(testInput)
        
        // Test
        XCTAssertNotNil(actualResult, "The `\(validator.dynamicType)` should respond with \(expectedResult) and but received \(actualResult).")
    }

}
