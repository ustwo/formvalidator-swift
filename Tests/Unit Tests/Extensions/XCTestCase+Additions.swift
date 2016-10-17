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
            self.recordFailure(withDescription: message, inFile: file, atLine: line, expected: true)
        }
    }
    
}
