//
//  AndConditionTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class AndConditionTests: XCTestCase {
    
    
    // MARK: - Properties
    
    let firstCondition  = RangeCondition(configuration: ConfigurationSeeds.RangeSeeds.zeroToFour)
    let secondCondition = AlphanumericCondition()
    
    
    // MARK: - Test Initializers
    
    func testAndCondition_DefaultInit() {
        // Given
        let condition = AndCondition()
        let expectedCount = 1
        
        // When
        let actualCount = condition.conditions.count
        
        // Test
        XCTAssertEqual(actualCount,
                       expectedCount,
                       "Expected number of conditions to be: \(expectedCount) but found: \(actualCount)")
    }
    
    
    // MARK: - Test Success
    
    func testAndCondition_Success() {
        // Given
        let testInput       = "1A23"
        var condition       = AndCondition(conditions: [firstCondition, secondCondition])
        let expectedResult  = true
        
        // When
        condition.localizedViolationString = "Min 0 Max 4 or must only contain alphanumeric"
        
        // Initial Tests
        AssertCondition(firstCondition, testInput: testInput, expectedResult: true)
        AssertCondition(secondCondition, testInput: testInput, expectedResult: true)
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }


    // MARK: - Test Failure
    
    func testAndCondition_Failure() {
        // Given
        let testInput       = "1A234"
        var condition       = AndCondition(conditions: [firstCondition, secondCondition])
        let expectedResult  = false
        
        // When
        condition.localizedViolationString = "Min 0 Max 4 or must only contain alphanumeric"
        
        // Initial Tests
        AssertCondition(firstCondition, testInput: testInput, expectedResult: false)
        AssertCondition(secondCondition, testInput: testInput, expectedResult: true)
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }

}
