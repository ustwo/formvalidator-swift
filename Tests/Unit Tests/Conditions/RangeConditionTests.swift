//
//  RangeConditionTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class RangeConditionTests: XCTestCase {
    
    
    // MARK: - Properties
    
    let condition       = RangeCondition(range: 3..<13)
    
    
    // MARK: - Test Success
    
    func testRangeCondition_Success() {
        // Given
        let testInput       = "1A2B3D4C5D"
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }


    // MARK: - Test Failure
    
    func testRangeCondition_Start_Failure() {
        // Given
        let testInput       = "1A"
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testRangeCondition_Length_Failure() {
        // Given
        let testInput       = "1A2B3D4C5D6E"
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testRangeCondition_Nil_Failure() {
        // Given
        let testInput: String?  = nil
        let expectedResult      = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }

}
