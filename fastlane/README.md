fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
### test
```
fastlane test
```
Runs tests on the primary platforms and configurations
### verify
```
fastlane verify
```
Runs tests
### build
```
fastlane build
```
Builds scheme
### upload_cov
```
fastlane upload_cov
```
Upload code coverage reports (if running on CI)
### update_docs
```
fastlane update_docs
```
Updates the GitHub Pages documentation
### bump_version
```
fastlane bump_version
```
Bumps the version number of the project and podspec

This action does the following:



- Ensures a clean git status

- Increment the version number (Project & Podspec)

- Lints the CocoaPods Library

- Commit and push the version bump

- Creates a GitHub Release and git tag

- Lints the CocoaPods Spec



This action does NOT do the following:



- Add the changelog notes to the GitHub release

- Submit the updated podspec to CocoaPods

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
