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
    @DateTimeTimestampConverter() DateTime? createdAt,
    @DateTimeTimestampConverter() DateTime? updatedAt,
    @DateTimeTimestampConverter() DateTime? lastAnsweredQuizCreatedAt,
  }) = _AppUser;
  const AppUser._();
  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
  static String get collectionPath => 'user';
  static CollectionReference<SnapType> colRef() =>
      Document.colRef(collectionPath);
  static String docPath(String appUserAuthid) => '$collectionPath/$appUserAuthid';
  static DocumentReference<SnapType> docRef(String appUserAuthId) =>
      Document.docRefWithDocPath(docPath(appUserAuthId));
}
