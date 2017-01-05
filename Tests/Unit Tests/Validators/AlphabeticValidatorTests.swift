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
    
    func testAlphabeticValidator_NoUnicode_NoWhitespace_Success() {
        // Given
        let testInput                       = AlphabeticConditionTests.Constants.ascii
        let validator                       = AlphabeticValidator(configuration: ConfigurationSeeds.AlphabeticSeeds.noUnicode_NoWhitespace)
        let expectedResult: [Condition]?    = nil
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticValidator_NoUnicode_Whitespace_Success() {
        // Given
        let testInput                       = AlphabeticConditionTests.Constants.asciiSpaces
        let validator                       = AlphabeticValidator(configuration: ConfigurationSeeds.AlphabeticSeeds.noUnicode_Whitespace)
        let expectedResult: [Condition]?    = nil
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticValidator_Unicode_NoWhitespace_Success() {
        // Given
        let testInput                       = AlphabeticConditionTests.Constants.unicode
        let validator                       = AlphabeticValidator(configuration: ConfigurationSeeds.AlphabeticSeeds.unicode_NoWhitespace)
        let expectedResult: [Condition]?    = nil
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticValidator_Unicode_Whitespace_Success() {
        // Given
        let testInput                       = AlphabeticConditionTests.Constants.unicodeSpaces
        let validator                       = AlphabeticValidator(configuration: ConfigurationSeeds.AlphabeticSeeds.unicode_Whitespace)
        let expectedResult: [Condition]?    = nil
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - Test Failure
    
    func testAlphabeticValidator_NoUnicode_NoWhitespace_Failure() {
        // Given
        let testInput       = AlphabeticConditionTests.Constants.asciiSpaces
        let validator       = AlphabeticValidator(configuration: ConfigurationSeeds.AlphabeticSeeds.noUnicode_NoWhitespace)
        let expectedResult  = validator.conditions
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticValidator_NoUnicode_Whitespace_Failure() {
        // Given
        let testInput       = AlphabeticConditionTests.Constants.asciiSpaces + "1"
        let validator       = AlphabeticValidator(configuration: ConfigurationSeeds.AlphabeticSeeds.noUnicode_Whitespace)
        let expectedResult  = validator.conditions
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticValidator_Unicode_NoWhitespace_Failure() {
        // Given
        let testInput       = AlphabeticConditionTests.Constants.unicodeSpaces
        let validator       = AlphabeticValidator(configuration: ConfigurationSeeds.AlphabeticSeeds.unicode_NoWhitespace)
        let expectedResult  = validator.conditions
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticValidator_Unicode_Whitespace_Failure() {
        // Given
        let testInput       = AlphabeticConditionTests.Constants.unicodeSpaces + "1"
        let validator       = AlphabeticValidator(configuration: ConfigurationSeeds.AlphabeticSeeds.unicode_Whitespace)
        let expectedResult  = validator.conditions
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }

}
