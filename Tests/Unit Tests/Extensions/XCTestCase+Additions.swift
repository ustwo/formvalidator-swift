//
//  XCTestCase+Additions.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest


@testable import FormValidatorSwift


extension XCTestCase {

    func AssertCondition(_ condition: Condition, testInput: String?, expectedResult: Bool, file: String = #file, line: UInt = #line) {
        // When
        let actualResult = condition.check(testInput)
        
        // Test
        if expectedResult != actualResult {
            let message = "The `\(type(of: condition))` should respond with \(expectedResult) but received \(actualResult)."
            
            #if os(iOS) || os(macOS)
                self.recordFailure(withDescription: message, inFile: file, atLine: Int(line), expected: true)
            #elseif os(tvOS)
                self.recordFailure(withDescription: message, inFile: file, atLine: Int(line), expected: true)
            #endif
        }
    }
    
    /// Asserts that a `Validator` with a given input returns the expected result.
    ///
    /// - Parameters:
    ///   - validator: `Validator` to test.
    ///   - testInput: Input to have `validator` check.
    ///   - expectedResult: The expected result for running the validator's check.
    ///   - file: File that the assertion is being run in. Defaults to `#file`.
    ///   - line: Line that the assertion is being run from. Defaults to `#line`.
    ///
    /// - Note: Currently this checks that either the actual result and expected result are either both nil or both non-nil and have the same number of elements. As `Condition` currently does not conform to equatable, further checks are not done to ensure that the conditions in the array are the same.
    func AssertValidator(_ validator: Validator, testInput: String?, expectedResult: [Condition]?, file: String = #file, line: UInt = #line) {
        // When
        let actualResult = validator.checkConditions(testInput)
        
        // Test
        guard actualResult != nil || expectedResult != nil else {
            return
        }
        
        if let actualResult = actualResult,
            let expectedResult = expectedResult,
            actualResult.count == expectedResult.count {
            
                return
        }
        
        let message = "The `\(type(of: validator))` should respond with \(expectedResult.debugDescription) and but received \(actualResult.debugDescription)."
        
        #if os(iOS) || os(macOS)
            self.recordFailure(withDescription: message, inFile: file, atLine: Int(line), expected: true)
        #elseif os(tvOS)
            self.recordFailure(withDescription: message, inFile: file, atLine: Int(line), expected: true)
        #endif
    }
    
}
