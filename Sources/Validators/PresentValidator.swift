//
//  PresentValidator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  The `PresentValidator` contains an `PresentCondition`. A valid string is a non-empty string.
 *  - seealso: `PresentCondition`
 */
public struct PresentValidator: Validator {
    
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init() {
        conditions = [PresentCondition()]
    }
    
}
