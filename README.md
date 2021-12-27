# yc_app

Yellow Class Android and iOS App made using Flutter.

## App Commands For Development
- `flutter pub get` - Install all the dependencies
- `flutter packages pub run build_runner build` - generate Hive types
- `flutter packages pub run build_runner build --delete-conflicting-outputs` - generate Hive types with delete conflicts

#### Android
- Development - `./deployment/android_run.sh development develop 11111111111111111111111111111111 dev 'GTM-MW2QZHJ.json'`
- Staging - `./deployment/android_run.sh staging staging 22222222222222222222222222222222 dev 'GTM-MW2QZHJ.json'`
- Production - `./deployment/android_run.sh production XXX XXX prod 'GTM-T7NZV96.json'`

#### iOS
- Development - `./deployment/ios_run.sh development develop 11111111111111111111111111111111 | grep -v "Error retrieving thread information"`
- Staging - `./deployment/ios_run.sh staging staging 22222222222222222222222222222222 | grep -v "Error retrieving thread information"`
- Production - `./deployment/ios_run.sh production XXX XXX | grep -v "Error retrieving thread information"`

## Steps to build or release a new version of the app

- Update the build version and build number in pubspec.yaml

#### Android
- Development - `./deployment/android_build.sh development develop 11111111111111111111111111111111 dev 'GTM-MW2QZHJ.json'`
- Staging - `./deployment/android_build.sh staging staging 22222222222222222222222222222222 dev 'GTM-MW2QZHJ.json'`
- Production - `./deployment/android_build.sh production XXX XXX prod 'GTM-T7NZV96.json'`

#### iOS
- Development - `./deployment/ios_build.sh development develop 11111111111111111111111111111111`
- Staging - `./deployment/ios_build.sh staging staging 22222222222222222222222222222222`
- Production - `./deployment/ios_build.sh production XXX XXX`
- For iOS app, after running the build command, open XCode, go to Product -> Archive -> Select the version to release in the popup -> Click Distribute App -> Keep pressing next from then on.

### Run code analyzer/linter
- `dart format -l 80 lib/*` - Make sure any line does not exceed the 80 character limit
- `flutter pub run dart_code_metrics:metrics analyze lib` - Check for lint and other improvements in the codebase
- `flutter pub run dart_code_metrics:metrics check-unused-files lib` - Check for unused dead files in the codebase