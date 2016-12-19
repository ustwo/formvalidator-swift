//
//  PresentValidatorTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class PresentValidatorTests: XCTestCase {
    
    
    // MARK: - Properties
    
    let validator   = PresentValidator()
    
    
    // MARK: - Test Success
    
    func testPresentValidator_Success() {
        // Given
        let testInput                       = "Foo"
        let expectedResult: [Condition]?    = nil
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - Test Failure
    
    func testPresentValidator_Failure() {
        // Given
        let testInput                       = ""
        let expectedResult: [Condition]?    = validator.conditions
        
        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }
    
}
