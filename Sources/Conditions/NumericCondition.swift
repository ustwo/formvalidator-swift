//
//  NumericCondition.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


/**
 *  The `NumericCondition` checks a string for numbers.
 */
public struct NumericCondition: Condition {
    
    
    // MARK: - Properties
    
    public var localizedViolationString = StringLocalization.localizedString("US2KeyConditionViolationNumeric", comment: "")
    
    public let regex = "^\\d+$"
    
    public var shouldAllowViolation = true
    
}
