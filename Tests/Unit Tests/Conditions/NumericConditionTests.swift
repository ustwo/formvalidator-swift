//
//  NumericConditionTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class NumericConditionTests: XCTestCase {
    
    
    // MARK: - Constants
    
    internal struct Constants {
        static let ascii = "1234567890"
        static let unicode = "12৩໖၆34"
        
        static let asciiSpaces = "123 456 7890"
        static let unicodeSpaces = "12৩ ໖၆34"
        
        static let letters = "123a"
    }
    
    
    // MARK: - Test Initializers
    
    func testNumericCondition_DefaultInit() {
        // Given
        let condition = NumericCondition()
        let expectedAllowsUnicode = true
        let expectedAllowsWhitespace = false
        
        // When
        let actualAllowsUnicode = condition.configuration.allowsUnicode
        let actualAllowsWhitespace = condition.configuration.allowsWhitespace
        
        // Test
        XCTAssertEqual(actualAllowsUnicode,
                       expectedAllowsUnicode,
                       "Expected allowsUnicode to be: \(expectedAllowsUnicode) but found: \(actualAllowsUnicode)")
        XCTAssertEqual(actualAllowsWhitespace,
                       expectedAllowsWhitespace,
                       "Expected allowsWhitespace to be: \(expectedAllowsWhitespace) but found: \(actualAllowsWhitespace)")
    }
    
    
    // MARK: - Test Success
    
    func testNumericCondition_NoUnicode_NoWhitespace_Success() {
        // Given
        let testInput       = Constants.ascii
        let condition       = NumericCondition(configuration: ConfigurationSeeds.NumericSeeds.noUnicode_NoWhitespace)
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testNumericCondition_NoUnicode_Whitespace_Success() {
        // Given
        let testInput       = Constants.asciiSpaces
        let condition       = NumericCondition(configuration: ConfigurationSeeds.NumericSeeds.noUnicode_Whitespace)
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testNumericCondition_Unicode_NoWhitespace_Success() {
        // Given
        let testInput       = Constants.unicode
        let condition       = NumericCondition(configuration: ConfigurationSeeds.NumericSeeds.unicode_NoWhitespace)
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testNumericCondition_Unicode_Whitespace_Success() {
        // Given
        let testInput       = Constants.unicodeSpaces
        let condition       = NumericCondition(configuration: ConfigurationSeeds.NumericSeeds.unicode_Whitespace)
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - Test Failure
    
    func testNumericCondition_NoUnicode_NoWhitespace_Failure_Spaces() {
        // Given
        let testInput       = Constants.asciiSpaces
        let condition       = NumericCondition(configuration: ConfigurationSeeds.NumericSeeds.noUnicode_NoWhitespace)
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testNumericCondition_NoUnicode_NoWhitespace_Failure_Unicode() {
        // Given
        let testInput       = Constants.unicode
        let condition       = NumericCondition(configuration: ConfigurationSeeds.NumericSeeds.noUnicode_NoWhitespace)
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testNumericCondition_NoUnicode_Whitespace_Failure_Letters() {
        // Given
        let testInput       = Constants.letters
        let condition       = NumericCondition(configuration: ConfigurationSeeds.NumericSeeds.noUnicode_Whitespace)
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testNumericCondition_NoUnicode_Whitespace_Failure_Unicode() {
        // Given
        let testInput       = Constants.unicodeSpaces
        let condition       = NumericCondition(configuration: ConfigurationSeeds.NumericSeeds.noUnicode_Whitespace)
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testNumericCondition_Unicode_NoWhitespace_Failure() {
        // Given
        let testInput       = Constants.unicodeSpaces
        let condition       = NumericCondition(configuration: ConfigurationSeeds.NumericSeeds.unicode_NoWhitespace)
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testNumericCondition_Unicode_Whitespace_Failure() {
        // Given
        let testInput       = Constants.letters
        let condition       = NumericCondition(configuration: ConfigurationSeeds.NumericSeeds.unicode_Whitespace)
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testNumericCondition_Nil_Failure() {
        // Given
        let testInput: String?  = nil
        let condition           = NumericCondition()
        let expectedResult      = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
}
