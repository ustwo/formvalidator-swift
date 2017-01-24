//
//  Form.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  A form to assist in validating `ValidatorControl` objects' current states.
 */
public protocol Form {
    // MARK: - Properties
    
    /// Entries in the form.
    var entries: [FormEntry] { get set }
    
    /// Whether or not the entire form is valid.
    var isValid: Bool { get }
    
    
    // MARK: - Initializers
    
    /**
     Creates an empty `Form`.
     */
    init()
    
    /**
     Creates a `Form` where each `Validatable` uses its own `Validator` for validation.
     - parameter validatables: Array of `Validatable`.
     */
    init(validatables: [ValidatorControl])
    
    /**
     Creates a `Form` where each `Validatable` uses a custom `Validator` for validation. If `validatables` and `validators` have a different number of elements then returns `nil`.
     
     - parameter validatables: Array of `Validatable`.
     - parameter validators:   Array of `Validator`.
     */
    init?(validatables: [ValidatorControl], validators: [Validator])
    
    
    // MARK: - Manipulate Entry
    
    mutating func addEntry(_ control: ValidatorControl)
    
    mutating func removeControlAtIndex(_ index: Int) -> ValidatorControl?
    
    
    // MARK: - Check
    
    /**
     Checks the text from each entry in `entries`.
     - returns: An array of conditions that were violated. If no conditions were violated then `nil` is returned.
     */
    func checkConditions() -> [Condition]?
    
}


// Default implementation for `isValid`, `init(validatables:)`, `init?(validatables:validators:)`, and `checkConditions`.
public extension Form {
    
    
    // MARK: - Properties
    
    var isValid: Bool {
        return checkConditions() == nil
    }

    
    // MARK: - Initializers
    
    init(validatables: [ValidatorControl]) {
        self.init()
        entries = validatables.map { FormEntry(validatable: $0, validator: $0.validator) }
    }
    
    init?(validatables: [ValidatorControl], validators: [Validator]) {
        guard validatables.count == validators.count else {
            return nil
        }
        
        self.init()
        
        var entries = [FormEntry]()
        for index in 0 ..< validatables.count {
            entries.append(FormEntry(validatable: validatables[index], validator: validators[index]))
        }
        self.entries = entries
    }
    
    
    // MARK: - Manipulate Entry
    
    mutating func addEntry(_ control: ValidatorControl) {
        entries.append(FormEntry(validatable: control, validator: control.validator))
    }
    
    mutating func removeControlAtIndex(_ index: Int) -> ValidatorControl? {
        let entry = entries.remove(at: index)
        return entry.validatable
    }
    
    
    // MARK: - Check
    
    func checkConditions() -> [Condition]? {
        let violatedConditions = entries.map { $0.checkConditions() }.filter { $0 != nil }.map { $0! }.flatMap { $0 }
        
        return violatedConditions.isEmpty ? nil : violatedConditions
    }
    
}
