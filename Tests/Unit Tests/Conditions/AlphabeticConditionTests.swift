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
    
    
    // MARK: - Test Success
    
    func testAlphabeticCondition_NoWhitespace_Success() {
        // Given
        let testInput       = "abcdefgh"
        let condition       = AlphabeticCondition(allowsWhiteSpace: false)
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticCondition_Whitespace_Success() {
        // Given
        let testInput       = "abcd efg h"
        let condition       = AlphabeticCondition(allowsWhiteSpace: true)
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - Test Failure
    
    func testAlphabeticCondition_NoWhitespace_Failure() {
        // Given
        let testInput       = "abcd efg h"
        let condition       = AlphabeticCondition(allowsWhiteSpace: false)
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticCondition_Whitespace_Failure() {
        // Given
        let testInput       = "12345678"
        let condition       = AlphabeticCondition(allowsWhiteSpace: true)
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphabeticCondition_Nil() {
        // Given
        let testInput: String?  = nil
        let condition           = AlphabeticCondition(allowsWhiteSpace: false)
        let expectedResult      = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
}
