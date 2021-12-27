flutter clean
flutter pub get
cd ios
pod deintegrate
pod clean
pod install
cd ..
flutter build ios --dart-define=CUSTOM_ENV=$1 --dart-define=ENCRYPTION_HASH=$2 --dart-define=ENCRYPTION_SECRET=$3