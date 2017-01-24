//
//  RangeValidator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  The `RangeValidator` contains an `RangeCondition`. A valid string meets the required string length.
 *  - seealso: `RangeCondition`
 */
public struct RangeValidator: ConfigurableValidator {
    
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init(configuration: RangeConfiguration) {
        conditions = [RangeCondition(configuration: configuration)]
    }
    
}
