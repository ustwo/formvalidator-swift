//
//  CreditCardCondition.swift
//  FormValidatorSwift
//
//  Created by Onur Ersel on 2016-11-02.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


/// Credit card types that are supported by `CreditCardCondition`. There is a `regex` property that returns the regex for validating that credit card number.
public enum CreditCardType : String {
    case americanExpress    = "American Express"
    case dinersClub         = "Diners Club"
    case discover           = "Discover"
    case jcb                = "JCB"
    case maestro            = "Maestro"
    case mastercard         = "Master Card"
    case visa               = "VISA"
    case all                = "all"
    
    var regex: String {
        switch self {
        case .americanExpress:
            return "3[47][0-9]{13}"
        case .dinersClub:
            return "3(?:0[0-5]|[68][0-9])[0-9]{11}"
        case .discover:
            return "6(?:011|5[0-9]{2})(?:[0-9]{12})"
        case .jcb:
            return "(?:2131|1800|35\\d{3})\\d{11}"
        case .maestro:
            return "(?:5[0678]\\d\\d|6304|6390|67\\d\\d)\\d{8,15}"
        case .mastercard:
            return "5[1-5][0-9]{14}"
        case .visa:
            return "^4[0-9]{12}(?:[0-9]{3})?$"
        case .all:
            let allCardTypes : [CreditCardType] = [.americanExpress, .dinersClub, .discover, .jcb, .maestro, .mastercard, .visa]
            let allCardRegexes : [String] = allCardTypes.map{ return $0.regex }
            return allCardRegexes.joined(separator: "|")
        }
    }
}


/**
 *  The `CreditCardCondition` checks a string for a credit card number.
 */
public struct CreditCardCondition : Condition {
    
    // MARK: - Properties
    
    public var localizedViolationString = StringLocalization.sharedInstance.localizedString("US2KeyConditionViolationCreditCard", comment: "")
    
    public fileprivate(set) var regex = ""
    
    public var shouldAllowViolation = true
    
    public var cardType: CreditCardType {
        didSet {
            self.regex = cardType.regex
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
    init (cardType : CreditCardType) {
        self.cardType = cardType
        self.regex = cardType.regex
    }
    
    /**
     Checks if the string is a valid credit card number, after removes all whitespace.
     */
    public func check(_ text: String?) -> Bool {
        guard let sourceText = text,
            let regExp = try? NSRegularExpression(pattern: self.regex, options: .caseInsensitive) else
        {
            return false
        }
        
        let trimmedText = String(sourceText.characters.filter{ $0 != " " })
        return check(trimmedText, withRegex: regExp)
    }
    
    public func check(_ trimmedText: String, withRegex regExp: NSRegularExpression) -> Bool {
        return regExp.firstMatch(in: trimmedText, options: [], range: NSMakeRange(0, trimmedText.characters.count)) != nil
    }
}
