//
//  FormEntry.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


/**
 *  A single entry within a `Form`.
 */
public struct FormEntry {
    
    
    // MARK: - Properties
    
    /// A `Validatable` that contains text to be validated.
    let validatable: Validatable
    /// A `Validator` to use to validate text from `validatable`.
    let validator: Validator
    
    
    // MARK: - Check
    
    /**
    Checks the text from `validatable` using `validator` from `FormEntry` (NOT the `validator` from `validatable`).
    - returns: An array of conditions that were violated. If no conditions were violated then `nil` is returned.
    */
    func checkConditions() -> [Condition]? {
        return validator.checkConditions(validatable.validatableText)
    }
    
}
