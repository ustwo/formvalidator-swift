//
//  RangeCondition.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  The `RangeCondition` validates the length of a string.
 */
public struct RangeCondition: ConfigurableCondition {
    
    
    // MARK: - Properties
    
    public var localizedViolationString = StringLocalization.sharedInstance.localizedString("US2KeyConditionViolationRange", comment: "")
    
    public let regex = ""
    
    public var shouldAllowViolation = true
    
    public let configuration: RangeConfiguration
    
    
    // MARK: - Initializers
    
    public init(configuration: RangeConfiguration) {
        self.configuration = configuration
    }
    
    
    // MARK: - Check
    
    public func check(_ text: String?) -> Bool {
        guard let sourceText = text else {
            return false
        }
        
        return sourceText.count >= configuration.range.lowerBound &&
               sourceText.count <= configuration.range.lowerBound.distance(to: configuration.range.upperBound)
    }
    
}
