//
//  AlphanumericValidator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  The `AlphanumericValidator` contains an `AlphanumericCondition`. A valid string only contains letters and/or numbers.
 *  - seealso: `AlphanumericCondition`
 */
public struct AlphanumericValidator: ConfigurableValidator {
    
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init(configuration: AlphanumericConfiguration) {
        conditions = [AlphanumericCondition(configuration: configuration)]
    }
    
}
