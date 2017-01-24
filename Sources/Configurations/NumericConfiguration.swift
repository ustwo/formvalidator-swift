//
//  NumericConfiguration.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 06/01/2017.
//  Copyright © 2017 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/// Stores configuration for `NumericCondition`.
public struct NumericConfiguration: Configuration {
    
    
    // MARK: - Properties
    
    /// Whether or not to allow Unicode numbers. If `false` then only ASCII numbers (0-9) are allowed.
    public let allowsUnicode: Bool
    /// Whether or not to allow whitespace.
    public let allowsWhitespace: Bool
    
    
    // MARK: - Initializers
    
    public init() {
        self.init(allowsUnicode: true, allowsWhitespace: false)
    }
    
    public init(allowsUnicode: Bool = true, allowsWhitespace: Bool = false) {
        self.allowsWhitespace = allowsWhitespace
        self.allowsUnicode = allowsUnicode
    }
    
}
