//
//  FormView.swift
//  iOS Example
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import UIKit

import FormValidatorSwift


final class FormView: UIView {
    
    
    // MARK: - Properties
    
    let nameEntry       = FormEntryView<AlphabeticValidator>()
    let emailEntry      = FormEntryView<EmailValidator>()
    
    let submitButton    = UIButton(type: .System)
    
    private let bottomBufferView    = UIView()
    private let stackView           = UIStackView()
    
    
    // MARK: - Initializers
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.whiteColor()
        
        
        // Setup
        
        stackView.axis = .Vertical
        stackView.distribution = .Fill
        stackView.alignment = .Fill
        addSubview(stackView)
        
        nameEntry.textLabel.text = NSLocalizedString("Surname", comment: "")
        stackView.addArrangedSubview(nameEntry)
        
        emailEntry.textLabel.text = NSLocalizedString("Email", comment: "")
        emailEntry.textField.shouldAllowViolation = true
        emailEntry.textField.validateOnFocusLossOnly = true
        stackView.addArrangedSubview(emailEntry)
        
        submitButton.titleLabel?.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        submitButton.setTitle(NSLocalizedString("Submit", comment: ""), forState: .Normal)
        stackView.addArrangedSubview(submitButton)
        
        bottomBufferView.setContentCompressionResistancePriority(UILayoutPriorityDefaultLow, forAxis: stackView.axis)
        bottomBufferView.setContentHuggingPriority(UILayoutPriorityDefaultLow, forAxis: stackView.axis)
        stackView.addArrangedSubview(bottomBufferView)
        
        
        // Accessibility
        
        nameEntry.textLabel.accessibilityIdentifier = FormAccessibility.Identifiers.NameLabel
        nameEntry.textField.accessibilityIdentifier = FormAccessibility.Identifiers.NameTextField
        
        emailEntry.textLabel.accessibilityIdentifier = FormAccessibility.Identifiers.EmailLabel
        emailEntry.textField.accessibilityIdentifier = FormAccessibility.Identifiers.EmailTextField
        
        submitButton.accessibilityIdentifier = FormAccessibility.Identifiers.SubmitButton
        
        
        // Layout
        
        let stackViewMargin: CGFloat = 20.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: stackView, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: stackViewMargin))
        addConstraint(NSLayoutConstraint(item: stackView, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1.0, constant: stackViewMargin))
        addConstraint(NSLayoutConstraint(item: stackView, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: -stackViewMargin))
        addConstraint(NSLayoutConstraint(item: stackView, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1.0, constant: -stackViewMargin))
        
        stackView.spacing = stackViewMargin
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
