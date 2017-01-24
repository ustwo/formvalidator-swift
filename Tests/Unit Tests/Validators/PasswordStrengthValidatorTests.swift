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
    
    let validator   = PasswordStrengthValidator(configuration: ConfigurationSeeds.PasswordStrengthSeeds.veryStrong)
    
    
    // MARK: - Test Success
    
    func testPasswordStrengthValidator_Success() {
        // Given
        let testInput                       = "F1@b9a_c12983y"
        let expectedResult: [Condition]?    = nil
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - Test Failure
    
    func testPasswordStrengthValidator_Failure() {
        // Given
        let testInput                       = "Foo"
        let expectedResult: [Condition]?    = validator.conditions
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
}
