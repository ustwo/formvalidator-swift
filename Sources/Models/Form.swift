//
//  Form.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


/**
 *  A signle entry within a `Form`.
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


/**
 *  A form to assist in validating `Validatable` objects' current states.
 */
public struct Form {
    
    
    // MARK: - Properties
    
    /// Entries in the form.
    let entries: [FormEntry]
    
    
    // MARK: - Initializers
    
    /**
     Creates a `Form` where each `Validatable` uses its own `Validator` for validation.
     - parameter validatables: Array of `Validatable`.
     */
    init(validatables: [Validatable]) {
        entries = validatables.map { FormEntry(validatable: $0, validator: $0.validator) }
    }
    
    /**
     Creates a `Form` where each `Validatable` uses a custom `Validator` for validation. If `validatables` and `validators` have a different number of elements then returns `nil`.
     
     - parameter validatables: Array of `Validatable`.
     - parameter validators:   Array of `Validator`.
     */
    init?(validatables: [Validatable], validators: [Validator]) {
        guard validatables.count == validators.count else {
            return nil
        }
        
        var entries = [FormEntry]()
        for index in 0 ..< validatables.count {
            entries.append(FormEntry(validatable: validatables[index], validator: validators[index]))
        }
        self.entries = entries
    }
    
    
    // MARK: - Check
    
    /**
    Checks the text from each entry in `entries`.
    - returns: An array of conditions that were violated. If no conditions were violated then `nil` is returned.
    */
    func checkConditions() -> [Condition]? {
        let violatedConditions = entries.map { $0.checkConditions() }.filter { $0 != nil }.map { $0! }.flatMap { $0 }
        
        return violatedConditions.isEmpty ? nil : violatedConditions
    }
    
}
