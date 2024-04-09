

import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:version/version.dart';
part 'update_check.g.dart';

@Riverpod(keepAlive: true)
Stream<bool> isUpdateNeeded(IsUpdateNeededRef ref) async* {
  final updateNeededController = StreamController<bool>();
  final remoteConfig = FirebaseRemoteConfig.instance;;
  final appPackageInfo = await PackageInfo.fromPlatform();
  final currentVersion = Version.parse(appPackageInfo.version).toString();
  await remoteConfig.fetchAndActivate();
  final latestVersion = remoteConfig.getString('latest_app_version');
  final isUpdateNeeded = !(currentVersion == latestVersion);
  updateNeededController.add(isUpdateNeeded);

  remoteConfig.onConfigUpdated.listen((_) async {
    await remoteConfig.fetchAndActivate();
    final latestVersion = remoteConfig.getString('latest_app_version');
    final isUpdateNeeded = !(currentVersion == latestVersion);
    // 更新が必要かどうかの値をストリームに追加
    updateNeededController.add(isUpdateNeeded);
  });
  ref.onDispose(updateNeededController.close);

  // StreamControllerのストリームを返す
  yield* updateNeededController.stream;
}
