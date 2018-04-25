//
//  OptionalValidator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 10/04/2018.
//  Copyright © 2018 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/// The `OptionalValidator` has two stages of conditions. First the `primaryCondition` is checked. If it is met, then the subsequent `condition` are checked for violations. If the `primaryCondition` is not met, then *no* violation is returned.
///
/// As an example, say you only want violations to show if there is text in the field, but otherwise ignore it as it is an optional field in a form. In this case you would use a `PresentCondition` as the `primaryCondition` and your subsequent validation requirements as the `conditions`.
public struct OptionalValidator: Validator {


    // MARK: - Properties

    public var primaryCondition: Condition
    public var conditions: [Condition]


    // MARK: - Initializers

    public init() {
        primaryCondition = PresentCondition()
        conditions = [PresentCondition()]
    }

    public init(conditions: [Condition], primaryCondition: Condition = PresentCondition()) {
        self.primaryCondition = primaryCondition
        self.conditions = conditions
    }


    // MARK: - Validity

    public func checkConditions(_ text: String?) -> [Condition]? {
        if primaryCondition.check(text) {
            let violations = conditions.filter { !($0.check(text)) }

            return violations.isEmpty ? nil : violations
        }

        return nil
    }

}
