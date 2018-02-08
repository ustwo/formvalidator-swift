//
//  ValidatorTextField-AppKit.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 10/01/2017.
//  Copyright © 2017 ustwo Fampany Ltd. All rights reserved.
//

import AppKit


open class ValidatorTextField: NSTextField, ValidatorControl {
    
    
    // MARK: - Properties
    
    open var shouldAllowViolation = false
    open var validateOnFocusLossOnly = false
    open let validator: Validator
    /// Validator delegate for the text field.
    ///
    /// - SeeAlso: `setValidatorDelegate(_:)` to set the validator delegate.
    open weak var validatorDelegate: ValidatorControlDelegate? {
        return validatorControlResponder?.delegate
    }
    
    open var validatableText: String? {
        return stringValue
    }
    
    fileprivate var validatorControlResponder: ValidatorTextFieldResponder?
    
    
    // MARK: - Initializers
    
    public convenience init(validator: Validator) {
        self.init(frame: CGRect.zero, validator: validator)
    }
    
    public init(frame: CGRect, validator: Validator) {
        self.validator = validator
        
        super.init(frame: frame)
        
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented.")
    }
    
    deinit {
        guard let responder = validatorControlResponder else {
            return
        }
        
        NotificationCenter.default.removeObserver(responder,
                                                  name: NSControl.textDidChangeNotification,
                                                  object: self)
        NotificationCenter.default.removeObserver(responder,
                                                  name: NSControl.textDidEndEditingNotification,
                                                  object: self)
    }
    
    
    // MARK: - Setup
    
    fileprivate func setup() {
        let responder = ValidatorTextFieldResponder(validatorTextField: self)
        validatorControlResponder = responder
        
        NotificationCenter.default.addObserver(responder,
                                               selector: #selector(ValidatorTextFieldResponder.textFieldDidChange(_:)),
                                               name: NSControl.textDidChangeNotification,
                                               object: self)
        NotificationCenter.default.addObserver(responder,
                                               selector: #selector(ValidatorTextFieldResponder.textFieldDidEndEditing(_:)),
                                               name: NSControl.textDidEndEditingNotification,
                                               object: self)
    }
    
    
    // MARK: - Custom Setters
    
    /// Sets the `validatorDelegate` for the text field. This allows custom responses to both `UITextFieldDelegate` callbacks as well as those from `ValidatorControlDelegate`.
    ///
    /// - Parameter newDelegate: The delegate for `ValidatorTextField` callbacks.
    open func setValidatorDelegate(_ newDelegate: ValidatorControlDelegate) {
        validatorControlResponder?.delegate = newDelegate
    }
    
    
    // MARK: - Callbacks on state change
    
    open func validatorTextFieldSuccededConditions() { }
    
    open func validatorTextFieldViolatedConditions(_ conditions: [Condition]) { }
    
}

internal class ValidatorTextFieldResponder: NSObject {
    
    
    // MARK: - Properties
    
    var validatorTextField: ValidatorTextField
    
    weak var delegate: ValidatorControlDelegate?
    
    fileprivate var didEndEditing       = false
    fileprivate var lastIsValid: Bool?
    
    
    // MARK: - Initializers
    
    init(validatorTextField: ValidatorTextField) {
        self.validatorTextField = validatorTextField
        
        let formatter = ValidityFormatter()
        formatter.validatorTextField = validatorTextField
        
        validatorTextField.formatter = formatter
    }
    
    
    // MARK: - Notifications
    
    @objc func textFieldDidChange(_ notification: Notification?) {
        defer {
            // Inform delegate about changes
            delegate?.validatorControlDidChange(validatorTextField)
        }
        
        // Only validate if violations are allowed
        //  Validate according to `validateOnFocusLossOnly` while editing first time or after focus loss
        guard validatorTextField.shouldAllowViolation &&
            (!validatorTextField.validateOnFocusLossOnly || (validatorTextField.validateOnFocusLossOnly && didEndEditing)) else {
                return
        }
        
        let inputText = validatorTextField.stringValue
        
        let conditions = validatorTextField.validator.checkConditions(inputText)
        let isValid = conditions == nil
        if lastIsValid != isValid {
            lastIsValid = isValid
            
            // Inform the text field about valid state change
            if isValid {
                validatorTextField.validatorTextFieldSuccededConditions()
            } else {
                validatorTextField.validatorTextFieldViolatedConditions(conditions!)
            }
            
            // Inform delegate about valid state change
            delegate?.validatorControl(validatorTextField, changedValidState: isValid)
            
            if !isValid {
                // Inform delegatate about violation
                delegate?.validatorControl(validatorTextField, violatedConditions: conditions!)
            }
        }
    }
    
    @objc func textFieldDidEndEditing(_ notification: Notification?) {
        didEndEditing = true
        
        textFieldDidChange(nil)
    }
    
}


fileprivate final class ValidityFormatter: Formatter {
    
    
    // MARK: - Properties
    
    weak var validatorTextField: ValidatorTextField?
    
    
    // MARK: - Formatter
    
    override func isPartialStringValid(_ partialStringPtr: AutoreleasingUnsafeMutablePointer<NSString>, proposedSelectedRange proposedSelRangePtr: NSRangePointer?, originalString origString: String, originalSelectedRange origSelRange: NSRange, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        
        guard let validatorTextField = validatorTextField else {
            return true
        }
        
        let conditions = validatorTextField.validator.checkConditions(partialStringPtr.pointee as String)
        
        if let conditions = conditions {
            validatorTextField.validatorTextFieldViolatedConditions(conditions)
        } else {
            validatorTextField.validatorTextFieldSuccededConditions()
        }
        
        if !validatorTextField.validateOnFocusLossOnly && origSelRange.location != 0,
            let conditions = conditions,
            (!validatorTextField.shouldAllowViolation || !(conditions.isEmpty || conditions[0].shouldAllowViolation)) {
            
            return false
        }
        
        return true
    }
    
    override func string(for obj: Any?) -> String? {
        return obj as? String
    }
    
    override func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?, for string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        
        obj?.pointee = string as AnyObject
        
        return true
    }
    
}
