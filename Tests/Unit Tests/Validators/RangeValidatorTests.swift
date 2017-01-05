//
//  RangeValidatorTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class RangeValidatorTests: XCTestCase {
    
    
    // MARK: - Properties
    
    let validator   = RangeValidator(configuration: ConfigurationSeeds.RangeSeeds.threeToThirteen)
    
    
    // MARK: - Test Success
    
    func testRangeValidator_Success() {
        // Given
        let testInput                       = "1A2B3D4C5D"
        let expectedResult: [Condition]?    = nil
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - Test Failure
    
    func testRangeValidator_Failure() {
        // Given
        let testInput                       = "1A2B3D4C5D6E"
        let expectedResult: [Condition]?    = validator.conditions
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
}
