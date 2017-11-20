//
//  Condition.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 12/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  A _Condition_ is the smallest sub element of the validation framework.
 *  It tells how a string must be structured or wat is has to contain or not.
 *  Validators are for storing those conditions and checking
 *  for violations of every condition.
 *
 *  Conditions are recommended working with regular expressions but can also contain
 *  their custom checking code for detecting violations in the string to check.
 *
 *  By returning a localized string in method `localizedViolationString` the
 *  user can be informed in a convenient way what went wrong.
 */
public protocol Condition: CustomStringConvertible {
    
    /// Localized string which described the kind of violation.
    var localizedViolationString: String { get set }
    
    /// A regular expression string which the validated string is matched against.
    var regex: String { get }
    
    /// If set to `false` the user is not able to enter characters which would break the condition.
    var shouldAllowViolation: Bool { get set }
    
    /// Initializer that creates a condition based on default values.
    init()
    
    /**
     Check the custom condition.
     - parameter text: `String` to check.
     - returns: Whether the condition check passed or failed.
     - note: Checking a `nil` value should always return `false`.
     */
    func check(_ text: String?) -> Bool
}


// Default implementation of `Condition.check(text:)` returns `true` if the `regex` is valid and there is at least one match in `text`.
public extension Condition {
    
    func check(_ text: String?) -> Bool {
        guard let sourceText = text,
            let regExpression = try? NSRegularExpression(pattern: regex, options: .caseInsensitive) else {
                return false
        }
        
        return regExpression.firstMatch(in: sourceText, options: [], range: NSRange(location: 0, length: sourceText.count)) != nil
    }
    
}


public extension Condition {
    
    var description: String {
        var result = "<"
        
        result += "\(type(of: self))"
        result += "\n <localizedViolationString: \(localizedViolationString)>"
        result += "\n <shouldAllowViolation: \(shouldAllowViolation)>"
        
        result += ">"
        
        return result
    }
    
}
