enum SharedPreferencesKey {
  localCounter('localCounter'),
  soundSetting('soundSetting'),
  ;

  const SharedPreferencesKey(this.value);
  final String value;
}
