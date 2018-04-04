[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/ustwo/formvalidator-swift/blob/master/LICENSE.md)
[![Build Status](https://travis-ci.org/ustwo/formvalidator-swift.svg?branch=master)](https://travis-ci.org/ustwo/formvalidator-swift)
[![codecov.io](https://codecov.io/github/ustwo/formvalidator-swift/coverage.svg?branch=master)](https://codecov.io/github/ustwo/formvalidator-swift?branch=master)
[![Platform](https://img.shields.io/cocoapods/p/FormValidatorSwift.svg?style=flat)](https://ustwo.github.io/formvalidator-swift)
![Swift](https://img.shields.io/badge/Swift-4.1-orange.svg)
[![Twitter](https://img.shields.io/badge/twitter-@ustwo-blue.svg?style=flat)](http://twitter.com/ustwo)

# FormValidatorSwift

The FormValidatorSwift framework allows you to validate inputs of text fields and text views in a convenient way. It has been developed and used by iOS developers at [ustwo](https://ustwo.com/).

## Features

* [x] Simply use `ValidatorTextField` instead of `UITextField` or `NSTextField` (`ValidatorTextView` instead of `UITextView` or `NSTextView`)
* [x] Know what went wrong and where
* [x] Create own conditions using regular expressions for example
* [x] Create own validators which contain a collection of conditions
* [x] Support iOS, macOS, and tvOS

## Dependencies

* [Xcode](https://itunes.apple.com/gb/app/xcode/id497799835?mt=12#)

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate FormValidatorSwift into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.3'
use_frameworks!

pod 'FormValidatorSwift', '~> 3.0'
```

Then, run the following command:

```bash
$ pod install
```

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate FormValidatorSwift into your project manually.

#### Embedded Framework

* Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

* Add FormValidatorSwift as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/ustwo/formvalidator-swift.git
```

* Open the new `FormValidatorSwift` folder, and drag the `FormValidatorSwift.xcodeproj` into the Project Navigator of your application's Xcode project.

  > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

* Select the `FormValidatorSwift.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
* Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
* In the tab bar at the top of that window, open the "General" panel.
* Click on the `+` button under the "Embedded Binaries" section.
* You will see two different `FormValidatorSwift.xcodeproj` folders each with two different versions of the `FormValidatorSwift.framework` nested inside a `Products` folder.

  > It does not matter which `Products` folder you choose from, but it does matter whether you choose the top or bottom `FormValidatorSwift.framework`.

* Select the top `FormValidatorSwift.framework` for iOS, the middle one for tvOS, or the bottom one for macOS.

  > You can verify which one you selected by inspecting the build log for your project. The build target for `FormValidatorSwift` will be listed as `FormValidatorSwift iOS`, `FormValidatorSwift macOS`, or `FormValidatorSwift tvOS`.

* And that's it!

> The `FormValidatorSwift.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

---

## Usage

The two core components of FormValidatorSwift are `Condition` and `Validator`. These are both protocols, with many common implementations provided by the framework.

A `Condition` defines a specific requirement for a `String` to be considered valid and defines a way to check the `String`. A `Validator` defines a way to check whether a `String` is valid based on a set of `Condition`. These provide the building blocks upon which the other elements of FormValidatorSwift are built.

`ValidatorTextField` and `ValidatorTextView` provide common UI implementations for a validatable text input method. These controls can then be combined into a `Form` for quick validation of all text input.

### Condition

A `Condition` is typically defined by a regular expression. This is used in the default implementation to check the string. However, you can provide your own implementation of the `check(text:)` function to do a more complicated validation.

Here is an example using one of the built-in conditions. Note that calling `check(text:)` simply returns a `Bool` as to whether the text is valid or not.

```swift
let condition = AlphanumericCondition()

let validResult = condition.check("Foo123")
let invalidResult = condition.check("Foo?!@")
```

### Validator

A `Validator` takes an array of `Condition` and checks each condition to validate a string. If the validation fails, then `checkConditions(text:)` will return an array of the violated conditions.

Here is an example using one of the built-in validators. In this example, `validResult` will be `nil` and `invalidResult` will be `[AlphanumericCondition]`.

```swift
let validator = AlphanumericValidator()

let validResult = validator.checkConditions("Foo123")
let invalidResult = validator.checkConditions("Foo?!@")
```

### ValidatorTextField

To provide a user interface, you can use `ValidatorTextField` or `ValidatorTextView`. These are subclasses of `UITextField` and `UITextView` respectively (or `NSTextField` and `NSTextView` on macOS). They both conform to the `ValidatorControl` protocol, which has the additional capability of using a `Validator` to check the text.

Here is an example of a text field that would only allow alphanumeric text.

```swift
let nameTextField = ValidatorTextField(validator: AlphanumericValidator())
```

This does not work well for more complicated text fields. For example, you would not want an email address validated until the user is finished typing. To postpone validation, we need to set `shouldAllowViolation` and `validateOnFocusLossOnly` both to be `true`. Example:

```swift
let emailTextField = ValidatorTextField(validator: EmailValidator())
emailTextField.shouldAllowViolation = true
emailTextField.validateOnFocusLossOnly = true
```

We can respond to changes in the validity of `ValidatorTextField` by implementing the `ValidatorControlDelegate` and setting ourselves as the validator delegate (using the `setValidatorDelegate(_:)` method). Below is an example implementation. In the example we highlight the text field with a red border if it is invalid. We also list the error in a label called `errorLabel` and present it to the user.

```swift
func validatorControl(validatorControl: ValidatorControl, changedValidState validState: Bool) {
    guard let controlView = validatorControl as? UIView else {
        return
    }

    if validState {
        controlView.layer.borderColor = nil
        controlView.layer.borderWidth = 0.0
        errorLabel.hidden = true
    } else {
        controlView.layer.borderColor = UIColor.red.CGColor
        controlView.layer.borderWidth = 2.0
    }
}

func validatorControl(validatorControl: ValidatorControl, violatedConditions conditions: [Condition]) {
    var errorText = ""
    for condition in conditions {
        errorText += condition.localizedViolationString
    }
    errorLabel.text = errorText

    errorLabel.hidden = false
}

func validatorControlDidChange(validatorControl: ValidatorControl) {
    // Not used in this example
}
```

### Form

We can combine a series of `ValidatorControl` into a `Form`. We have a convenience implementation call `ControlForm`. We can then combine our alphanumeric textfield and our email textfield from our previous examples into a form. This provides an easy method for checking if the entire form is valid (say, before submission of the form data to a server). Below is an example:

```swift
var form = ControlForm()

form.addEntry(nameTextField)
form.addEntry(emailTextField)

if form.isValid {
  // Hooray! Our form is valid. Submit the data!
  ...
} else {
  // Sad day, we need to have the user fix the data.
  ...
}
```

### Example

More detailed examples can be found in the `iOS Example` and `macOS Example` apps in this repository.

## Collaborate

We welcome contributors! Whether you're fixing a typo, squashing a bug, or adding new functionality please join us in making this project better. Read our [contributing guidelines][contributing] to find out how to add your support.

## Maintainers

* Shagun Madhikarmi (@madhikarma)
* Aaron McTavish (@aamctustwo)

## Contact

* [open.source@ustwo.com](mailto:open.source@ustwo.com)

## License

FormValidatorSwift is released under the MIT License. See the LICENSE file.

<!-- Links -->

[contributing]: .github/CONTRIBUTING.md
