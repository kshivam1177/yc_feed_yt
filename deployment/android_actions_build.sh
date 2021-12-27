flutter clean
flutter pub get
rm -rf ./android/app/src/main/assets/containers/*.json
cp ./deployment/gtm/$5 ./android/app/src/main/assets/containers/
echo "------GTM CONFIG COPIED------"
flutter build apk --flavor $4 --dart-define=CUSTOM_ENV=$1 --dart-define=ENCRYPTION_HASH=$2 --dart-define=ENCRYPTION_SECRET=$3 --no-sound-null-safety
# build/app/outputs/flutter-apk/app-dev-debug.apk