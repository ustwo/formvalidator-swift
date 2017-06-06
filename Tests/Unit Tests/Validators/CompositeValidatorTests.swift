//
//  CompositeValidatorTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class CompositeValidatorTests: XCTestCase {
    
    
    // MARK: - Properties
    
    let firstValidator  = RangeValidator(configuration: ConfigurationSeeds.RangeSeeds.zeroToFour)
    let secondValidator = AlphanumericValidator()
    
    
    // MARK: - Test Success
    
    func testCompositeValidator_Success() {
        // Given
        let testInput                       = "1A23"
        let validator                       = CompositeValidator(validators: [firstValidator, secondValidator])
        let expectedResult: [Condition]?    = nil
        
        // When
        let actualResult = validator.checkConditions(testInput)
        
        // Initial Tests
        XCTAssertNil(firstValidator.checkConditions(testInput))
        XCTAssertNil(secondValidator.checkConditions(testInput))
        
        // Test
        XCTAssertNil(actualResult, "The `\(type(of: validator))` should respond with \(expectedResult.debugDescription) and but received \(actualResult.debugDescription).")
    }
    
    
    // MARK: - Test Failure
    
    func testCompositeValidator_Failure() {
        // Given
        let testInput                       = "1A234"
        let validator                       = CompositeValidator(validators: [firstValidator, secondValidator])
        let expectedResult: [Condition]?    = nil
        
        // When
        let actualResult = validator.checkConditions(testInput)
        
        // Initial Tests
        XCTAssertNotNil(firstValidator.checkConditions(testInput))
        XCTAssertNil(secondValidator.checkConditions(testInput))
        
        // Test
        XCTAssertNotNil(actualResult, "The `\(type(of: validator))` should respond with \(expectedResult.debugDescription) and but received \(actualResult.debugDescription).")
    }
    
}
