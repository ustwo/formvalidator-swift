//
//  ValidatorTextView-AppKit.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 10/01/2017.
//  Copyright © 2017 ustwo Fampany Ltd. All rights reserved.
//

import AppKit


open class ValidatorTextView: NSTextView, ValidatorControl {
    
    
    // MARK: - Properties
    
    open var shouldAllowViolation = false
    open var validateOnFocusLossOnly = false
    open let validator: Validator
    open weak var validatorDelegate: ValidatorControlDelegate?
    
    open var validatableText: String? {
        return string
    }
    
    private var didEndEditing       = false
    private var lastIsValid: Bool?
    
    
    // MARK: - Initializers
    
    public convenience init(validator: Validator) {
        self.init(frame: CGRect.zero, validator: validator)
    }
    
    public convenience init(frame: CGRect, validator: Validator) {
        self.init(frame: frame, textContainer: nil, validator: validator)
    }
    
    public init(frame: CGRect, textContainer: NSTextContainer?, validator: Validator) {
        self.validator = validator
        
        super.init(frame: frame, textContainer: textContainer)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented.")
    }
    
    
    // MARK: - NSTextView
    
    open override func shouldChangeText(in affectedCharRange: NSRange, replacementString: String?) -> Bool {
        let superShouldChange = super.shouldChangeText(in: affectedCharRange, replacementString: replacementString)
        
        guard let replacementString = replacementString,
            let sourceText = validatableText else {
            
                return superShouldChange
        }
        
        let originalString = NSString(string: sourceText)
        
        let futureString = originalString.replacingCharacters(in: affectedCharRange, with: replacementString)
        let conditions = validator.checkConditions(futureString)
        
        if !validateOnFocusLossOnly && affectedCharRange.location != 0,
            let conditions = conditions,
            (!shouldAllowViolation || !(conditions.isEmpty || conditions[0].shouldAllowViolation)) {
            
            return false
        }
        
        return superShouldChange
    }
    
    open override func didChangeText() {
        super.didChangeText()
        
        defer {
            // Inform delegate about changes
            validatorDelegate?.validatorControlDidChange(self)
        }
        
        // Only validate if violations are allowed
        //  Validate according to `validateOnFocusLossOnly` while editing first time or after focus loss
        guard shouldAllowViolation &&
            (!validateOnFocusLossOnly || (validateOnFocusLossOnly && didEndEditing)) else {
                return
        }
        
        let conditions = validator.checkConditions(validatableText)
        let isValid = conditions == nil
        if lastIsValid != isValid {
            lastIsValid = isValid
            
            // Inform delegate about valid state change
            validatorDelegate?.validatorControl(self, changedValidState: isValid)
            
            if !isValid {
                // Inform delegatate about violation
                validatorDelegate?.validatorControl(self, violatedConditions: conditions!)
            }
        }
    }
    
}
