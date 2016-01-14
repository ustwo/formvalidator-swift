//
//  ValidatorTextView.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import UIKit


public class ValidatorTextView: UITextView, ValidatorControl {
    
    
    // MARK: - Properties
    
    public var shouldAllowViolation = true
    public var validateOnFocusLossOnly = false
    public let validator: Validator
    public weak var validatorDelegate: ValidatorControlDelegate?
    
    public var validatableText: String? {
        return text
    }
    
    private var validatorControlResponder: ValidatorTextViewResponder?
    
    
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
        
        NSNotificationCenter.defaultCenter().removeObserver(responder, name: UITextViewTextDidEndEditingNotification, object: self)
    }
    
    
    // MARK: - Setup
    
    private func setup() {
        let responder = ValidatorTextViewResponder(validatorTextView: self)
        validatorControlResponder = responder
        super.delegate = responder
        
        NSNotificationCenter.defaultCenter().addObserver(responder, selector: Selector("textViewDidEndEditing:"), name: UITextViewTextDidEndEditingNotification, object: self)
    }
    
    
    // MARK: - Callbacks on state change
    
    public func validatorTextViewSuccededConditions() { }
    
    public func validatorTextViewViolatedConditions(conditions: [Condition]) { }
    
}


internal class ValidatorTextViewResponder: NSObject, UITextViewDelegate {
    
    
    // MARK: - Properties
    
    var validatorTextView: ValidatorTextView
    
    weak var delegate: protocol<ValidatorControlDelegate, UITextViewDelegate>?
    
    private var didEndEditing   = false
    private var lastIsValid     = false
    
    
    // MARK: - Initializers
    
    init(validatorTextView: ValidatorTextView) {
        self.validatorTextView = validatorTextView
    }
    
    
    // MARK: - UITextViewDelegate
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        let sourceText = textView.text
        
        let originalString = NSString(string: sourceText)
        
        let futureString = originalString.stringByReplacingCharactersInRange(range, withString: text)
        let conditions = validatorTextView.validator.checkConditions(futureString)
        
        if let conditions = conditions {
            validatorTextView.validatorTextViewViolatedConditions(conditions)
        } else {
            validatorTextView.validatorTextViewSuccededConditions()
        }
        
        if !validatorTextView.validateOnFocusLossOnly && range.location != 0,
            let conditions = conditions
            where (!validatorTextView.shouldAllowViolation || conditions[0].shouldAllowViolation) {
                return false
        }
        
        if let result = delegate?.textView?(validatorTextView, shouldChangeTextInRange: range, replacementText: text) {
            return result
        }
        
        return true
    }
    
    func textViewDidChange(textView: UITextView) {
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
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        if let result = delegate?.textViewShouldBeginEditing?(validatorTextView) {
            return result
        }
        
        return true
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        delegate?.textViewDidBeginEditing?(validatorTextView)
    }
    
    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        if let result = delegate?.textViewShouldEndEditing?(validatorTextView) {
            return result
        }
        
        return true
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        didEndEditing = true
        
        textViewDidChange(textView)
        
        delegate?.textViewDidEndEditing?(validatorTextView)
    }
    
    func textViewDidChangeSelection(textView: UITextView) {
        delegate?.textViewDidChangeSelection?(validatorTextView)
    }
    
}
