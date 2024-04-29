
import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'fetch_store_url.g.dart';

@Riverpod(keepAlive: true)
Future<String> fetchStoreUrl(FetchStoreUrlRef ref) async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.fetchAndActivate();
  final key = Platform.isIOS
      ? 'app_store_url'
      : 'play_store_url';
  final storeUrl = remoteConfig.getString(key);
  return storeUrl;
}


