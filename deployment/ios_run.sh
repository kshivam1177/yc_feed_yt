flutter clean
flutter pub get
flutter run -t lib/main_dev.dart --dart-define=CUSTOM_ENV=$1 --dart-define=ENCRYPTION_HASH=$2 --dart-define=ENCRYPTION_SECRET=$3 | grep -v "Error retrieving thread information"