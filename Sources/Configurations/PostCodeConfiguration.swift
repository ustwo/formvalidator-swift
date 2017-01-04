//
//  PostCodeConfiguration.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 04/01/2017.
//  Copyright © 2017 ustwo. All rights reserved.
//

import Foundation


/// Stores configuration for `PostcodeCondition`.
public struct PostcodeConfiguration: Configuration {
    
    
    // MARK: - Properties
    
    public var country: PostcodeCountries
    
    
    // MARK: - Initializers
    
    public init() {
        self.init(country: .UnitedKingdom)
    }
    
    public init(country: PostcodeCountries = .UnitedKingdom) {
        self.country = country
    }
    
}
