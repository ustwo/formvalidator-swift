//
//  ValidatorTextField.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import UIKit


public class ValidatorTextField: UITextField, ValidatorControl {
    
    
    // MARK: - Properties
    
    public var shouldAllowViolation = true
    public var validateOnFocusLossOnly = false
    public var validator: Validator?
    public weak var validatorDelegate: ValidatorControlDelegate?
    
    public var validatableText: String? {
        return text
    }
    
    private var validatorControlResponder: ValidatorTextFieldResponder?
    
    
    // MARK: - Initializers
    
    public convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        guard let responder = validatorControlResponder else {
            return
        }
        
        NSNotificationCenter.defaultCenter().removeObserver(responder, name: UITextFieldTextDidChangeNotification, object: self)
        NSNotificationCenter.defaultCenter().removeObserver(responder, name: UITextFieldTextDidEndEditingNotification, object: self)
    }
    
    
    // MARK: - Setup
    
    private func setup() {
        let responder = ValidatorTextFieldResponder(validatorTextField: self)
        validatorControlResponder = responder
        super.delegate = responder
        
        NSNotificationCenter.defaultCenter().addObserver(responder, selector: Selector("textFieldDidChange:"), name: UITextFieldTextDidChangeNotification, object: self)
        NSNotificationCenter.defaultCenter().addObserver(responder, selector: Selector("textFieldDidEndEditing:"), name: UITextFieldTextDidEndEditingNotification, object: self)
    }
    
    
    // MARK: - Callbacks on state change
    
    public func validatorTextFieldSuccededConditions() { }
    
    public func validatorTextFieldViolatedConditions(conditions: [Condition]) { }
    
}


internal class ValidatorTextFieldResponder: NSObject, UITextFieldDelegate {
    
    
    // MARK: - Properties
    
    var validatorTextField: ValidatorTextField
    
    weak var delegate: protocol<ValidatorControlDelegate, UITextFieldDelegate>?
    
    private var didEndEditing   = false
    private var lastIsValid     = false
    
    
    // MARK: - Initializers
    
    init(validatorTextField: ValidatorTextField) {
        self.validatorTextField = validatorTextField
    }
    
    
    // MARK: - UITextFieldDelegate
    
    @objc func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        guard let sourceText = textField.text else {
            return false
        }
        
        let originalString = NSString(string: sourceText)
        
        let futureString = originalString.stringByReplacingCharactersInRange(range, withString: string)
        let conditions = validatorTextField.validator?.checkConditions(futureString)
        
        if let conditions = conditions {
            validatorTextField.validatorTextFieldViolatedConditions(conditions)
        } else {
            validatorTextField.validatorTextFieldSuccededConditions()
        }
        
        if !validatorTextField.validateOnFocusLossOnly && range.location != 0,
            let conditions = conditions
            where (!validatorTextField.shouldAllowViolation || conditions[0].shouldAllowViolation) {
                return false
        }
        
        if let result = delegate?.textField?(validatorTextField, shouldChangeCharactersInRange: range, replacementString: string) {
            return result
        }
        
        return true
    }
    
    func textFieldDidChange(notification: NSNotification) {
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
        
        let conditions = validatorTextField.validator?.checkConditions(validatorTextField.text)
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
    
    @objc func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if let result = delegate?.textFieldShouldBeginEditing?(validatorTextField) {
            return result
        }
        
        return true
    }
    
    @objc func textFieldDidBeginEditing(textField: UITextField) {
        delegate?.textFieldDidBeginEditing?(validatorTextField)
    }
    
    @objc func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        if let result = delegate?.textFieldShouldEndEditing?(validatorTextField) {
            return result
        }
        
        return true
    }
    
    @objc func textFieldDidEndEditing(textField: UITextField) {
        didEndEditing = true
        
        textFieldDidChange(NSNotification())
        
        delegate?.textFieldDidEndEditing?(validatorTextField)
    }
    
    @objc func textFieldShouldClear(textField: UITextField) -> Bool {
        if let result = delegate?.textFieldShouldClear?(validatorTextField) {
            return result
        }
        
        return true
    }
    
    @objc func textFieldShouldReturn(textField: UITextField) -> Bool {
        if let result = delegate?.textFieldShouldReturn?(validatorTextField) {
            return result
        }
        
        return true
    }
    
}
