

import 'dart:async';
import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:version/version.dart';
part 'update_check.g.dart';

@Riverpod(keepAlive: true)
Stream<bool> isUpdateNeeded(IsUpdateNeededRef ref) async* {
  final updateNeededController = StreamController<bool>();
  final remoteConfig = FirebaseRemoteConfig.instance;
  final appPackageInfo = await PackageInfo.fromPlatform();
  final currentVersion = Version.parse(appPackageInfo.version);
  await remoteConfig.fetchAndActivate();
  final latestVersion = Version.parse(_getLatestAppVersion(remoteConfig));
  final isUpdateNeeded = currentVersion < latestVersion;
  updateNeededController.add(isUpdateNeeded);

  remoteConfig.onConfigUpdated.listen((_) async {
    await remoteConfig.fetchAndActivate();
    final latestVersion = Version.parse(_getLatestAppVersion(remoteConfig));
    final isUpdateNeeded = currentVersion < latestVersion;
    // 更新が必要かどうかの値をストリームに追加
    updateNeededController.add(isUpdateNeeded);
  });
  ref.onDispose(updateNeededController.close);

  // StreamControllerのストリームを返す
  yield* updateNeededController.stream;
}


String _getLatestAppVersion (FirebaseRemoteConfig remoteConfig) {

  if(Platform.isIOS) {
    return remoteConfig.getString('ios_latest_app_version');
  } else {
    return remoteConfig.getString('android_latest_app_version');
  }
}
