//
//  AlphanumericValidator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


/**
 *  The `AlphanumericValidator` contains an `AlphanumericCondition`. A valid string only contains letters and/or numbers.
 *  - seealso: `AlphanumericCondition`
 */
public struct AlphanumericValidator: Validator {
    
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    /// Initializes an `AlphanumericValidator` that does not allow Unicode letters and numbers nor whitespace.
    public init() {
        self.init(allowsUnicode: false, allowsWhitespace: false)
    }
    
    /// Initializes an `AlphanumericValidator`.
    ///
    /// - Parameters:
    ///   - allowsUnicode: Whether or not to allow Unicode letters and numbers. If `false` then only ASCII letters (A-Z, a-z, 0-9) are allowed. Default is `false`.
    ///   - allowsWhitespace: Whether or not to allow whitespace. Default is false.
    public init(allowsUnicode: Bool = false, allowsWhitespace: Bool = false) {
        conditions = [AlphanumericCondition(allowsUnicode: allowsUnicode, allowsWhitespace: allowsWhitespace)]
    }
    
}
