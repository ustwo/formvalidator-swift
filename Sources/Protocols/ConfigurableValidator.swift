//
//  ConfigurableValidator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 03/01/2017.
//  Copyright © 2017 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/// A special type of `Validator` that allows configuration.
public protocol ConfigurableValidator: Validator {
    
    associatedtype ConfigurationType: Configuration
    
    /// Initializes a new `ConfigurableValidator` with a given configuration.
    ///
    /// - Parameter configuration: The configuration to use.
    init(configuration: ConfigurationType)
    
}


// Default implemenation of `Condition:init()`. Initializes with the default configuration.
extension ConfigurableValidator {
    
    public init() {
        self.init(configuration: ConfigurationType())
    }
    
}
