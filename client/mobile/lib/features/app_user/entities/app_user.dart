import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/converters/date_time_timestamp_converter.dart';
import '../../../core/repositories/firestore/document.dart';
part 'app_user.freezed.dart';
part 'app_user.g.dart';


@freezed
class AppUser with _$AppUser {
  factory AppUser({
    required String authId,
    required String displayId,
    required String name,
    @Default([]) List<String> answeredQuizIds,
    @Default([]) List<String> correctQuizIds,
    @Default([]) List<String> inCorrectQuizIds,
    @Default([]) List<String> commentQuizIds,
    @Default([]) List<String> favoriteQuizIds,
    @DateTimeTimestampConverter() required DateTime createdAt,
    @DateTimeTimestampConverter() required DateTime updateAt,
  }) = _AppUser;
  const AppUser._();
  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  Map<String, dynamic> get toDoc => <String, dynamic>{
    ...toJson(),
    'createdAt': createdAt,
    'updatedAt': FieldValue.serverTimestamp(),
  };
  static String get collectionPath => 'user';
  static CollectionReference<SnapType> colRef() =>
      Document.colRef(collectionPath);
  static String docPath(String appUserAuthid) => '$collectionPath/$appUserAuthid';
  static DocumentReference<SnapType> docRef(String appUserAuthId) =>
      Document.docRefWithDocPath(docPath(appUserAuthId));
}
