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
    
    public var localizedViolationString = StringLocalization.sharedInstance.localizedString("US2KeyConditionViolationRange", comment: "")
    
    public let regex = ""
    
    public var shouldAllowViolation = true
    
    public let range: CountableRange<Int>
    
    
    // MARK: - Initializers
    
    /**
    Initializes a `RangeCondition` with a `0..<1` range.
    */
    public init() {
        self.init(range: 0..<1)
    }
    
    
    public init(range: CountableRange<Int>) {
        self.range = range
    }
    
    public func check(_ text: String?) -> Bool {
        guard let sourceText = text else {
            return false
        }
        
        return sourceText.characters.count >= range.lowerBound && sourceText.characters.count <= range.lowerBound.distance(to: range.upperBound)
    }
    
}
