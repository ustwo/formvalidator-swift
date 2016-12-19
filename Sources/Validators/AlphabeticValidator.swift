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
    Initializes a `AlphabeticValidator` that allows but does not allow Unicode letters or whitespace.
    */
    public init() {
        self.init(allowsUnicode: false, allowsWhitespace: false)
    }

    /**
    Initializes a `AlphabeticValidator`.
    - parameter allowsUnicode: Whether or not to allow Unicode letters. If `false` then only ASCII letters (A-Z, a-z) are allowed.
    - parameter allowsWhitespace: Whether or not to allow whitespace.
    */
    public init(allowsUnicode: Bool, allowsWhitespace: Bool) {
        conditions = [AlphabeticCondition(allowsUnicode: allowsUnicode, allowsWhitespace: allowsWhitespace)]
    }
    
}
