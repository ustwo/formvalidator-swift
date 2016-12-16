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
    
    
    // MARK: - Constants
    
    private struct Constants {
        static let asciiLetters = "abcDefgh"
        static let unicodeLetters = "abÅÄcdefÖgh"
        
        static let asciiLettersSpaces = "abc Def gh"
        static let unicodeLettersSpaces = "abÅ Äcdef Ögh"
    }
    
    
    // MARK: - Test Success
    
    func testAlphabeticValidator_NoUnicode_NoWhitespace_Success() {
        // Given
        let testInput                       = Constants.asciiLetters
        let validator                       = AlphabeticValidator(allowsUnicode: false, allowsWhitespace: false)
        let expectedResult: [Condition]?    = nil
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticValidator_NoUnicode_Whitespace_Success() {
        // Given
        let testInput                       = Constants.asciiLettersSpaces
        let validator                       = AlphabeticValidator(allowsUnicode: false, allowsWhitespace: true)
        let expectedResult: [Condition]?    = nil
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticValidator_Unicode_NoWhitespace_Success() {
        // Given
        let testInput                       = Constants.unicodeLetters
        let validator                       = AlphabeticValidator(allowsUnicode: true, allowsWhitespace: false)
        let expectedResult: [Condition]?    = nil
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticValidator_Unicode_Whitespace_Success() {
        // Given
        let testInput                       = Constants.unicodeLettersSpaces
        let validator                       = AlphabeticValidator(allowsUnicode: true, allowsWhitespace: true)
        let expectedResult: [Condition]?    = nil
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - Test Failure
    
    func testAlphabeticValidator_NoUnicode_NoWhitespace_Failure() {
        // Given
        let testInput       = Constants.asciiLettersSpaces
        let validator       = AlphabeticValidator(allowsUnicode: false, allowsWhitespace: false)
        let expectedResult  = validator.conditions
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticValidator_NoUnicode_Whitespace_Failure() {
        // Given
        let testInput       = Constants.asciiLettersSpaces + "1"
        let validator       = AlphabeticValidator(allowsUnicode: false, allowsWhitespace: true)
        let expectedResult  = validator.conditions
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticValidator_Unicode_NoWhitespace_Failure() {
        // Given
        let testInput       = Constants.unicodeLettersSpaces
        let validator       = AlphabeticValidator(allowsUnicode: true, allowsWhitespace: false)
        let expectedResult  = validator.conditions
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticValidator_Unicode_Whitespace_Failure() {
        // Given
        let testInput       = Constants.unicodeLettersSpaces + "1"
        let validator       = AlphabeticValidator(allowsUnicode: true, allowsWhitespace: true)
        let expectedResult  = validator.conditions
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }

}
