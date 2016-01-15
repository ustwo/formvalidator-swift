//
//  PostcodeConditionTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class PostcodeConditionTests: XCTestCase {
    
    
    // MARK: - Properties
    
    let condition       = PostcodeCondition(country: .UnitedKingdom)
    
    
    // MARK: - Test Success
    
    func testPostcodeCondition_Success() {
        // Given
        let testInput       = "M1 1BA"
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - Test Failure
    
    func testPostcodeCondition_OutwardCode_Failure() {
        // Given
        let testInput       = "M1AA 1BA"
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testPostcodeCondition_InwardCode_Failure() {
        // Given
        let testInput       = "M1 1BAA"
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testPostcodeCondition_Nil_Failure() {
        // Given
        let testInput: String?  = nil
        let expectedResult      = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
}
