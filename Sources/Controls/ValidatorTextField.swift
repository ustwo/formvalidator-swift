//
//  ValidatorTextField.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import UIKit


open class ValidatorTextField: UITextField, ValidatorControl {
    
    
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
        return text
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
        
        NotificationCenter.default.removeObserver(responder, name: NSNotification.Name.UITextFieldTextDidChange, object: self)
        NotificationCenter.default.removeObserver(responder, name: NSNotification.Name.UITextFieldTextDidEndEditing, object: self)
    }
    
    
    // MARK: - Setup
    
    fileprivate func setup() {
        let responder = ValidatorTextFieldResponder(validatorTextField: self)
        validatorControlResponder = responder
        super.delegate = responder
        
        NotificationCenter.default.addObserver(responder, selector: #selector(ValidatorTextFieldResponder.textFieldDidChange(_:)), name: NSNotification.Name.UITextFieldTextDidChange, object: self)
        NotificationCenter.default.addObserver(responder, selector: #selector(UITextFieldDelegate.textFieldDidEndEditing(_:)), name: NSNotification.Name.UITextFieldTextDidEndEditing, object: self)
    }
    
    
    // MARK: - Custom Setters
    
    /// Sets the `validatorDelegate` for the text field. This allows custom responses to both `UITextFieldDelegate` callbacks as well as those from `ValidatorControlDelegate`.
    ///
    /// - Parameter newDelegate: The delegate for `ValidatorTextField` callbacks.
    open func setValidatorDelegate(_ newDelegate: ValidatorControlDelegate & UITextFieldDelegate) {
        validatorControlResponder?.delegate = newDelegate
    }
    
    
    // MARK: - Callbacks on state change
    
    open func validatorTextFieldSuccededConditions() { }
    
    open func validatorTextFieldViolatedConditions(_ conditions: [Condition]) { }
    
}


internal class ValidatorTextFieldResponder: NSObject, UITextFieldDelegate {
    
    
    // MARK: - Properties
    
    var validatorTextField: ValidatorTextField
    
    weak var delegate: (ValidatorControlDelegate & UITextFieldDelegate)?
    
    fileprivate var didEndEditing       = false
    fileprivate var lastIsValid: Bool?  = nil
    
    
    // MARK: - Initializers
    
    init(validatorTextField: ValidatorTextField) {
        self.validatorTextField = validatorTextField
    }
    
    
    // MARK: - UITextFieldDelegate
    
    @objc func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let sourceText = textField.text else {
            return false
        }
        
        let originalString = NSString(string: sourceText)
        
        let futureString = originalString.replacingCharacters(in: range, with: string)
        let conditions = validatorTextField.validator.checkConditions(futureString)
        
        if let conditions = conditions {
            validatorTextField.validatorTextFieldViolatedConditions(conditions)
        } else {
            validatorTextField.validatorTextFieldSuccededConditions()
        }
        
        if !validatorTextField.validateOnFocusLossOnly && range.location != 0,
            let conditions = conditions,
            (!validatorTextField.shouldAllowViolation || !conditions[0].shouldAllowViolation) {
                return false
        }
        
        if let result = delegate?.textField?(validatorTextField, shouldChangeCharactersIn: range, replacementString: string) {
            return result
        }
        
        return true
    }
    
    func textFieldDidChange(_ notification: Notification?) {
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
        
        let conditions = validatorTextField.validator.checkConditions(validatorTextField.text)
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
    
    @objc func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if let result = delegate?.textFieldShouldBeginEditing?(validatorTextField) {
            return result
        }
        
        return true
    }
    
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.textFieldDidBeginEditing?(validatorTextField)
    }
    
    @objc func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if let result = delegate?.textFieldShouldEndEditing?(validatorTextField) {
            return result
        }
        
        return true
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        didEndEditing = true
        
        textFieldDidChange(nil)
        
        delegate?.textFieldDidEndEditing?(validatorTextField)
    }
    
    @objc func textFieldShouldClear(_ textField: UITextField) -> Bool {
        if let result = delegate?.textFieldShouldClear?(validatorTextField) {
            return result
        }
        
        return true
    }
    
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let result = delegate?.textFieldShouldReturn?(validatorTextField) {
            return result
        }
        
        return true
    }
    
}
