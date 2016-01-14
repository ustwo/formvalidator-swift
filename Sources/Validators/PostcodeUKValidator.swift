//
//  PostcodeUKValidator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


/**
 *  The `PostcodeUKValidator` contains an `PostcodeUKCondition`. A valid string is UK postcode.
 *  - seealso: `PostcodeUKCondition`
 */
public struct PostcodeUKValidator: Validator {
    
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init() {
        conditions = [PostcodeUKCondition()]
    }
    
}
