//
//  ValidatorTextField.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import UIKit
#elseif os(macOS)
    import AppKit
#endif


open class ValidatorTextField: TextField, ValidatorControl {
    
    
    // MARK: - Properties
    
    open var shouldAllowViolation = true
    open var validateOnFocusLossOnly = false
    open let validator: Validator
    /// Validator delegate for the text field.
    ///
    /// - SeeAlso: `setValidatorDelegate(_:)` to set the validator delegate.
    open weak var validatorDelegate: ValidatorControlDelegate? {
        return validatorControlResponder?.delegate
    }
    
    open var validatableText: String? {
        #if os(iOS) || os(tvOS)
            return text
        #elseif os(macOS)
            return stringValue
        #endif
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
        
        #if os(iOS) || os(tvOS)
            NotificationCenter.default.removeObserver(responder,
                                                      name: NSNotification.Name.UITextFieldTextDidChange,
                                                      object: self)
            NotificationCenter.default.removeObserver(responder,
                                                      name: NSNotification.Name.UITextFieldTextDidEndEditing,
                                                      object: self)
        #elseif os(macOS)
            NotificationCenter.default.removeObserver(responder,
                                                      name: NSNotification.Name.NSControlTextDidChange,
                                                      object: self)
            NotificationCenter.default.removeObserver(responder,
                                                      name: NSNotification.Name.NSControlTextDidEndEditing,
                                                      object: self)
        #endif
    }
    
    
    // MARK: - Setup
    
    fileprivate func setup() {
        let responder = ValidatorTextFieldResponder(validatorTextField: self)
        validatorControlResponder = responder
        super.delegate = responder
        
        #if os(iOS) || os(tvOS)
            NotificationCenter.default.addObserver(responder,
                                                   selector: #selector(ValidatorTextFieldResponder.textFieldDidChange(_:)),
                                                   name: NSNotification.Name.UITextFieldTextDidChange,
                                                   object: self)
            NotificationCenter.default.addObserver(responder,
                                                   selector: #selector(ValidatorTextFieldResponder.textFieldDidEndEditing(_:)),
                                                   name: NSNotification.Name.UITextFieldTextDidEndEditing,
                                                   object: self)
        #elseif os(macOS)
            NotificationCenter.default.addObserver(responder,
                                                   selector: #selector(ValidatorTextFieldResponder.textFieldDidChange(_:)),
                                                   name: NSNotification.Name.NSControlTextDidChange,
                                                   object: self)
            NotificationCenter.default.addObserver(responder,
                                                   selector: #selector(ValidatorTextFieldResponder.textFieldDidEndEditing(_:)),
                                                   name: NSNotification.Name.NSControlTextDidEndEditing,
                                                   object: self)
        #endif
    }
    
    
    // MARK: - Custom Setters
    
    /// Sets the `validatorDelegate` for the text field. This allows custom responses to both `UITextFieldDelegate` callbacks as well as those from `ValidatorControlDelegate`.
    ///
    /// - Parameter newDelegate: The delegate for `ValidatorTextField` callbacks.
    open func setValidatorDelegate(_ newDelegate: ValidatorControlDelegate & TextFieldDelegate) {
        validatorControlResponder?.delegate = newDelegate
    }
    
    
    // MARK: - Callbacks on state change
    
    open func validatorTextFieldSuccededConditions() { }
    
    open func validatorTextFieldViolatedConditions(_ conditions: [Condition]) { }
    
}


internal class ValidatorTextFieldResponder: NSObject, TextFieldDelegate {
    
    
    // MARK: - Properties
    
    var validatorTextField: ValidatorTextField
    
    weak var delegate: (ValidatorControlDelegate & TextFieldDelegate)?
    
    fileprivate var didEndEditing       = false
    fileprivate var lastIsValid: Bool?  = nil
    
    
    // MARK: - Initializers
    
    init(validatorTextField: ValidatorTextField) {
        self.validatorTextField = validatorTextField
        
        #if os(macOS)
            let formatter = ValidityFormatter()
            formatter.validatorTextField = validatorTextField
        
            validatorTextField.formatter = formatter
        #endif
    }
    
    
    // MARK: - Notifications
    
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
        
        #if os(iOS) || os(tvOS)
            let inputText = validatorTextField.text
        #elseif os(macOS)
            let inputText = validatorTextField.stringValue
        #endif
        
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
    
    #if os(iOS) || os(tvOS)
    
    // MARK: - UITextFieldDelegate
    
    @objc func textField(_ textField: TextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
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
            (!validatorTextField.shouldAllowViolation || conditions[0].shouldAllowViolation) {
    
            return false
        }
    
        if let result = delegate?.textField?(validatorTextField, shouldChangeCharactersIn: range, replacementString: string) {
            return result
        }
    
        return true
    }
    
    @objc func textFieldShouldBeginEditing(_ textField: TextField) -> Bool {
        return delegate?.textFieldShouldBeginEditing?(validatorTextField) ?? true
    }
    
    @objc func textFieldDidBeginEditing(_ textField: TextField) {
        delegate?.textFieldDidBeginEditing?(validatorTextField)
    }
    
    @objc func textFieldShouldEndEditing(_ textField: TextField) -> Bool {
        return delegate?.textFieldShouldEndEditing?(validatorTextField) ?? true
    }
    
    @objc func textFieldDidEndEditing(_ textField: TextField) {
        didEndEditing = true
        
        textFieldDidChange(nil)
        
        delegate?.textFieldDidEndEditing?(validatorTextField)
    }
    
    @objc func textFieldShouldClear(_ textField: TextField) -> Bool {
        return delegate?.textFieldShouldClear?(validatorTextField) ?? true
    }
    
    @objc func textFieldShouldReturn(_ textField: TextField) -> Bool {
        return delegate?.textFieldShouldReturn?(validatorTextField) ?? true
    }
    
    #elseif os(macOS)
    
    // MARK: - NSTextFieldDelegate
    
    @objc func control(_ control: NSControl, textShouldBeginEditing fieldEditor: NSText) -> Bool {
        return delegate?.control?(control, textShouldBeginEditing: fieldEditor) ?? true
    }
    
    @objc func control(_ control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool {
        return delegate?.control?(control, textShouldEndEditing: fieldEditor) ?? true
    }
    
    @objc func textFieldDidEndEditing(_ notification: Notification?) {
        didEndEditing = true
        
        textFieldDidChange(nil)
    }
    
    #endif
    
}


#if os(macOS)

final class ValidityFormatter: Formatter {
    
    
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
            (!validatorTextField.shouldAllowViolation || conditions[0].shouldAllowViolation) {
            
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

#endif
