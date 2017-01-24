//
//  Validatable.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


public protocol Validatable {
    
    var validatableText: String? { get }
    var validator: Validator { get }
    
}
