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
or alternatively using `brew install fastlane`

# Available Actions
## Android
### android test
```
fastlane android test
```
Runs all the tests
### android print_app_version
```
fastlane android print_app_version
```
Print app version
### android build_and_send_apk_on_slack
```
fastlane android build_and_send_apk_on_slack
```
Build and send APK on slack for testing
### android deploy_internal_testing
```
fastlane android deploy_internal_testing
```
Build app and submit it to internal testing track on play console

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
