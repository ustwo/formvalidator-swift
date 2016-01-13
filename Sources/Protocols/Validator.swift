//
//  Validator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


// FIXME: There are some Swift compiler issues that I need to sort out right now with regard to validators.

/**
 *  `Validator` is a holder for conditions of type `Condition`.
 *  The validator checks for violation of each condition. Returned will be a collection of
 *  violated conditions or `nil` if the string to check is correct or no condition was added.
 */
public protocol Validator {
    
    /// Conditions to use when validating text.
    var conditions: [Condition] { get set }
 
    /**
     Add a condition to the validator.
     - parameter condition: Condition to add.
     */
    func addCondition(condition: Condition)
    
    /**
     Checks `text` for violation of each condition.
     - parameter text: `String` to check.
     - returns: An array of conditions that were violated by `text`. If no conditions were violated then `nil` is returned.
     */
    func checkConditions(text: String?) -> [Condition]?
    
    /**
     Removes all conditions of `conditionClass` type.
     - parameter conditionClass: `Type` of condition to remove.
     */
    func removeConditionOfClass<T: Condition>(conditionClass: T.Type)
    
}


// Default implementation for `addCondition`, `checkConditions`, and `removeConditionOfClass`.
public extension Validator {
    
    mutating func addCondition(condition: Condition) {
        conditions.append(condition)
    }
    
    func checkConditions(text: String?) -> [Condition]? {
        let violations = conditions.filter { !($0.check(text)) }
        
        return violations.isEmpty ? nil : violations
    }
    
    mutating func removeConditionOfClass<T: Condition>(conditionClass: T.Type) {
        conditions = conditions.filter { !($0 is T) }
    }
    
}
