
import 'package:flutter_app_template/core/repositories/shared_preferences/shared_preference_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/repositories/shared_preferences/shared_preference_key.dart';
part 'sound_settings.g.dart';


@riverpod
class SoundSetting extends _$SoundSetting {
@override
  Future<bool> build() async {
    // ローカルストレージから読み取り
    final isSoundOn = ref.read(sharedPreferencesRepositoryProvider)
        .fetch<bool>(SharedPreferencesKey.soundSetting) ?? false;

    state = AsyncData(isSoundOn);
    return isSoundOn;
  }

  Future<void> toggleSoundSetting() async {
    final isSoundOn = state.value ?? false;

    // ローカルストレージに保存
    await ref.read(sharedPreferencesRepositoryProvider)
        .save<bool>(SharedPreferencesKey.soundSetting, !isSoundOn);

    state = AsyncData(!isSoundOn);
  }
}
