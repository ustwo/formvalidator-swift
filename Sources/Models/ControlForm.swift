//
//  ControlForm.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


public struct ControlForm: Form {
    
    
    // MARK: - Properties
    
    public private(set) var controls: [ValidatorControl]
    
    public var entries: [FormEntry]
    
    
    // MARK: - Initializers

    public init() {
        self.entries = [FormEntry]()
        self.controls = [ValidatorControl]()
    }
    
    public init(controls: [ValidatorControl]) {
        self.init(validatables: controls.map { $0 as Validatable })
    }
    
    
    // MARK: - Manipulate Controls
    
    public mutating func addControl(control: ValidatorControl) {
        controls.append(control)
        entries.append(FormEntry(validatable: control, validator: control.validator))
    }
    
    public mutating func removeControlAtIndex(index: Int) -> ValidatorControl? {
        entries.removeAtIndex(index)
        return controls.removeAtIndex(index)
    }
    
}
