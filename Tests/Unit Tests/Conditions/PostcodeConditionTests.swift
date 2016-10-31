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
    
    let conditionGBR        = PostcodeCondition(country: .UnitedKingdom)
    let conditionSWE        = PostcodeCondition(country: .Sweden)
    let conditionTUR        = PostcodeCondition(country: .Turkey)
    
    
    // MARK: - GBR - Test Success
    
    func testPostcodeCondition_GBR_Success() {
        // Given
        let testInput       = "M1 1BA"
        let expectedResult  = true
        
        // Test
        AssertCondition(conditionGBR, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - GBR - Test Failure
    
    func testPostcodeCondition_GBR_OutwardCode_Failure() {
        // Given
        let testInput       = "M1AA 1BA"
        let expectedResult  = false
        
        // Test
        AssertCondition(conditionGBR, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testPostcodeCondition_GBR_InwardCode_Failure() {
        // Given
        let testInput       = "M1 1BAA"
        let expectedResult  = false
        
        // Test
        AssertCondition(conditionGBR, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testPostcodeCondition_GBR_Nil_Failure() {
        // Given
        let testInput: String?  = nil
        let expectedResult      = false
        
        // Test
        AssertCondition(conditionGBR, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - SWE - Test Success
    
    func testPostcodeCondition_SWE_Default_Success() {
        // Given
        let testInput       = "112 50"
        let expectedResult  = true
        
        // Test
        AssertCondition(conditionSWE, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testPostcodeCondition_SWE_WithoutGap_Success() {
        // Given
        let testInput       = "11434"
        let expectedResult  = true
        
        // Test
        AssertCondition(conditionSWE, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testPostcodeCondition_SWE_International_Default_Success() {
        // Given
        let testInput       = "SE-111 21"
        let expectedResult  = true
        
        // Test
        AssertCondition(conditionSWE, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testPostcodeCondition_SWE_International_WithoutGap_Success() {
        // Given
        let testInput       = "SE-11637"
        let expectedResult  = true
        
        // Test
        AssertCondition(conditionSWE, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testPostcodeCondition_SWE_International_LowerCase_Success() {
        // Given
        let testInput       = "se-11637"
        let expectedResult  = true
        
        // Test
        AssertCondition(conditionSWE, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - SWE - Test Failure
    
    func testPostcodeCondition_SWE_LessDigits_Failure() {
        // Given
        let testInput       = "113 4"
        let expectedResult  = false
        
        // Test
        AssertCondition(conditionSWE, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testPostcodeCondition_SWE_MoreDigits_Failure() {
        // Given
        let testInput       = "116233"
        let expectedResult  = false
        
        // Test
        AssertCondition(conditionSWE, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testPostcodeCondition_SWE_International_DifferentCode_Failure() {
        // Given
        let testInput       = "us-125 41"
        let expectedResult  = false
        
        // Test
        AssertCondition(conditionSWE, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testPostcodeCondition_SWE_International_NonDigit_Failure() {
        // Given
        let testInput       = "us-125e1"
        let expectedResult  = false
        
        // Test
        AssertCondition(conditionSWE, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - TUR - Test Success
    
    func testPostcodeCondition_TUR_Success() {
        // Given
        let testInput       = "34345"
        let expectedResult  = true
        
        // Test
        AssertCondition(conditionTUR, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - TUR - Test Failure
    
    func testPostcodeCondition_TUR_LessDigits_Failure() {
        // Given
        let testInput       = "3411"
        let expectedResult  = false
        
        // Test
        AssertCondition(conditionTUR, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testPostcodeCondition_TUR_MoreDigits_Failure() {
        // Given
        let testInput       = "347001"
        let expectedResult  = false
        
        // Test
        AssertCondition(conditionTUR, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testPostcodeCondition_TUR_WhiteSpace_Failure() {
        // Given
        let testInput       = "34 700"
        let expectedResult  = false
        
        // Test
        AssertCondition(conditionTUR, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testPostcodeCondition_TUR_NonDigit_Failure() {
        // Given
        let testInput       = "3470a"
        let expectedResult  = false
        
        // Test
        AssertCondition(conditionTUR, testInput: testInput, expectedResult: expectedResult)
    }
}
