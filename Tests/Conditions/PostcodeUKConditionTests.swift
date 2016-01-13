//
//  PostcodeUKConditionTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class PostcodeUKConditionTests: XCTestCase {
    
    
    // MARK: - Test Success
    
    func testPostcodeUKCondition_Success() {
        // Given
        let testInput       = "M1 1BA"
        let condition       = PostcodeUKCondition()
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }


    // MARK: - Test Failure
    
    func testPostcodeUKCondition_OutwardCode_Failure() {
        // Given
        let testInput       = "M1AA 1BA"
        let condition       = PostcodeUKCondition()
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testPostcodeUKCondition_InwardCode_Failure() {
        // Given
        let testInput       = "M1 1BAA"
        let condition       = PostcodeUKCondition()
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testPostcodeUKCondition_Nil_Failure() {
        // Given
        let testInput: String?  = nil
        let condition           = PostcodeUKCondition()
        let expectedResult      = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }

}
