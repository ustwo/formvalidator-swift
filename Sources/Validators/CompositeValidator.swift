//
//  CompositeValidator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  The `CompositeValidator` concatenates all of the conditions of the individual validators. All conditions must be satisfied for a string to be valid.
 */
public struct CompositeValidator: Validator {
    
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    public let validators: [Validator]
    
    
    // MARK: - Initializers
    
    public init() {
        self.init(validators: [PresentValidator()])
    }
    
    /**
    Initializes a `CompositeValidator`.
    - parameter validators: Validators which are used for validation.
    */
    public init(validators: [Validator]) {
        self.conditions = validators.map { $0.conditions }.flatMap { $0 }
        self.validators = validators
    }
    
}
