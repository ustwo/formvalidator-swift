//
//  ViewController.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import FormValidatorSwift
import UIKit


final class FormViewController: UIViewController {
    
    
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
        
        underlyingView.submitButton.addTarget(self, action: #selector(FormViewController.submitButtonPressed(_:)), for: .touchUpInside)
    }
    
    
    // MARK: - Control Actions
    
    @objc func submitButtonPressed(_ sender: UIButton) {
        let alertTitle: String
        let alertMessage: String
        if form.isValid {
            alertTitle = NSLocalizedString("Success", comment: "")
            alertMessage = NSLocalizedString("Your data has been submitted!", comment: "")
        } else {
            alertTitle = NSLocalizedString("Error", comment: "")
            alertMessage = NSLocalizedString("Please correct your entries in the form.", comment: "")
        }
        
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alertController.popoverPresentationController?.sourceView = sender
        
        let doneAction = UIAlertAction(title: NSLocalizedString("Done", comment: ""), style: .default, handler: nil)
        alertController.addAction(doneAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
