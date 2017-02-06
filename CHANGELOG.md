# Change Log

All notable changes to this project will be documented in this file.
`FormValidatorSwift` adheres to [Semantic Versioning](http://semver.org/).

#### 1.x Releases
- `2.0.x` Releases - [2.0.0](#200)
- `1.2.x` Releases - [1.2.0](#120)
- `1.1.x` Releases - [1.1.0](#110)
- `1.0.x` Releases - [1.0.0](#100)

---

## [2.0.0](https://github.com/ustwo/formvalidator-swift/releases/tag/v2.0.0)

#### Breaking
- Updated `AlphabeticCondition` and `AlphanumericCondition` to allow unicode characters by default (`NumericCondition` already allowed unicode characters by default).
    - Updated by [Aaron McTavish](https://github.com/aamctustwo) in Pull Request [#49](https://github.com/ustwo/formvalidator-swift/pull/49).
- `AlphabeticCondition`, `AlphanumericCondition`, `CreditCardCondition`, `NumericCondition`, `PasswordStrengthCondition`, `PostcodeCondition`, and `RangeCondition` now store their configurations in a `configuration` property rather than as top-level properties of the condition's instance. As an example, for an instance of `AlphabeticCondition` the check `condition.allowsWhitespace == true` would become `condition.configuration.allowsWhitespace == true`.
    - Updated by [Aaron McTavish](https://github.com/aamctustwo) in Pull Request [#40](https://github.com/ustwo/formvalidator-swift/pull/40) and [#41](https://github.com/ustwo/formvalidator-swift/pull/41).

#### Added
- Added `Configuration`, `ConfigurableCondition`, `ConfigurableValidator` protocols. Updated existing conditions and validators to take advantage of new protocols.
    - Added by [Aaron McTavish](https://github.com/aamctustwo) in Pull Request [#40](https://github.com/ustwo/formvalidator-swift/pull/40) and [#41](https://github.com/ustwo/formvalidator-swift/pull/41).
- Added macOS support.
    - Added by [Aaron McTavish](https://github.com/aamctustwo) in Pull Request [#42](https://github.com/ustwo/formvalidator-swift/pull/42).

#### Updated
- `NumericCondition` now supports ASCII only (as opposed to allowing any Unicode numeric characters) as an option. The default remains allowing Unicode characters.
    - Updated by [Aaron McTavish](https://github.com/aamctustwo) in Pull Request [#41](https://github.com/ustwo/formvalidator-swift/pull/41).
- The `shouldAllowViolation` property on validator controls now works as expected.
    - Updated by [sparrowlegs](https://github.com/sparrowlegs) in Pull Request [#44](https://github.com/ustwo/formvalidator-swift/pull/44).

## [1.2.0](https://github.com/ustwo/formvalidator-swift/releases/tag/v1.2.0)

#### Added
- Add credit card validation.
    - Added by [Onur Ersel](https://github.com/onurersel) in Pull Request [#18](https://github.com/ustwo/formvalidator-swift/pull/18).
- Add Unicode support for `AlphabeticCondition` and `AlphanumericCondition`.
    - Added by [Aaron McTavish](https://github.com/aamctustwo) in Pull Request [#32](https://github.com/ustwo/formvalidator-swift/pull/32).

#### Updated
- Updated Swedish localization.
    - Updated by [Axel Lundbäck](https://github.com/axellundback) in Pull Request [#27](https://github.com/ustwo/formvalidator-swift/pull/27).

## [1.1.0](https://github.com/ustwo/formvalidator-swift/releases/tag/v1.1.0)

#### Added
- Add postcode validation for Sweden and Turkey.
    - Added by [Onur Ersel](https://github.com/onurersel) in Pull Request [#17](https://github.com/ustwo/formvalidator-swift/pull/17).
- Add localization for Turkish.
    - Added by [Onur Ersel](https://github.com/onurersel) in Pull Request [#17](https://github.com/ustwo/formvalidator-swift/pull/17).

#### Updated
- Updated documentation around `validatorDelegate`.
    - Updated by [Aaron McTavish](https://github.com/aamctustwo) in Pull Request [#21](https://github.com/ustwo/formvalidator-swift/pull/21).

## [1.0.0](https://github.com/ustwo/formvalidator-swift/releases/tag/v1.0.0)

#### Added
- Initial release of `FormValidatorSwift`.
