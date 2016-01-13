//
//  AlphanumericConditionTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class AlphanumericConditionTests: XCTestCase {
    
    
    // MARK: - Test Success
    
    func testAlphanumericCondition_Success() {
        // Given
        let testInput       = "abcdefgh1234567890"
        let condition       = AlphanumericCondition()
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - Test Failure
    
    func testAlphanumericCondition_Failure() {
        // Given
        let testInput       = "a?1"
        let condition       = AlphanumericCondition()
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphanumericCondition_Nil() {
        // Given
        let testInput: String?  = nil
        let condition           = AlphanumericCondition()
        let expectedResult      = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
}
