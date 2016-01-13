//
//  URLShorthandConditionTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class URLShorthandConditionTests: XCTestCase {
    
    
    // MARK: - Test Success
    
    func testURLShorthandCondition_FullURL_Success() {
        // Given
        let testInput       = "http://www.example.com/?id=12345&param=value"
        let condition       = URLShorthandCondition()
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testURLShorthandCondition_ShortURL_Success() {
        // Given
        let testInput       = "example.com"
        let condition       = URLShorthandCondition()
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }


    // MARK: - Test Failure
    
    func testURLShorthandCondition_NoDomain_Failure() {
        // Given
        let testInput       = "http://example"
        let condition       = URLShorthandCondition()
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testURLShorthandCondition_NoPath_Failure() {
        // Given
        let testInput       = "http://"
        let condition       = URLShorthandCondition()
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testURLShorthandCondition_NonHTTPScheme_Failure() {
        // Given
        let testInput       = "ftp://www.example.com"
        let condition       = URLShorthandCondition()
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testURLShorthandCondition_Nil_Failure() {
        // Given
        let testInput: String?  = nil
        let condition           = URLShorthandCondition()
        let expectedResult      = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }

}
