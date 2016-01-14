//
//  PresentConditionTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class PresentConditionTests: XCTestCase {
    
    
    // MARK: - Properties
    
    let condition       = PresentCondition()
    
    
    // MARK: - Test Success
    
    func testPresentCondition_Success() {
        // Given
        let testInput       = "Foo"
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - Test Failure
    
    func testPresentCondition_Empty_Failure() {
        // Given
        let testInput       = ""
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testPresentCondition_Nil_Failure() {
        // Given
        let testInput: String?  = nil
        let expectedResult      = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }

}
