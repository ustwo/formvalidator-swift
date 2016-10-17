//
//  PasswordStrengthValidatorTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class PasswordStrengthValidatorTests: XCTestCase {
    
    
    // MARK: - Properties
    
    let validator   = PasswordStrengthValidator(requiredStrength: .veryStrong)
    
    
    // MARK: - Test Success
    
    func testPasswordStrengthValidator_Success() {
        // Given
        let testInput                       = "F1@b9a_c12983y"
        let expectedResult: [Condition]?    = nil
        
        // When
        let actualResult = validator.checkConditions(testInput)
        
        // Test
        XCTAssertNil(actualResult, "The `\(type(of: validator))` should respond with \(expectedResult) and but received \(actualResult).")
    }
    
    
    // MARK: - Test Failure
    
    func testPasswordStrengthValidator_Failure() {
        // Given
        let testInput                       = "Foo"
        let expectedResult: [Condition]?    = validator.conditions
        
        // When
        let actualResult = validator.checkConditions(testInput)
        
        // Test
        XCTAssertNotNil(actualResult, "The `\(type(of: validator))` should respond with \(expectedResult) and but received \(actualResult).")
    }
    
}
