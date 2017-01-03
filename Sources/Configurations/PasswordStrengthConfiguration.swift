//
//  PasswordStrengthConfiguration.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 03/01/2017.
//  Copyright © 2017 ustwo. All rights reserved.
//

import Foundation


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
