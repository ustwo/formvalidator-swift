//
//  AlphabeticValidator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  The `AlphabeticValidator` contains an `AlphabeticCondition`. A valid string only contains letters.
 *  - seealso: `AlphabeticCondition`
 */
public struct AlphabeticValidator: ConfigurableValidator {
    
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init(configuration: AlphabeticConfiguration) {
        conditions = [AlphabeticCondition(configuration: configuration)]
    }
    
}
