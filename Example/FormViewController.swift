//
//  ViewController.swift
//  iOS Example
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import UIKit


import FormValidatorSwift


final class FormViewController: UIViewController {
    
    
    // MARK: - Properties
    
    var form = ControlForm()
    
    private var underlyingView: FormView {
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
        
        form.addControl(underlyingView.nameEntry.textField)
        form.addControl(underlyingView.emailEntry.textField)
        
        underlyingView.submitButton.addTarget(self, action: Selector("submitButtonPressed:"), forControlEvents: .TouchUpInside)
    }
    
    
    // MARK: - Control Actions
    
    func submitButtonPressed(sender: UIButton) {
        let alertTitle: String
        let alertMessage: String
        if form.isValid {
            alertTitle = NSLocalizedString("Success", comment: "")
            alertMessage = NSLocalizedString("Your data has been submitted!", comment: "")
        } else {
            alertTitle = NSLocalizedString("Error", comment: "")
            alertMessage = NSLocalizedString("Please correct your entries in the form.", comment: "")
        }
        
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .Alert)
        alertController.popoverPresentationController?.sourceView = sender
        
        let doneAction = UIAlertAction(title: NSLocalizedString("Done", comment: ""), style: .Default, handler: nil)
        alertController.addAction(doneAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
}
