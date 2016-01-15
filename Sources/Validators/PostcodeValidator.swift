//
//  PostcodeValidator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


/**
 *  The `PostcodeValidator` contains an `PostcodeCondition`. A valid string is a postcode.
 *  - seealso: `PostcodeCondition`
 */
public struct PostcodeValidator: Validator {
    
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    /**
    Initializes a `PostcodeValidator` with a `UnitedKingdom` country.
    */
    public init() {
        self.init(country: .UnitedKingdom)
    }
    
    /**
    Initializes a `PostcodeValidator`.
    - parameter country: Country to use for postcode validation.
    */
    public init(country: PostcodeCondition.PostcodeCountries) {
        conditions = [PostcodeCondition(country: country)]
    }
    
}
