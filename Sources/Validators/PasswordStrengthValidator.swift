//
//  PasswordStrengthValidator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


/**
 *  The `PasswordStrengthValidator` contains an `PasswordStrengthCondition`. A valid string meets the required strength level.
 *  - seealso: `PasswordStrengthCondition`
 */
public struct PasswordStrengthValidator: Validator {
    
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    /**
    Initializes a `PasswordStrengthValidator`.
    - parameter requiredStrength: Minimum strength required to be considered valid.
    */
    public init(requiredStrength: PasswordStrength) {
        conditions = [PasswordStrengthCondition(requiredStrength: requiredStrength)]
    }
    
}
