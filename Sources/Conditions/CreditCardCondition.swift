//
//  CreditCardCondition.swift
//  FormValidatorSwift
//
//  Created by Onur Ersel on 2016-11-02.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


/// Credit card types that are supported by `CreditCardCondition`. There is a `regex` property that returns the regex for validating that credit card number.
public struct CreditCardType: OptionSet {
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    static let americanExpress    = CreditCardType(rawValue: 1 << 0)
    static let dinersClub         = CreditCardType(rawValue: 1 << 1)
    static let discover           = CreditCardType(rawValue: 1 << 2)
    static let jcb                = CreditCardType(rawValue: 1 << 3)
    static let maestro            = CreditCardType(rawValue: 1 << 4)
    static let mastercard         = CreditCardType(rawValue: 1 << 5)
    static let visa               = CreditCardType(rawValue: 1 << 6)
    
    static let all: CreditCardType = [.americanExpress, .dinersClub, .discover, .jcb, .maestro, .mastercard, .visa]
    
    
    
    var description: String {
        switch self.rawValue {
        case CreditCardType.americanExpress.rawValue:
            return "American Express"
        case CreditCardType.dinersClub.rawValue:
            return "Diners Club"
        case CreditCardType.discover.rawValue:
            return "Discover"
        case CreditCardType.jcb.rawValue:
            return "JCB"
        case CreditCardType.maestro.rawValue:
            return "Maestro"
        case CreditCardType.mastercard.rawValue:
            return "Master Card"
        case CreditCardType.visa.rawValue:
            return "VISA"
        case CreditCardType.all.rawValue:
            return "All"
        default: return ""
        }
    }
    
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
        default: return nil
        }
    }
    
    private func insertCard(regexString: inout String, cardType: CreditCardType) {
        guard let cardTypeRegex = cardType.cardRegex else { return }
        
        if self.contains(cardType) {
            if !regexString.isEmpty {
                regexString.append("|")
            }
            
            regexString.append(cardTypeRegex)
        }
    }
    
    var regex: String {
        var str = ""
        self.insertCard(regexString: &str, cardType: .americanExpress)
        self.insertCard(regexString: &str, cardType: .dinersClub)
        self.insertCard(regexString: &str, cardType: .discover)
        self.insertCard(regexString: &str, cardType: .jcb)
        self.insertCard(regexString: &str, cardType: .maestro)
        self.insertCard(regexString: &str, cardType: .mastercard)
        self.insertCard(regexString: &str, cardType: .visa)
        
        return str
    }
}




/**
 *  The `CreditCardCondition` checks a string for a credit card number.
 */
public struct CreditCardCondition: Condition {
    
    // MARK: - Properties
    
    public var localizedViolationString = StringLocalization.sharedInstance.localizedString("US2KeyConditionViolationCreditCard", comment: "")
    
    public fileprivate(set) var regex = ""
    
    public var shouldAllowViolation = true
    
    public var cardType: CreditCardType {
        didSet {
            regex = cardType.regex
        }
    }
    
    
    // MARK: - Initializers
    /**
     Initializes a `CreditCardCondition` acceptible with all credit card types.
     */
    public init() {
        self.init(cardType: .all)
    }
    
    /**
     Initializes a `CreditCardCondition`.
     - parameter cardType: Credit card type to use for validation.
     */
    init (cardType: CreditCardType) {
        self.cardType = cardType
        self.regex = cardType.regex
    }
    
    /**
     Checks if the string is a valid credit card number, after removes all whitespace.
     */
    public func check(_ text: String?) -> Bool {
        guard let sourceText = text,
            let regExp = try? NSRegularExpression(pattern: self.regex, options: .caseInsensitive) else {
            return false
        }
        
        let trimmedText = String(sourceText.characters.filter { $0 != " " })
        return check(trimmedText, withRegex: regExp)
    }
    
    public func check(_ trimmedText: String, withRegex regExp: NSRegularExpression) -> Bool {
        return regExp.firstMatch(in: trimmedText, options: [], range: NSRange(location:0, length:trimmedText.characters.count)) != nil
    }
}
