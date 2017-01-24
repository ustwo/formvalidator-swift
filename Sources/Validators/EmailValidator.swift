//
//  EmailValidator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  The `EmailValidator` contains an `EmailCondition`. A valid string is an email address.
 *  - seealso: `EmailCondition`
 */
public struct EmailValidator: Validator {
    
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init() {
        conditions = [EmailCondition()]
    }
    
}
