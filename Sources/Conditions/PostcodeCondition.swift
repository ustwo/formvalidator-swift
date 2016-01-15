//
//  PostcodeCondition.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


/**
 *  The `PostcodeCondition` checks a string for a post code.
 */
public struct PostcodeCondition: Condition {
    
    
    // Types
    
    /// Countries that are supported by `PostcodeCondtion`. Each postcode is an ISO 3166-1 alpha-3 country code. There is a `regex` property that returns the regex for validating that country's postcode.
    public enum PostcodeCountries: String {
        case UnitedKingdom  = "GBR"
        case UnitedStates   = "USA"
        
        /// The regex for validating the country's postcode.
        var regex: String {
            switch self {
            case .UnitedKingdom:
                return "^([A-PR-UWYZa-pr-uwyz]([0-9]{1,2}|([A-HK-Ya-hk-y][0-9]|[A-HK-Ya-hk-y][0-9]([0-9]|[ABEHMNPRV-Yabehmnprv-y]))|[0-9][A-HJKS-UWa-hjks-uw])\\ {0,1}[0-9][ABD-HJLNP-UW-Zabd-hjlnp-uw-z]{2}|([Gg][Ii][Rr]\\ 0[Aa][Aa])|([Ss][Aa][Nn]\\ {0,1}[Tt][Aa]1)|([Bb][Ff][Pp][Oo]\\ {0,1}([Cc]\\/[Oo]\\ )?[0-9]{1,4})|(([Aa][Ss][Cc][Nn]|[Bb][Bb][Nn][Dd]|[BFSbfs][Ii][Qq][Qq]|[Pp][Cc][Rr][Nn]|[Ss][Tt][Hh][Ll]|[Tt][Dd][Cc][Uu]|[Tt][Kk][Cc][Aa])\\ {0,1}1[Zz][Zz]))$"
            case .UnitedStates:
                return "^[0-9]{5}(?:[-|\\s][0-9]{4})?$"
            }
        }
    }
    
    
    // MARK: - Properties
    
    public var localizedViolationString = StringLocalization.localizedString("US2KeyConditionViolationPostcodeUK", comment: "")
    
    public private(set) var regex = ""
    
    public var shouldAllowViolation = true
    
    /// Country to use for postcode validation.
    public var country: PostcodeCountries {
        didSet {
            regex = country.regex
        }
    }
    
    
    // MARK: - Initializer
    
    /**
    Initializes a `PostcodeCondition`.
    - parameter country: Country to use for postcode validation.
    */
    init(country: PostcodeCountries) {
        self.country = country
        regex = country.regex
    }
    
}
