//
//  FormEntryView.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 15/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import FormValidatorSwift
import UIKit


final class FormEntryView<V: Validator>: UIView, ValidatorControlDelegate, UITextFieldDelegate {
    
    
    // MARK: - Properties
    
    let textLabel           = UILabel()
    let textField           = ValidatorTextField(validator: V())
    
    let errorLabel          = UILabel()
    
    fileprivate let stackView   = UIStackView()
    
    
    // MARK: - Initializers
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        // Setup
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        addSubview(stackView)
        
        textLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        textLabel.textAlignment = .center
        stackView.addArrangedSubview(textLabel)
        
        textField.autocorrectionType = .no
        textField.borderStyle = .line
        textField.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        textField.setValidatorDelegate(self)
        stackView.addArrangedSubview(textField)
        
        errorLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        errorLabel.isHidden = true
        errorLabel.lineBreakMode = .byWordWrapping
        errorLabel.numberOfLines = 0
        stackView.addArrangedSubview(errorLabel)
        
        
        // Accessibility
        
        errorLabel.accessibilityIdentifier = FormAccessibility.Identifiers.ErrorLabel
        
        
        // Layout
        
        let stackViewMargin: CGFloat = 0.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: stackView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: stackViewMargin))
        addConstraint(NSLayoutConstraint(item: stackView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: stackViewMargin))
        addConstraint(NSLayoutConstraint(item: stackView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -stackViewMargin))
        addConstraint(NSLayoutConstraint(item: stackView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -stackViewMargin))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // MARK: - ValidatorControlDelegate
    
    func validatorControl(_ validatorControl: ValidatorControl, changedValidState validState: Bool) {
        guard let controlView = validatorControl as? UIView else {
            return
        }
        
        if validState {
            controlView.layer.borderColor = nil
            controlView.layer.borderWidth = 0.0
            errorLabel.isHidden = true
        } else {
            controlView.layer.borderColor = UIColor.red.cgColor
            controlView.layer.borderWidth = 2.0
        }
    }
    
    func validatorControl(_ validatorControl: ValidatorControl, violatedConditions conditions: [Condition]) {
        var errorText = ""
        for condition in conditions {
            errorText += condition.localizedViolationString
        }
        errorLabel.text = errorText
        
        errorLabel.isHidden = false
    }
    
    func validatorControlDidChange(_ validatorControl: ValidatorControl) {
        // Not used in this example yet
    }
    
}
