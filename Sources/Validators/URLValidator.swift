//
//  URLValidator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  The `URLValidator` contains an `URLCondition`. A valid string is a full URL with scheme.
 *  - seealso: `URLCondition`
 */
public struct URLValidator: Validator {
    
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init() {
        conditions = [URLCondition()]
    }
    
}
