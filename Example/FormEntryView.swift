//
//  FormEntryView.swift
//  iOS Example
//
//  Created by Aaron McTavish on 15/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import UIKit

import FormValidatorSwift


final class FormEntryView<V: Validator>: UIView, ValidatorControlDelegate, UITextFieldDelegate {
    
    
    // MARK: - Properties
    
    let textLabel           = UILabel()
    let textField           = ValidatorTextField(validator: V())
    
    let errorLabel          = UILabel()
    
    private let stackView   = UIStackView()
    
    
    // MARK: - Initializers
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        // Setup
        
        stackView.axis = .Vertical
        stackView.distribution = .Fill
        stackView.alignment = .Fill
        addSubview(stackView)
        
        textLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        textLabel.textAlignment = .Center
        stackView.addArrangedSubview(textLabel)
        
        textField.borderStyle = .Line
        textField.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        textField.setValidatorDelegate(self)
        stackView.addArrangedSubview(textField)
        
        errorLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        errorLabel.hidden = true
        errorLabel.lineBreakMode = .ByWordWrapping
        errorLabel.numberOfLines = 0
        stackView.addArrangedSubview(errorLabel)
        
        
        // Accessibility
        
        errorLabel.accessibilityIdentifier = FormAccessibility.Identifiers.ErrorLabel
        
        
        // Layout
        
        let stackViewMargin: CGFloat = 0.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: stackView, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: stackViewMargin))
        addConstraint(NSLayoutConstraint(item: stackView, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1.0, constant: stackViewMargin))
        addConstraint(NSLayoutConstraint(item: stackView, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: -stackViewMargin))
        addConstraint(NSLayoutConstraint(item: stackView, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1.0, constant: -stackViewMargin))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // MARK: - ValidatorControlDelegate
    
    func validatorControl(validatorControl: ValidatorControl, changedValidState validState: Bool) {
        guard let controlView = validatorControl as? UIView else {
            return
        }
        
        if validState {
            controlView.layer.borderColor = nil
            controlView.layer.borderWidth = 0.0
            errorLabel.hidden = true
        } else {
            controlView.layer.borderColor = UIColor.redColor().CGColor
            controlView.layer.borderWidth = 2.0
        }
    }
    
    func validatorControl(validatorControl: ValidatorControl, violatedConditions conditions: [Condition]) {
        var errorText = ""
        for condition in conditions {
            errorText += condition.localizedViolationString
        }
        errorLabel.text = errorText
        
        errorLabel.hidden = false
    }
    
    func validatorControlDidChange(validatorControl: ValidatorControl) {
        // Not used in this example yet
    }
    
}
