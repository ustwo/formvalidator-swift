//
//  URLValidatorTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class URLValidatorTests: XCTestCase {
    
    
    // MARK: - Properties
    
    let validator   = URLValidator()
    
    
    // MARK: - Test Success
    
    func testURLValidator_Success() {
        // Given
        let testInput                       = "http://www.example.com/?id=12345&param=value"
        let expectedResult: [Condition]?    = nil
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - Test Failure
    
    func testURLValidator_Failure() {
        // Given
        let testInput                       = "example.com"
        let expectedResult: [Condition]?    = validator.conditions
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
}
