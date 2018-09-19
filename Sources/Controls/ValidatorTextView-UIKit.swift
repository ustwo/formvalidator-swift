//
//  ValidatorTextView-UIKit.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import UIKit


open class ValidatorTextView: UITextView, ValidatorControl {
    
    
    // MARK: - Properties
    
    open var shouldAllowViolation = false
    open var validateOnFocusLossOnly = false
    public let validator: Validator
    /// Validator delegate for the text view.
    ///
    /// - SeeAlso: setValidatorDelegate(_:) to set the validator delegate.
    open weak var validatorDelegate: ValidatorControlDelegate? {
        return validatorControlResponder?.delegate
    }
    
    open var validatableText: String? {
        return text
    }
    
    fileprivate var validatorControlResponder: ValidatorTextViewResponder?
    
    
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
        
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented.")
    }
    
    deinit {
        guard let responder = validatorControlResponder else {
            return
        }
        
        NotificationCenter.default.removeObserver(responder, name: UITextView.textDidEndEditingNotification, object: self)
    }
    
    
    // MARK: - Setup
    
    fileprivate func setup() {
        let responder = ValidatorTextViewResponder(validatorTextView: self)
        validatorControlResponder = responder
        super.delegate = responder
        
        NotificationCenter.default.addObserver(responder, selector: #selector(UITextViewDelegate.textViewDidEndEditing(_:)), name: UITextView.textDidEndEditingNotification, object: self)
    }
    
    
    // MARK: - Custom Setters
    
    /// Sets the `validatorDelegate` for the text view. This allows custom responses to both `UITextViewDelegate` callbacks as well as those from `ValidatorControlDelegate`.
    ///
    /// - Parameter newDelegate: The delegate for `ValidatorTextView` callbacks.
    open func setValidatorDelegate(_ newDelegate: ValidatorControlDelegate & UITextViewDelegate) {
        validatorControlResponder?.delegate = newDelegate
    }
    
    
    // MARK: - Callbacks on state change
    
    open func validatorTextViewSuccededConditions() { }
    
    open func validatorTextViewViolatedConditions(_ conditions: [Condition]) { }
    
}


internal class ValidatorTextViewResponder: NSObject, UITextViewDelegate {
    
    
    // MARK: - Properties
    
    var validatorTextView: ValidatorTextView
    
    weak var delegate: (ValidatorControlDelegate & UITextViewDelegate)?
    
    fileprivate var didEndEditing       = false
    fileprivate var lastIsValid: Bool?
    
    
    // MARK: - Initializers
    
    init(validatorTextView: ValidatorTextView) {
        self.validatorTextView = validatorTextView
    }
    
    
    // MARK: - UITextViewDelegate
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let sourceText = textView.text
        
        let originalString = NSString(string: sourceText!)
        
        let futureString = originalString.replacingCharacters(in: range, with: text)
        let conditions = validatorTextView.validator.checkConditions(futureString)
        
        if let conditions = conditions {
            validatorTextView.validatorTextViewViolatedConditions(conditions)
        } else {
            validatorTextView.validatorTextViewSuccededConditions()
        }
        
        if !validatorTextView.validateOnFocusLossOnly && range.location != 0,
            let conditions = conditions,
            (!validatorTextView.shouldAllowViolation || !(conditions.isEmpty || conditions[0].shouldAllowViolation)) {
                return false
        }
        
        if let result = delegate?.textView?(validatorTextView, shouldChangeTextIn: range, replacementText: text) {
            return result
        }
        
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        defer {
            // Inform delegate about changes
            delegate?.validatorControlDidChange(validatorTextView)
        }
        
        // Only validate if violations are allowed
        //  Validate according to `validateOnFocusLossOnly` while editing first time or after focus loss
        guard validatorTextView.shouldAllowViolation &&
            (!validatorTextView.validateOnFocusLossOnly || (validatorTextView.validateOnFocusLossOnly && didEndEditing)) else {
                return
        }
        
        let conditions = validatorTextView.validator.checkConditions(validatorTextView.text)
        let isValid = conditions == nil
        if lastIsValid != isValid {
            lastIsValid = isValid
            
            // Inform the text view about valid state change
            if isValid {
                validatorTextView.validatorTextViewSuccededConditions()
            } else {
                validatorTextView.validatorTextViewViolatedConditions(conditions!)
            }
            
            // Inform delegate about valid state change
            delegate?.validatorControl(validatorTextView, changedValidState: isValid)
            
            if !isValid {
                // Inform delegatate about violation
                delegate?.validatorControl(validatorTextView, violatedConditions: conditions!)
            }
        }
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if let result = delegate?.textViewShouldBeginEditing?(validatorTextView) {
            return result
        }
        
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        delegate?.textViewDidBeginEditing?(validatorTextView)
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        if let result = delegate?.textViewShouldEndEditing?(validatorTextView) {
            return result
        }
        
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        didEndEditing = true
        
        textViewDidChange(textView)
        
        delegate?.textViewDidEndEditing?(validatorTextView)
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        delegate?.textViewDidChangeSelection?(validatorTextView)
    }
    
}
