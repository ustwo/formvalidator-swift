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
    
    
    // MARK: - Properties
    
    let condition       = NumericCondition()
    
    
    // MARK: - Test Success
    
    func testNumericCondition_Success() {
        // Given
        let testInput       = "1234567890"
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - Test Failure
    
    func testNumericCondition_Failure() {
        // Given
        let testInput       = "123a"
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testNumericCondition_Nil_Failure() {
        // Given
        let testInput: String?  = nil
        let expectedResult      = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
}
