# Change Log

All notable changes to this project will be documented in this file.
`FormValidatorSwift` adheres to [Semantic Versioning](http://semver.org/).

#### 3.x Releases

* `3.2.x` Releases - [3.2.0](#320)
* `3.1.x` Releases - [3.1.0](#310)
* `3.0.x` Releases - [3.0.0](#300)

#### 2.x Releases

* `2.0.x` Releases - [2.0.0](#200)

#### 1.x Releases

* `1.2.x` Releases - [1.2.0](#120)
* `1.1.x` Releases - [1.1.0](#110)
* `1.0.x` Releases - [1.0.0](#100)

---

## Master

##### Breaking

* None.

##### Added

* None.

##### Updated

* None.

## [3.2.0](https://github.com/ustwo/formvalidator-swift/releases/tag/3.2.0)

##### Breaking

* None.

##### Added

* Added `OptionalValidator`.
  * Added by [Aaron McTavish](https://github.com/aamctustwo) in Pull Request [#75](https://github.com/ustwo/formvalidator-swift/pull/75).

##### Updated

* None.

## [3.1.0](https://github.com/ustwo/formvalidator-swift/releases/tag/3.1.0)

##### Breaking

* None.

##### Added

* Added Xcode 9.3 support.
  * Updated by [Aaron McTavish](https://github.com/aamctustwo) in Pull Request [#71](https://github.com/ustwo/formvalidator-swift/pull/71).

##### Updated

* Removes `weak` on property in `ValidatorControl` protocol as it is now deprecated in the latest version of Swift. See: https://github.com/apple/swift-evolution/pull/707
  * Updated by [Aaron McTavish](https://github.com/aamctustwo) in Pull Request [#71](https://github.com/ustwo/formvalidator-swift/pull/71).

## [3.0.0](https://github.com/ustwo/formvalidator-swift/releases/tag/3.0.0)

##### Breaking

* Renamed `PostcodeCountries` enum cases to begin with lower case letter.
  * Updated by [Aaron McTavish](https://github.com/aamctustwo) in Pull Request [#68](https://github.com/ustwo/formvalidator-swift/pull/68).
* Updated to Swift 4.1 (and added Xcode 9.x support).
  * Updated by [Aaron McTavish](https://github.com/aamctustwo) in Pull Request [#65](https://github.com/ustwo/formvalidator-swift/pull/65) and Pull Request [#67](https://github.com/ustwo/formvalidator-swift/pull/67).

##### Added

* None.

##### Updated

* None.

## [2.0.0](https://github.com/ustwo/formvalidator-swift/releases/tag/2.0.0)

#### Breaking

* Updated `AlphabeticCondition` and `AlphanumericCondition` to allow unicode characters by default (`NumericCondition` already allowed unicode characters by default).
  * Updated by [Aaron McTavish](https://github.com/aamctustwo) in Pull Request [#49](https://github.com/ustwo/formvalidator-swift/pull/49).
* `AlphabeticCondition`, `AlphanumericCondition`, `CreditCardCondition`, `NumericCondition`, `PasswordStrengthCondition`, `PostcodeCondition`, and `RangeCondition` now store their configurations in a `configuration` property rather than as top-level properties of the condition's instance. As an example, for an instance of `AlphabeticCondition` the check `condition.allowsWhitespace == true` would become `condition.configuration.allowsWhitespace == true`.
  * Updated by [Aaron McTavish](https://github.com/aamctustwo) in Pull Request [#40](https://github.com/ustwo/formvalidator-swift/pull/40) and [#41](https://github.com/ustwo/formvalidator-swift/pull/41).

#### Added

* Added `Configuration`, `ConfigurableCondition`, `ConfigurableValidator` protocols. Updated existing conditions and validators to take advantage of new protocols.
  * Added by [Aaron McTavish](https://github.com/aamctustwo) in Pull Request [#40](https://github.com/ustwo/formvalidator-swift/pull/40) and [#41](https://github.com/ustwo/formvalidator-swift/pull/41).
* Added macOS support.
  * Added by [Aaron McTavish](https://github.com/aamctustwo) in Pull Request [#42](https://github.com/ustwo/formvalidator-swift/pull/42).

#### Updated

* `NumericCondition` now supports ASCII only (as opposed to allowing any Unicode numeric characters) as an option. The default remains allowing Unicode characters.
  * Updated by [Aaron McTavish](https://github.com/aamctustwo) in Pull Request [#41](https://github.com/ustwo/formvalidator-swift/pull/41).
* The `shouldAllowViolation` property on validator controls now works as expected.
  * Updated by [sparrowlegs](https://github.com/sparrowlegs) in Pull Request [#44](https://github.com/ustwo/formvalidator-swift/pull/44).

## [1.2.0](https://github.com/ustwo/formvalidator-swift/releases/tag/1.2.0)

#### Added

* Add credit card validation.
  * Added by [Onur Ersel](https://github.com/onurersel) in Pull Request [#18](https://github.com/ustwo/formvalidator-swift/pull/18).
* Add Unicode support for `AlphabeticCondition` and `AlphanumericCondition`.
  * Added by [Aaron McTavish](https://github.com/aamctustwo) in Pull Request [#32](https://github.com/ustwo/formvalidator-swift/pull/32).

#### Updated

* Updated Swedish localization.
  * Updated by [Axel Lundbäck](https://github.com/axellundback) in Pull Request [#27](https://github.com/ustwo/formvalidator-swift/pull/27).

## [1.1.0](https://github.com/ustwo/formvalidator-swift/releases/tag/1.1.0)

#### Added

* Add postcode validation for Sweden and Turkey.
  * Added by [Onur Ersel](https://github.com/onurersel) in Pull Request [#17](https://github.com/ustwo/formvalidator-swift/pull/17).
* Add localization for Turkish.
  * Added by [Onur Ersel](https://github.com/onurersel) in Pull Request [#17](https://github.com/ustwo/formvalidator-swift/pull/17).

#### Updated

* Updated documentation around `validatorDelegate`.
  * Updated by [Aaron McTavish](https://github.com/aamctustwo) in Pull Request [#21](https://github.com/ustwo/formvalidator-swift/pull/21).

## [1.0.0](https://github.com/ustwo/formvalidator-swift/releases/tag/1.0.0)

#### Added

* Initial release of `FormValidatorSwift`.
