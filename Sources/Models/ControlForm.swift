//
//  TextFieldsForm.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  Convenience implementation of `Form` that is a form full of any type of `ValidatorControl`.
 */
public struct ControlForm: Form {
    
    public var entries: [FormEntry]

    public init() {
        entries = [FormEntry]()
    }
    
}
