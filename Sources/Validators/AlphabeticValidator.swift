//
//  AlphabeticValidator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


/**
 *  The `AlphabeticValidator` contains an `AlphabeticCondition`. A valid string only contains letters.
 *  - seealso: `AlphabeticCondition`
 */
public struct AlphabeticValidator: Validator {
    
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers

    /**
    Initializes a `AlphabeticValidator`.
    - parameter allowsWhitespace: Whether or not to allow whitespace.
    */
    public init(allowsWhitespace: Bool) {
        conditions = [AlphabeticCondition(allowsWhitespace: allowsWhitespace)]
    }
    
}
