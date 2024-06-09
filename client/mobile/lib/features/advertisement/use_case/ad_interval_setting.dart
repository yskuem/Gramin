
import 'package:flutter_app_template/core/repositories/remote_config/remote_config_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/repositories/remote_config/remote_config_key.dart';

part 'ad_interval_setting.g.dart';


@riverpod
Future<int> adIntervalCount (AdIntervalCountRef ref) async {
  await ref.read(remoteConfigRepositoryProvider).fetchAndActivate();
  final intervalCount = ref.read(remoteConfigRepositoryProvider).getInt(RemoteConfigKey.adIntervalCount);
  return intervalCount;
}
