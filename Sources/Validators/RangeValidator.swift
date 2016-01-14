//
//  RangeValidator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


/**
 *  The `RangeValidator` contains an `RangeCondition`. A valid string meets the required string length.
 *  - seealso: `RangeCondition`
 */
public struct RangeValidator: Validator {
    
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init(range: Range<Int>) {
        conditions = [RangeCondition(range: range)]
    }
    
}
