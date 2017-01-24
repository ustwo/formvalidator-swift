//
//  URLShorthandValidator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  The `URLShorthandValidator` contains an `URLShorthandCondition`. A valid string is a URL, with or without scheme.
 *  - seealso: `URLShorthandCondition`
 */
public struct URLShorthandValidator: Validator {
    
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init() {
        conditions = [URLShorthandCondition()]
    }
    
}
