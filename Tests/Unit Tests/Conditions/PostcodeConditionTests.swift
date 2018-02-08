//
//  PostcodeConditionTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class PostcodeConditionTests: XCTestCase {
    
    
    // MARK: - Configuration
    
    private struct TestableCondition {
        
        let country: PostcodeCountries
        let condition: PostcodeCondition
        
        var successInputs: [String] {
            switch country {
            case .sweden:
                return ["112 50",
                        "11434",
                        "SE-111 21",
                        "SE-11637",
                        "se-11637"]
            case .turkey:
                return ["34345"]
            case .unitedKingdom:
                return ["M1 1BA"]
            case .unitedStates:
                return ["20500",
                        "95014-2083"]
            }
        }
        
        var failureInputs: [String?] {
            switch country {
            case .sweden:
                return ["113 4",
                        "116233",
                        "us-125 41",
                        "us-125e1",
                        nil]
            case .turkey:
                return ["3411",
                        "347001",
                        "34 700",
                        "3470a",
                        nil]
            case .unitedKingdom:
                return ["M1AA 1BA",
                        "M1 1BAA",
                        nil]
            case .unitedStates:
                return ["1234",
                        "12345-1",
                        nil]
            }
        }
        
        init(country: PostcodeCountries) {
            self.country = country
            condition = PostcodeCondition(configuration: PostcodeConfiguration(country: country))
        }
        
    }
    
    
    // MARK: - Tests
    
    func testPostcodeCondition_Success() {
        for country in PostcodeCountries.allValues {
            let testCondition = TestableCondition(country: country)
            
            for input in testCondition.successInputs {
                AssertCondition(testCondition.condition, testInput: input, expectedResult: true)
            }
        }
    }
    
    func testPostcodeCondition_Failure() {
        for country in PostcodeCountries.allValues {
            let testCondition = TestableCondition(country: country)
            
            for input in testCondition.failureInputs {
                AssertCondition(testCondition.condition, testInput: input, expectedResult: false)
            }
        }
    }
    
    func testPostCondition_ChangeCountry() {
        // Given
        var condition = PostcodeCondition()
        
        // When
        condition.configuration.country = .sweden
        
        // Then
        XCTAssertEqual(condition.configuration.country, PostcodeCountries.sweden)
        XCTAssertEqual(condition.regex, PostcodeCountries.sweden.regex)
    }
    
}
