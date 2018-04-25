//
//  OptionalValidatorTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 10/04/2018.
//  Copyright © 2018 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class OptionalValidatorTests: XCTestCase {


    // MARK: - Properties

    let validator   = OptionalValidator(conditions: [AlphabeticCondition()])


    // MARK: - Test Success

    func testOptionalValidator_Success_PrimaryAndConditionsMet() {
        // Given
        let testInput                       = "Foo"
        let expectedResult: [Condition]?    = nil

        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }

    func testOptionalValidator_Success_PrimaryNotMet() {
        // Given
        let testInput                       = ""
        let expectedResult: [Condition]?    = nil

        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }


    // MARK: - Test Failure

    func testOptionalValidator_Failure() {
        // Given
        let testInput                       = "Foo123"
        let expectedResult: [Condition]?    = validator.conditions

        // Test
        AssertValidator(validator, testInput: testInput, expectedResult: expectedResult)
    }

}
