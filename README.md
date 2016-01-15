[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/ustwo/formvalidator-swift/blob/master/LICENSE)
[![Build Status](https://travis-ci.org/ustwo/formvalidator-swift.svg?branch=master)](https://travis-ci.org/ustwo/formvalidator-swift)
[![codecov.io](https://codecov.io/github/ustwo/formvalidator-swift/coverage.svg?branch=master)](https://codecov.io/github/ustwo/formvalidator-swift?branch=master)
![Swift](https://img.shields.io/badge/Swift-2.1-orange.svg)

# FormValidatorSwift

The FormValidatorSwift framework allows you to validate inputs of text fields and text views in a convenient way. It has been developed and used by iOS developers at [ustwo](ustwo.com).

## Features

- [x] Simply use `ValidatorTextField` instead of `UITextField` (`ValidatorTextView` instead of `UITextView`)
- [x] Know what went wrong and where
- [x] Create own conditions using regular expressions for example
- [x] Create own validators which contain a collection of conditions
- [x] Support iOS and tvOS

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

pod 'FormValidatorSwift', '~> 1.0'
```

Then, run the following command:

```bash
$ pod install
```

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate FormValidatorSwift into your project manually.

#### Embedded Framework

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

- Add FormValidatorSwift as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/ustwo/formvalidator-swift.git
```

- Open the new `FormValidatorSwift` folder, and drag the `FormValidatorSwift.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `FormValidatorSwift.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `FormValidatorSwift.xcodeproj` folders each with two different versions of the `FormValidatorSwift.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from, but it does matter whether you choose the top or bottom `FormValidatorSwift.framework`.

- Select the top `FormValidatorSwift.framework` for iOS and the bottom one for tvOS.

    > You can verify which one you selected by inspecting the build log for your project. The build target for `FormValidatorSwift` will be listed as either `FormValidatorSwift iOS` or `FormValidatorSwift tvOS`.

- And that's it!

> The `FormValidatorSwift.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

---

## Usage

## Contributors

* [Shagun Madhikarmi](mailto:shagun@ustwo.com)
* [Aaron McTavish](mailto:aamct@ustwo.com)
* [Martin Stolz](mailto:martin@ustwo.com)

## License

BaseView is released under the MIT License. See the LICENSE file.
