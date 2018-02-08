//
//  CreditCardConfiguration.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 04/01/2017.
//  Copyright © 2017 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/// Credit card types that are supported by `CreditCardCondition`. There is a `regex` property that returns the regex for validating that credit card number.
public struct CreditCardType: OptionSet, CustomStringConvertible {
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let americanExpress    = CreditCardType(rawValue: 1 << 0)
    public static let dinersClub         = CreditCardType(rawValue: 1 << 1)
    public static let discover           = CreditCardType(rawValue: 1 << 2)
    public static let jcb                = CreditCardType(rawValue: 1 << 3)
    public static let maestro            = CreditCardType(rawValue: 1 << 4)
    public static let mastercard         = CreditCardType(rawValue: 1 << 5)
    public static let visa               = CreditCardType(rawValue: 1 << 6)
    
    public static let all: CreditCardType = [.americanExpress, .dinersClub, .discover, .jcb, .maestro, .mastercard, .visa]
    public static let allArray: [CreditCardType] = [.americanExpress, .dinersClub, .discover, .jcb, .maestro, .mastercard, .visa]
    
    /**
     Literal description for set of credit cards, separated with commas and single space.
     */
    public var description: String {
        var result = ""
        
        add(description: "American Express", forCardType: CreditCardType.americanExpress, toResultString: &result)
        add(description: "Diners Club", forCardType: CreditCardType.dinersClub, toResultString: &result)
        add(description: "Discover", forCardType: CreditCardType.discover, toResultString: &result)
        add(description: "JCB", forCardType: CreditCardType.jcb, toResultString: &result)
        add(description: "Maestro", forCardType: CreditCardType.maestro, toResultString: &result)
        add(description: "Master Card", forCardType: CreditCardType.mastercard, toResultString: &result)
        add(description: "VISA", forCardType: CreditCardType.visa, toResultString: &result)
        
        return result
    }
    
    /**
     Combined regular expression string for set of credit cards.
     */
    public var regex: String {
        var result = ""
        
        insertCard(regexString: &result, cardType: .americanExpress)
        insertCard(regexString: &result, cardType: .dinersClub)
        insertCard(regexString: &result, cardType: .discover)
        insertCard(regexString: &result, cardType: .jcb)
        insertCard(regexString: &result, cardType: .maestro)
        insertCard(regexString: &result, cardType: .mastercard)
        insertCard(regexString: &result, cardType: .visa)
        
        return result
    }
    
    /**
     Adds commas and spaces between credit card descriptions.
     */
    private func add(description descriptionString: String, forCardType cardType: CreditCardType, toResultString resultString: inout String) {
        if contains(cardType) {
            resultString += ((!resultString.isEmpty) ? ", " : "")
            resultString += descriptionString
        }
    }
    
    /**
     Regular expression values for credit card types.
     */
    private var cardRegex: String? {
        switch self {
        case CreditCardType.americanExpress:
            return "^3[47][0-9]{13}$"
        case CreditCardType.dinersClub:
            return "^3(?:0[0-5]|[68][0-9])[0-9]{11}$"
        case CreditCardType.discover:
            return "^6(?:011|5[0-9]{2})[0-9]{12}$"
        case CreditCardType.jcb:
            return "^(?:2131|1800|35\\d{3})\\d{11}$"
        case CreditCardType.maestro:
            return "^(?:5[0678]\\d\\d|6304|6390|67\\d\\d)\\d{8,15}$"
        case CreditCardType.mastercard:
            return "^(?:5[1-5][0-9]{2}|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9]{12}$"
        case CreditCardType.visa:
            return "^4[0-9]{12}(?:[0-9]{3})?$"
        default:
            return nil
        }
    }
    
    /**
     Inserts or operator between regular expressions.
     */
    private func insertCard(regexString: inout String, cardType: CreditCardType) {
        guard let cardTypeRegex = cardType.cardRegex, self.contains(cardType) else {
            return
        }
        
        if !regexString.isEmpty {
            regexString.append("|")
        }
        
        regexString.append(cardTypeRegex)
    }
}


/// Stores configuration for `CreditCardCondition`.
public struct CreditCardConfiguration: Configuration {
    
    
    // MARK: - Properties
    
    public var cardType: CreditCardType
    
    
    // MARK: - Initializers
    
    public init() {
        self.init(cardType: .all)
    }
    
    public init(cardType: CreditCardType = .all) {
        self.cardType = cardType
    }
    
}
