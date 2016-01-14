//
//  ValidatorControl.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


public protocol ValidatorControlDelegate: class {
    
    func validatorControlDidChange(validatorControl: ValidatorControl)
    func validatorControl(validatorControl: ValidatorControl, changedValidState validState: Bool)
    func validatorControl(validatorControl: ValidatorControl, violatedConditions conditions: [Condition])
    
}


public protocol ValidatorControl: class, Validatable {
    
    var isValid: Bool { get }
    var shouldAllowViolation: Bool { get set }
    var validateOnFocusLossOnly: Bool { get set }
    var validatorDelegate: ValidatorControlDelegate? { get set }
    
}


public extension ValidatorControl {
    
    var isValid: Bool {
        return validator.checkConditions(validatableText) == nil
    }
    
}
