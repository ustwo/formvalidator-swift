//
//  PasswordStrengthValidator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  The `PasswordStrengthValidator` contains an `PasswordStrengthCondition`. A valid string meets the required strength level.
 *  - seealso: `PasswordStrengthCondition`
 */
public struct PasswordStrengthValidator: ConfigurableValidator {
    
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init(configuration: PasswordStrengthConfiguration) {
        conditions = [PasswordStrengthCondition(configuration: configuration)]
    }
    
}
