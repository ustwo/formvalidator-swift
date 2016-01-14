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

    func AssertCondition(condition: Condition, testInput: String?, expectedResult: Bool, file: String = __FILE__, line: UInt = __LINE__) {
        // When
        let actualResult = condition.check(testInput)
        
        // Test
        if expectedResult != actualResult {
            let message = "The `\(condition.dynamicType)` should respond with \(expectedResult) but received \(actualResult)."
            self.recordFailureWithDescription(message, inFile: file, atLine: line, expected: true)
        }
    }
    
}
