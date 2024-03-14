# コードを自動生成する
run_build_runner:
	dart run build_runner build

# コードを監視して自動生成する
watch_build_runner:
	dart run build_runner watch

# packageを取り込む
pub_get:
	flutter pub get

# アイコンを作成
create_icon:
	flutter pub run flutter_launcher_icons:main

# [Android] リリースビルド
release_build_android:
	flutter build appbundle --release --dart-define=FLAVOR=prod --target lib/main.dart

# [Android + 難読化] リリースビルド
release_build_obfuscate_android:
	flutter build appbundle --release --obfuscate --split-debug-info=obfuscate/android --dart-define=FLAVOR=prod --target lib/main.dart

# [iOS] リリースビルド
release_build_ios:
	flutter build ipa --release --dart-define=FLAVOR=prod --target lib/main.dart

# [iOS + 難読化] リリースビルド
release_build_obfuscate_ios:
	flutter build ipa --release --obfuscate --split-debug-info=obfuscate/ios --dart-define=FLAVOR=prod --target lib/main.dart

# テスト（カバレッジ）
flutter_test_c:
	flutter test --coverage

# lcov.info => html
genhtml:
	genhtml coverage/lcov.info -o coverage/html

# Masonのbrickを取得する
mason_get:
	mason get

# Masonのbricksのアップグレードする
mason_upgrade:
	mason upgrade

# Masonで新しいfeatureディレクトリを作成する
mason_make_feature:
	mason make feature