//
//  PasswordStrengthConfiguration.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 03/01/2017.
//  Copyright © 2017 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/// The strength required for the password. The strength is measured on five simple criteria - lower case characters, upper case characters, numeric characters, special characters, and is more than 8 characters long. Each of these matched criteria moves the password strength of the string up one strength. Not having 8 character minimum reduces the string by one strength level.
public enum PasswordStrength: Int {
    case veryWeak, weak, medium, strong, veryStrong
}


/// Stores configuration for `PasswordStrengthCondition`.
public struct PasswordStrengthConfiguration: Configuration {
    
    
    // MARK: - Properties
    
    /// Minimum strength required to be considered valid.
    public let requiredStrength: PasswordStrength
    
    
    // MARK: - Initializers
    
    public init() {
        self.init(requiredStrength: .veryStrong)
    }
    
    /// Initializes a `PasswordStrengthConfiguration`.
    ///
    /// - Parameter requiredStrength: Minimum strength required to be considered valid.
    public init(requiredStrength: PasswordStrength) {
        self.requiredStrength = requiredStrength
    }
    
}
