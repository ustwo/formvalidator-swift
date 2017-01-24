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
    
    
    // MARK: - Test Success
    
    func testAlphanumericValidator_NoUnicode_NoWhitespace_Success() {
        // Given
        let testInput                       = AlphanumericConditionTests.Constants.ascii
        let validator                       = AlphanumericValidator(configuration: ConfigurationSeeds.AlphanumericSeeds.noUnicode_NoWhitespace)
        let expectedResult: [Condition]?    = nil
        
        // When
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphanumericValidator_NoUnicode_Whitespace_Success() {
        // Given
        let testInput                       = AlphanumericConditionTests.Constants.asciiSpaces
        let validator                       = AlphanumericValidator(configuration: ConfigurationSeeds.AlphanumericSeeds.noUnicode_Whitespace)
        let expectedResult: [Condition]?    = nil
        
        // When
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphanumericValidator_Unicode_NoWhitespace_Success() {
        // Given
        let testInput                       = AlphanumericConditionTests.Constants.unicode
        let validator                       = AlphanumericValidator(configuration: ConfigurationSeeds.AlphanumericSeeds.unicode_NoWhitespace)
        let expectedResult: [Condition]?    = nil
        
        // When
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphanumericValidator_Unicode_Whitespace_Success() {
        // Given
        let testInput                       = AlphanumericConditionTests.Constants.unicodeSpaces
        let validator                       = AlphanumericValidator(configuration: ConfigurationSeeds.AlphanumericSeeds.unicode_Whitespace)
        let expectedResult: [Condition]?    = nil
        
        // When
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - Test Failure
    
    func testAlphanumericValidator_NoUnicode_NoWhitespace_Failure() {
        // Given
        let testInput                       = AlphanumericConditionTests.Constants.asciiSpaces
        let validator                       = AlphanumericValidator(configuration: ConfigurationSeeds.AlphanumericSeeds.noUnicode_NoWhitespace)
        let expectedResult: [Condition]?    = validator.conditions
        
        // When
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphanumericValidator_NoUnicode_Whitespace_Failure() {
        // Given
        let testInput                       = AlphanumericConditionTests.Constants.asciiSpaces + "?"
        let validator                       = AlphanumericValidator(configuration: ConfigurationSeeds.AlphanumericSeeds.noUnicode_Whitespace)
        let expectedResult: [Condition]?    = validator.conditions
        
        // When
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphanumericValidator_Unicode_NoWhitespace_Failure() {
        // Given
        let testInput                       = AlphanumericConditionTests.Constants.unicodeSpaces
        let validator                       = AlphanumericValidator(configuration: ConfigurationSeeds.AlphanumericSeeds.unicode_NoWhitespace)
        let expectedResult: [Condition]?    = validator.conditions
        
        // When
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphanumericValidator_Unicode_Whitespace_Failure() {
        // Given
        let testInput                       = AlphanumericConditionTests.Constants.unicodeSpaces + "?"
        let validator                       = AlphanumericValidator(configuration: ConfigurationSeeds.AlphanumericSeeds.unicode_Whitespace)
        let expectedResult: [Condition]?    = validator.conditions
        
        // When
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
}
