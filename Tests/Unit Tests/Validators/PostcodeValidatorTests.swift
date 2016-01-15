//
//  PostcodeValidatorTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class PostcodeValidatorTests: XCTestCase {
    
    
    // MARK: - Properties
    
    let validator   = PostcodeValidator(country: .UnitedKingdom)
    
    
    // MARK: - Test Success
    
    func testPostcodeValidator_Success() {
        // Given
        let testInput                       = "M1 1BA"
        let expectedResult: [Condition]?    = nil
        
        // When
        let actualResult = validator.checkConditions(testInput)
        
        // Test
        XCTAssertNil(actualResult, "The `\(validator.dynamicType)` should respond with \(expectedResult) and but received \(actualResult).")
    }
    
    
    // MARK: - Test Failure
    
    func testPostcodeValidator_Failure() {
        // Given
        let testInput                       = "M1AA 1BA"
        let expectedResult: [Condition]?    = validator.conditions
        
        // When
        let actualResult = validator.checkConditions(testInput)
        
        // Test
        XCTAssertNotNil(actualResult, "The `\(validator.dynamicType)` should respond with \(expectedResult) and but received \(actualResult).")
    }
    
}
