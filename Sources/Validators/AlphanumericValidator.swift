//
//  AlphanumericValidator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


/**
 *  The `AlphanumericValidator` contains an `AlphanumericCondition`. A valid string only contains letters and/or numbers.
 *  - seealso: `AlphanumericCondition`
 */
public struct AlphanumericValidator: Validator {
    
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init() {
        conditions = [AlphanumericCondition()]
    }
    
}
