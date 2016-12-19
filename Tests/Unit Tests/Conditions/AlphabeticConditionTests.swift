//
//  ConditionTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 12/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class AlphabeticConditionTests: XCTestCase {
    
    
    // MARK: - Constants
    
    internal struct Constants {
        static let ascii = "abcDefgh"
        static let unicode = "abÅÄcdefÖgh"
        
        static let asciiSpaces = "abc Def gh"
        static let unicodeSpaces = "abÅ Äcdef Ögh"
        
        static let numbers = "12345678"
    }
    
    
    // MARK: - Test Success
    
    func testAlphabeticCondition_NoUnicode_NoWhitespace_Success() {
        // Given
        let testInput       = Constants.ascii
        let condition       = AlphabeticCondition(allowsUnicode: false, allowsWhitespace: false)
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticCondition_NoUnicode_Whitespace_Success() {
        // Given
        let testInput       = Constants.asciiSpaces
        let condition       = AlphabeticCondition(allowsUnicode: false, allowsWhitespace: true)
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticCondition_Unicode_NoWhitespace_Success() {
        // Given
        let testInput       = Constants.unicode
        let condition       = AlphabeticCondition(allowsUnicode: true, allowsWhitespace: false)
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticCondition_Unicode_Whitespace_Success() {
        // Given
        let testInput       = Constants.unicodeSpaces
        let condition       = AlphabeticCondition(allowsUnicode: true, allowsWhitespace: true)
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - Test Failure
    
    func testAlphabeticCondition_NoUnicode_NoWhitespace_Failure_Spaces() {
        // Given
        let testInput       = Constants.asciiSpaces
        let condition       = AlphabeticCondition(allowsUnicode: false, allowsWhitespace: false)
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticCondition_NoUnicode_NoWhitespace_Failure_Unicode() {
        // Given
        let testInput       = Constants.unicode
        let condition       = AlphabeticCondition(allowsUnicode: false, allowsWhitespace: false)
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticCondition_NoUnicode_Whitespace_Failure_Numbers() {
        // Given
        let testInput       = Constants.numbers
        let condition       = AlphabeticCondition(allowsUnicode: false, allowsWhitespace: true)
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticCondition_NoUnicode_Whitespace_Failure_Unicode() {
        // Given
        let testInput       = Constants.unicodeSpaces
        let condition       = AlphabeticCondition(allowsUnicode: false, allowsWhitespace: true)
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticCondition_Unicode_NoWhitespace_Failure() {
        // Given
        let testInput       = Constants.unicodeSpaces
        let condition       = AlphabeticCondition(allowsUnicode: false, allowsWhitespace: false)
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticCondition_Unicode_Whitespace_Failure() {
        // Given
        let testInput       = Constants.numbers
        let condition       = AlphabeticCondition(allowsUnicode: false, allowsWhitespace: true)
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticCondition_Nil() {
        // Given
        let testInput: String?  = nil
        let condition           = AlphabeticCondition(allowsUnicode: false, allowsWhitespace: false)
        let expectedResult      = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
}
