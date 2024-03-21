

//freezedクラスを作成
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_template/features/app_user/entities/app_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/converters/date_time_timestamp_converter.dart';
import '../../../core/repositories/firestore/document.dart';

part 'answered_quiz.freezed.dart';
part 'answered_quiz.g.dart';

@freezed
class AnsweredQuiz with _$AnsweredQuiz {

  const factory AnsweredQuiz({
    required String quizId,
    required int userSelectIndex,
    required bool isCorrect,
    @DateTimeTimestampConverter() DateTime? createdAt,
    @DateTimeTimestampConverter() DateTime? updatedAt,
  }) = _AnsweredQuiz;
  const AnsweredQuiz._();

  factory AnsweredQuiz.fromJson(Map<String, dynamic> json) =>
      _$AnsweredQuizFromJson(json);
  static String collectionPath(String userId) =>
      '${AppUser.docPath(userId)}/answered_quiz';
  static CollectionReference<SnapType> colRef(String userId) =>
      Document.colRef(collectionPath(userId));
  static String docPath(String userId, String quizId) =>
      '${collectionPath(userId)}/$quizId';
  static DocumentReference<SnapType> docRef(String userId, String quizId) =>
      Document.docRefWithDocPath(docPath(userId, quizId));
}
