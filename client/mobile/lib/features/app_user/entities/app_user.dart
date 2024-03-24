import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/converters/date_time_timestamp_converter.dart';
import '../../../core/repositories/firestore/document.dart';
part 'app_user.freezed.dart';
part 'app_user.g.dart';

const defaultImageUrl = 'https://firebasestorage.googleapis.com/v0/b/gramin-dev.appspot.com/o/DALL%C2%B7E%202024-03-24%2014.48.58%20-%20Design%20a%20delicate%20and%20cute%20anime%20girl%20icon%2C%20emphasizing%20a%20more%20subtle%20and%20pale%20pink%20color%20scheme.%20The%20character%20should%20embody%20traditional%20Japanese%20ani.webp?alt=media&token=c7e6b1ad-8c3a-4f21-8ca7-838d24284c6b';

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
