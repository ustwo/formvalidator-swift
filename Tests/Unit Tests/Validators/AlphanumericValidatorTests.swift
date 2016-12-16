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
    
    
    // MARK: - Constants
    
    private struct Constants {
        static let ascii = "abcDefgh1234567890"
        static let unicode = "abÅÄcdefÖgh1234567890"
        
        static let asciiSpaces = "abc Def gh1234 567890"
        static let unicodeSpaces = "abÅ Äcdef Ögh1234 567890"
        
        static let symbols = "a?!1"
    }
    
    
    // MARK: - Test Success
    
    func testAlphanumericValidator_NoUnicode_NoWhitespace_Success() {
        // Given
        let testInput                       = Constants.ascii
        let validator                       = AlphanumericValidator(allowsUnicode: false, allowsWhitespace: false)
        let expectedResult: [Condition]?    = nil
        
        // When
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphanumericValidator_NoUnicode_Whitespace_Success() {
        // Given
        let testInput                       = Constants.asciiSpaces
        let validator                       = AlphanumericValidator(allowsUnicode: false, allowsWhitespace: true)
        let expectedResult: [Condition]?    = nil
        
        // When
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphanumericValidator_Unicode_NoWhitespace_Success() {
        // Given
        let testInput                       = Constants.unicode
        let validator                       = AlphanumericValidator(allowsUnicode: true, allowsWhitespace: false)
        let expectedResult: [Condition]?    = nil
        
        // When
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphanumericValidator_Unicode_Whitespace_Success() {
        // Given
        let testInput                       = Constants.unicodeSpaces
        let validator                       = AlphanumericValidator(allowsUnicode: true, allowsWhitespace: true)
        let expectedResult: [Condition]?    = nil
        
        // When
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - Test Failure
    
    func testAlphanumericValidator_NoUnicode_NoWhitespace_Failure() {
        // Given
        let testInput                       = Constants.asciiSpaces
        let validator                       = AlphanumericValidator(allowsUnicode: false, allowsWhitespace: false)
        let expectedResult: [Condition]?    = validator.conditions
        
        // When
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphanumericValidator_NoUnicode_Whitespace_Failure() {
        // Given
        let testInput                       = Constants.asciiSpaces + "?"
        let validator                       = AlphanumericValidator(allowsUnicode: false, allowsWhitespace: true)
        let expectedResult: [Condition]?    = validator.conditions
        
        // When
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphanumericValidator_Unicode_NoWhitespace_Failure() {
        // Given
        let testInput                       = Constants.unicodeSpaces
        let validator                       = AlphanumericValidator(allowsUnicode: true, allowsWhitespace: false)
        let expectedResult: [Condition]?    = validator.conditions
        
        // When
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphanumericValidator_Unicode_Whitespace_Failure() {
        // Given
        let testInput                       = Constants.unicodeSpaces + "?"
        let validator                       = AlphanumericValidator(allowsUnicode: true, allowsWhitespace: false)
        let expectedResult: [Condition]?    = validator.conditions
        
        // When
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
}
