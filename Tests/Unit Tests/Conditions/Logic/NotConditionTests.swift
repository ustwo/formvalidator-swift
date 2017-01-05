//
//  NotConditionTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class NotConditionTests: XCTestCase {
    
    let originalCondition  = RangeCondition(configuration: ConfigurationSeeds.RangeSeeds.zeroToFour)
    
    
    // MARK: - Test Success
    
    func testNotCondition_Success() {
        // Given
        let testInput       = ""
        var condition       = NotCondition(condition: originalCondition)
        let expectedResult  = false
        
        // When
        condition.localizedViolationString = "Must not be between 0 through 4."
        
        // Initial Tests
        AssertCondition(originalCondition, testInput: testInput, expectedResult: !expectedResult)
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }


    // MARK: - Test Failure
    
    func testNotCondition_Failure() {
        // Given
        let testInput       = "1A234"
        var condition       = NotCondition(condition: originalCondition)
        let expectedResult  = true
        
        // When
        condition.localizedViolationString = "Must not be between 0 through 4."
        
        // Initial Tests
        AssertCondition(originalCondition, testInput: testInput, expectedResult: !expectedResult)
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }

}
