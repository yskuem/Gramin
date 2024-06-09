enum RemoteConfigKey {
  iOSAppVersion(key: 'ios_app_version'),
  androidAppVersion(key: 'android_app_version'),
  adIntervalCount(key: 'ad_interval_count'),
  ;

  const RemoteConfigKey({
    required this.key,
  });

  final String key;
}
