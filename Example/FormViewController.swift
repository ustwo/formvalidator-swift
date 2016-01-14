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
    
}
