//
//  NumericValidator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  The `NumericValidator` contains an `NumericCondition`. A valid string only contains numbers.
 *  - seealso: `NumericCondition`
 */
public struct NumericValidator: ConfigurableValidator {
    
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init(configuration: NumericConfiguration) {
        conditions = [NumericCondition(configuration: configuration)]
    }
    
}
