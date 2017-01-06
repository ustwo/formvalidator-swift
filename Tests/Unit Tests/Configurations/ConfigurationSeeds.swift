//
//  ConfigurationSeeds.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 03/01/2017.
//  Copyright © 2017 ustwo. All rights reserved.
//

import Foundation

@testable import FormValidatorSwift


/// Seed data for the various configurations. These are preconfigured configurations to use during testing.
struct ConfigurationSeeds {
    
    struct AlphabeticSeeds {
        
        static let noUnicode_NoWhitespace   = AlphabeticConfiguration(allowsUnicode: false, allowsWhitespace: false)
        static let noUnicode_Whitespace     = AlphabeticConfiguration(allowsUnicode: false, allowsWhitespace: true)
        static let unicode_NoWhitespace     = AlphabeticConfiguration(allowsUnicode: true, allowsWhitespace: false)
        static let unicode_Whitespace       = AlphabeticConfiguration(allowsUnicode: true, allowsWhitespace: true)
        
    }
    
    struct AlphanumericSeeds {
        
        static let noUnicode_NoWhitespace   = AlphanumericConfiguration(allowsUnicode: false, allowsWhitespace: false)
        static let noUnicode_Whitespace     = AlphanumericConfiguration(allowsUnicode: false, allowsWhitespace: true)
        static let unicode_NoWhitespace     = AlphanumericConfiguration(allowsUnicode: true, allowsWhitespace: false)
        static let unicode_Whitespace       = AlphanumericConfiguration(allowsUnicode: true, allowsWhitespace: true)
        
    }
    
    struct NumericSeeds {
        
        static let noUnicode_NoWhitespace   = NumericConfiguration(allowsUnicode: false, allowsWhitespace: false)
        static let noUnicode_Whitespace     = NumericConfiguration(allowsUnicode: false, allowsWhitespace: true)
        static let unicode_NoWhitespace     = NumericConfiguration(allowsUnicode: true, allowsWhitespace: false)
        static let unicode_Whitespace       = NumericConfiguration(allowsUnicode: true, allowsWhitespace: true)
        
    }
    
    struct PasswordStrengthSeeds {
        
        static let veryStrong   = PasswordStrengthConfiguration(requiredStrength: .veryStrong)
        static let veryWeak     = PasswordStrengthConfiguration(requiredStrength: .veryWeak)
        
    }
    
    struct RangeSeeds {
        
        static let threeToThirteen  = RangeConfiguration(range: 3..<13)
        static let zeroToFour       = RangeConfiguration(range: 0..<4)
        
    }
    
}
