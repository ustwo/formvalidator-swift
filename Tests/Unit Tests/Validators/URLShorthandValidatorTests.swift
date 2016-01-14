//
//  URLShorthandValidatorTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class URLShorthandValidatorTests: XCTestCase {
    
    
    // MARK: - Properties
    
    let validator   = URLShorthandValidator()
    
    
    // MARK: - Test Success
    
    func testURLShorthandValidator_Success() {
        // Given
        let testInput                       = "example.com"
        let expectedResult: [Condition]?    = nil
        
        // When
        let actualResult = validator.checkConditions(testInput)
        
        // Test
        XCTAssertNil(actualResult, "The `\(validator.dynamicType)` should respond with \(expectedResult) and but received \(actualResult).")
    }
    
    
    // MARK: - Test Failure
    
    func testURLShorthandValidator_Failure() {
        // Given
        let testInput                       = "http://example"
        let expectedResult: [Condition]?    = validator.conditions
        
        // When
        let actualResult = validator.checkConditions(testInput)
        
        // Test
        XCTAssertNotNil(actualResult, "The `\(validator.dynamicType)` should respond with \(expectedResult) and but received \(actualResult).")
    }
    
}
