# Contributing

First, thanks for taking the time to submit a pull request! These are the few notes and guidelines to keep things coherent.

## Overview

1. Read and abide by the [Code of Conduct][code-of-conduct].
1. [Fork the project](https://github.com/ustwo/formvalidator-swift/fork) and clone.
1. Check you have all [requirements](#requirements) in place.
1. Create your [_feature_ branch](#feature-branch).
1. [Install](#install) the project dependencies for development.
1. [Test](#test).
1. If you have more than trivial changes (e.g. fixing typo's), then you must include a description in the [CHANGELOG.md][changelog].
1. Push your branch and submit a [Pull Request](https://github.com/ustwo/formvalidator-swift/compare/).

We will review the changes as soon as possible.

## Requirements

- [Xcode][xcode]
- [Bundler][bundler]
- [SwiftLint][swiftlint]

## Feature Branch

Please use a descriptive and concise name for your feature branch. Below is a snippet to show how to create a branch with git.

```sh
git checkout -b feature/feature-name
```

## Install

After installing [Xcode][xcode], [Bundler][bundler], and [SwiftLint][swiftlint] run the following terminal command from the project folder to install the remaining gems to be able to run all the tests and scripts as you would on the CI:

```sh
bundle install
```

## Test

You can quickly run the test suite using [Fastlane][fastlane]. From the project directly, use the following terminal command:

```sh
bundle exec fastlane test
```

Alternatively, you can run individual tests or the suite from [within Xcode][xcode-tests].

## Release

To bump the version numbers, create the git tag, and create a GitHub release, run (replacing `$NEW_VERSION` with the desired new version number): 

```sh
bundle exec fastlane bump_version version:$NEW_VERSION
```

Then update the [latest release][latest-release] with notes on GitHub.

Lastly, [submit the updated `podspec`][cocoapods-submission] to CocoaPods for release.

<!-- Links -->

[bundler]: http://bundler.io/
[changelog]: ../CHANGELOG.md
[cocoapods-submission]: https://guides.cocoapods.org/making/making-a-cocoapod.html#release
[code-of-conduct]: ../CODE_OF_CONDUCT.md
[fastlane]: https://fastlane.tools/
[latest-release]: https://github.com/ustwo/formvalidator-swift/releases
[swiftlint]: https://github.com/realm/SwiftLint
[xcode]: https://itunes.apple.com/gb/app/xcode/id497799835?mt=12#
[xcode-tests]: https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/05-running_tests.html
