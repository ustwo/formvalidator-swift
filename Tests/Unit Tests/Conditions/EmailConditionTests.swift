//
//  EmailConditionTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class EmailConditionTests: XCTestCase {
    
    
    // MARK: - Properties
    
    let condition       = EmailCondition()
    
    
    // MARK: - Test Success
    
    func testEmailCondition_Success() {
        // Given
        let testInput       = "e_x.a+m-p_l.e@ex.example-example.ex.am"
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - Test Failure
    
    func testEmailCondition_NoAt_Failure() {
        // Given
        let testInput       = "example"
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testEmailCondition_NoDomain_Failure() {
        // Given
        let testInput       = "example@"
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testEmailCondition_PartialDomain_Failure() {
        // Given
        let testInput       = "example@example.ex."
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testEmailCondition_Space_Failure() {
        // Given
        let testInput       = "e xample@example.ex."
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testEmailCondition_ReservedCharacters_Failure() {
        // Given
        let testInput       = "e/xample@example.ex."
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
}
