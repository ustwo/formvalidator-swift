//
//  FormViewController.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 06/01/2017.
//  Copyright © 2017 ustwo Fampany Ltd. All rights reserved.
//

import AppKit


import FormValidatorSwift


final class FormViewController: NSViewController {
    
    
    // MARK: - Properties
    
    var form = ControlForm()
    
    fileprivate var underlyingView: FormView {
        if let myView = view as? FormView {
            return myView
        }
        
        let newView = FormView()
        view = newView
        return newView
    }
    
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        view = FormView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form.addEntry(underlyingView.titleEntry.textField)
        form.addEntry(underlyingView.nameEntry.textField)
        form.addEntry(underlyingView.emailEntry.textField)
        
        underlyingView.submitButton.action = #selector(FormViewController.submitButtonPressed(_:))
    }
    
    
    // MARK: - Control Actions
    
    @objc func submitButtonPressed(_ sender: NSButton) {
        let alertMessage: String
        if form.isValid {
            alertMessage = NSLocalizedString("Success: Your data has been submitted!", comment: "")
        } else {
            alertMessage = NSLocalizedString("Error: Please correct your entries in the form.", comment: "")
        }
        
        let alert = NSAlert()
        alert.alertStyle = .critical
        alert.messageText = alertMessage
        
        alert.beginSheetModal(for: NSApplication.shared.mainWindow!, completionHandler: nil)
    }
    
}
