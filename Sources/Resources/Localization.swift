//
//  Localization.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


/**
 *  Convenience handler for localizating built in conditions.
 */
internal struct StringLocalization {

    
    /**
     Localizes a string based on the `Localizeable.strings` file within the framework.
     - parameter key:     Lookup value for the strings table.
     - parameter comment: Comment value for the strings table.
     - returns: Localized string.
     */
    static func localizedString(_ key: String, comment: String) -> String {
        return NSLocalizedString(key, tableName: "Localizable", bundle: Bundle(for: DummyClass.self), comment: comment)
    }

}


// Use `DummyClass` to be able to get the right `NSBundle`. This is currently not possible with a `struct` in Swift 2.1.
private class DummyClass: NSObject { }
