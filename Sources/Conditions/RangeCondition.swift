//
//  RangeCondition.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


/**
 *  The `RangeCondition` validates the length of a string.
 */
public struct RangeCondition: Condition {
    
    
    // MARK: - Properties
    
    public var localizedViolationString = StringLocalization.localizedString("US2KeyConditionViolationRange", comment: "")
    
    public let regex = ""
    
    public var shouldAllowViolation = true
    
    public let range: Range<Int>
    
    
    public init(range: Range<Int>) {
        self.range = range
    }
    
    public func check(text: String?) -> Bool {
        guard let sourceText = text else {
            return false
        }
        
        return sourceText.characters.count >= range.startIndex && sourceText.characters.count <= range.startIndex.distanceTo(range.endIndex)
    }
    
}
