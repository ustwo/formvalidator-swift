//
//  FormEntryView.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 06/01/2017.
//  Copyright © 2017 ustwo Fampany Ltd. All rights reserved.
//

import AppKit

import FormValidatorSwift


final class FormEntryView<V: Validator>: NSView, ValidatorControlDelegate, NSTextFieldDelegate {
    
    
    // MARK: - Properties
    
    let textLabel           = NSTextField()
    let textField           = ValidatorTextField(validator: V())
    
    let errorLabel          = NSTextField()
    
    fileprivate let stackView   = NSStackView()
    
    
    // MARK: - Initializers
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        // Setup
        
        stackView.orientation = .vertical
        stackView.distribution = .fill
        stackView.distribution = .fill
        addSubview(stackView)
        
        textLabel.font = NSFont.labelFont(ofSize: 12.0)
        textLabel.alignment = .center
        textLabel.isEditable = false
        textLabel.isBezeled = false
        textLabel.drawsBackground = false
        textLabel.isSelectable = false
        stackView.addArrangedSubview(textLabel)
        
        textField.font = NSFont.messageFont(ofSize: 12.0)
        textField.setValidatorDelegate(self)
        stackView.addArrangedSubview(textField)
        
        errorLabel.font = NSFont.boldSystemFont(ofSize: 14.0)
        errorLabel.isHidden = true
        errorLabel.lineBreakMode = .byWordWrapping
        errorLabel.isEditable = false
        errorLabel.isBezeled = false
        errorLabel.drawsBackground = false
        errorLabel.isSelectable = false
        errorLabel.maximumNumberOfLines = 2
        stackView.addArrangedSubview(errorLabel)
        
        
        // Accessibility
        
        errorLabel.setAccessibilityIdentifier(FormAccessibility.Identifiers.ErrorLabel)
        
        
        // Layout
        
        let stackViewMargin: CGFloat = 0.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: stackViewMargin),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -stackViewMargin),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: stackViewMargin),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -stackViewMargin)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // MARK: - ValidatorControlDelegate
    
    func validatorControl(_ validatorControl: ValidatorControl, changedValidState validState: Bool) {
        guard let controlView = validatorControl as? NSView else {
            return
        }
        
        if validState {
            controlView.layer?.borderColor = nil
            controlView.layer?.borderWidth = 0.0
            errorLabel.isHidden = true
        } else {
            controlView.layer?.borderColor = NSColor.red.cgColor
            controlView.layer?.borderWidth = 2.0
        }
    }
    
    func validatorControl(_ validatorControl: ValidatorControl, violatedConditions conditions: [Condition]) {
        var errorText = ""
        for condition in conditions {
            errorText += condition.localizedViolationString
        }
        errorLabel.stringValue = errorText
        
        errorLabel.isHidden = false
    }
    
    func validatorControlDidChange(_ validatorControl: ValidatorControl) {
        // Not used in this example yet
    }
    
}
