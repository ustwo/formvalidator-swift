//
//  URLConditionTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class URLConditionTests: XCTestCase {
    
    
    // MARK: - Test Success
    
    func testURLCondition_Success() {
        // Given
        let testInput       = "http://www.example.com/?id=12345&param=value"
        let condition       = URLCondition()
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }


    // MARK: - Test Failure
    
    func testURLCondition_NoDomain_Failure() {
        // Given
        let testInput       = "http://example"
        let condition       = URLCondition()
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testURLCondition_NoScheme_Failure() {
        // Given
        let testInput       = "www.example.com"
        let condition       = URLCondition()
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testURLCondition_NonHTTPScheme_Failure() {
        // Given
        let testInput       = "ftp://www.example.com"
        let condition       = URLCondition()
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }

    func testURLCondition_Nil_Failure() {
        // Given
        let testInput: String?  = nil
        let condition           = URLCondition()
        let expectedResult      = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }

}
