//
//  FormView.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 06/01/2017.
//  Copyright © 2017 ustwo Fampany Ltd. All rights reserved.
//

import AppKit

import FormValidatorSwift


final class FormView: NSView {
    
    
    // MARK: - Types
    
    private struct Constants {
        
        static let minimumTextFieldWidth: CGFloat   = 300.0
        
    }
    
    
    // MARK: - Properties
    
    let titleEntry      = FormEntryView<AlphabeticValidator>()
    let nameEntry       = FormEntryView<AlphabeticValidator>()
    let emailEntry      = FormEntryView<EmailValidator>()
    
    let submitButton    = NSButton()
    
    fileprivate let bottomBufferView    = NSView()
    fileprivate let stackView           = NSStackView()
    
    
    // MARK: - Initializers
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        wantsLayer = true
        layer?.backgroundColor = NSColor.white.cgColor
        
        
        // Setup
        
        stackView.orientation = .vertical
        stackView.distribution = .fill
        addSubview(stackView)
        
        titleEntry.textLabel.stringValue = NSLocalizedString("Title", comment: "")
        titleEntry.textField.shouldAllowViolation = true
        stackView.addArrangedSubview(titleEntry)
        
        nameEntry.textLabel.stringValue = NSLocalizedString("Surname", comment: "")
        stackView.addArrangedSubview(nameEntry)
        
        emailEntry.textLabel.stringValue = NSLocalizedString("Email", comment: "")
        emailEntry.textField.shouldAllowViolation = true
        emailEntry.textField.validateOnFocusLossOnly = true
        stackView.addArrangedSubview(emailEntry)
        
        submitButton.title = NSLocalizedString("Submit", comment: "")
        stackView.addArrangedSubview(submitButton)
        
        stackView.addArrangedSubview(bottomBufferView)
        
        
        // Accessibility
        
        titleEntry.textLabel.setAccessibilityIdentifier(FormAccessibility.Identifiers.TitleLabel)
        titleEntry.textField.setAccessibilityIdentifier(FormAccessibility.Identifiers.TitleTextField)
        
        nameEntry.textLabel.setAccessibilityIdentifier(FormAccessibility.Identifiers.NameLabel)
        nameEntry.textField.setAccessibilityIdentifier(FormAccessibility.Identifiers.NameTextField)
        
        emailEntry.textLabel.setAccessibilityIdentifier(FormAccessibility.Identifiers.EmailLabel)
        emailEntry.textField.setAccessibilityIdentifier(FormAccessibility.Identifiers.EmailTextField)
        
        submitButton.setAccessibilityIdentifier(FormAccessibility.Identifiers.SubmitButton)
        
        
        // Layout
        
        let stackViewMargin: CGFloat = 20.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleEntry.widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.minimumTextFieldWidth),
            nameEntry.widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.minimumTextFieldWidth),
            emailEntry.widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.minimumTextFieldWidth),
            
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: stackViewMargin),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -stackViewMargin),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: stackViewMargin),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -stackViewMargin)
        ])
        
        stackView.spacing = stackViewMargin
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
