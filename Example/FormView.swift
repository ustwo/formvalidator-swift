//
//  FormView.swift
//  iOS Example
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import UIKit

import FormValidatorSwift


final class FormView: UIView, ValidatorControlDelegate {
    
    
    // MARK: - Properties
    
    let nameLabel       = UILabel()
    let nameTextField   = ValidatorTextField()
    
    let errorLabel      = UILabel()
    
    private let bottomBufferView    = UIView()
    private let stackView           = UIStackView()
    
    
    // MARK: - Initializers
    
    convenience init() {
        self.init(frame: CGRectZero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.whiteColor()
        
        
        // Setup
        
        stackView.axis = .Vertical
        stackView.distribution = .Fill
        stackView.alignment = .Fill
        addSubview(stackView)
        
        nameLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        nameLabel.text = NSLocalizedString("Surname", comment: "")
        nameLabel.textAlignment = .Center
        stackView.addArrangedSubview(nameLabel)
        
        nameTextField.borderStyle = .Line
        nameTextField.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        nameTextField.shouldAllowViolation = true
        nameTextField.validateOnFocusLossOnly = true
        nameTextField.validator = AlphabeticValidator(allowsWhitespace: false)
        stackView.addArrangedSubview(nameTextField)
        
        errorLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        errorLabel.hidden = true
        stackView.addArrangedSubview(errorLabel)
        
        bottomBufferView.setContentCompressionResistancePriority(UILayoutPriorityDefaultLow, forAxis: stackView.axis)
        bottomBufferView.setContentHuggingPriority(UILayoutPriorityDefaultLow, forAxis: stackView.axis)
        stackView.addArrangedSubview(bottomBufferView)
        
        
        // Layout
        
        let stackViewMargin: CGFloat = 20.0
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
