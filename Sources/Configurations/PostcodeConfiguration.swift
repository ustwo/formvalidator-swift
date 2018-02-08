//
//  PostcodeConfiguration.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 04/01/2017.
//  Copyright © 2017 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/// Countries that are supported by `PostcodeCondition`. Each postcode is an ISO 3166-1 alpha-3 country code. There is a `regex` property that returns the regex for validating that country's postcode.
public enum PostcodeCountries: String {

    case sweden         = "SWE"
    case turkey         = "TUR"
    case unitedKingdom  = "GBR"
    case unitedStates   = "USA"
    
    /// The regex for validating the country's postcode.
    public var regex: String {
        switch self {
        case .sweden:
            return "^(SE-)?[0-9]{3}\\s?[0-9]{2}$"
        case .turkey:
            return "^[0-9]{5}$"
        case .unitedKingdom:
            return "^([A-PR-UWYZa-pr-uwyz]([0-9]{1,2}|([A-HK-Ya-hk-y][0-9]|[A-HK-Ya-hk-y][0-9]([0-9]|[ABEHMNPRV-Yabehmnprv-y]))|[0-9][A-HJKS-UWa-hjks-uw])\\ {0,1}[0-9][ABD-HJLNP-UW-Zabd-hjlnp-uw-z]{2}|([Gg][Ii][Rr]\\ 0[Aa][Aa])|([Ss][Aa][Nn]\\ {0,1}[Tt][Aa]1)|([Bb][Ff][Pp][Oo]\\ {0,1}([Cc]\\/[Oo]\\ )?[0-9]{1,4})|(([Aa][Ss][Cc][Nn]|[Bb][Bb][Nn][Dd]|[BFSbfs][Ii][Qq][Qq]|[Pp][Cc][Rr][Nn]|[Ss][Tt][Hh][Ll]|[Tt][Dd][Cc][Uu]|[Tt][Kk][Cc][Aa])\\ {0,1}1[Zz][Zz]))$"
        case .unitedStates:
            return "^[0-9]{5}(?:[-|\\s][0-9]{4})?$"
        }
    }
    
    public static let allValues: [PostcodeCountries] = [.sweden, .turkey, .unitedKingdom, .unitedStates]
}


/// Stores configuration for `PostcodeCondition`.
public struct PostcodeConfiguration: Configuration {
    
    
    // MARK: - Properties
    
    public var country: PostcodeCountries
    
    
    // MARK: - Initializers
    
    public init() {
        self.init(country: .unitedKingdom)
    }
    
    public init(country: PostcodeCountries = .unitedKingdom) {
        self.country = country
    }
    
}
