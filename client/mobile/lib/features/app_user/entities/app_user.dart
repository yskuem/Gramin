import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/converters/date_time_timestamp_converter.dart';
import '../../../core/repositories/firestore/document.dart';
part 'app_user.freezed.dart';
part 'app_user.g.dart';

const defaultImageUrl = 'https://firebasestorage.googleapis.com/v0/b/gramin-dev.appspot.com/o/OIG4%20(2).jpeg?alt=media&token=e1e57410-e3e0-4698-9ae1-6aa005a02586';

@freezed
class AppUser with _$AppUser {
  factory AppUser({
    required String authId,
    required String displayId,
    required String name,
    @Default(defaultImageUrl) String iconUrl,//TODO: デフォルトの画像URLを追加
    @Default('') String description,
    @Default(0) int exPoint,//合計経験値
    @Default(0) int correctCount,
    @Default(0) int inCorrectCount,
    @Default(0) int winCount,
    @Default(0) int loseCount,
    @Default(0) int maxConsecutiveWins,//最大連勝数
    @Default(0) int consecutiveWins,//現在の連勝数
    @Default(0) int maxConsecutiveCorrects,//最大の連勝数
    @Default(0) int consecutiveCorrects,//現在の連勝数
    @Default([]) List<String> favoriteQuizIds,
    @DateTimeTimestampConverter() required DateTime createdAt,
    @DateTimeTimestampConverter() required DateTime updatedAt,
    @DateTimeTimestampConverter() required DateTime lastAnsweredQuizCreatedAt,
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
  int get calcUserLevel {
    if(exPoint <= 0) {
      return 0;
    }
    final sqrtNumber = sqrt(exPoint);
    final level = sqrtNumber.floor();
    return level;
  }
}
