import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/converters/date_time_timestamp_converter.dart';
import '../../../core/repositories/firestore/document.dart';
part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  factory Quiz({
    required String quizId,//バックエンドにない
    required String question,
    required List<String> choices,
    required String answer,
    required String translation,
    required String explanation,
    required String category,
    required String createUserId,//バックエンドにない
    @DateTimeTimestampConverter() DateTime? createdAt,
    @DateTimeTimestampConverter() DateTime? updatedAt,
    @Default([]) List<String> commentIds,
    @Default([]) List<String> answeredUserIds,
    @Default([0,0,0,0]) List<int> countAnswers,
  }) = _Quiz;
  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
  const Quiz._();
  String get collectionPath => 'quiz/$quizId';
  CollectionReference<SnapType> get colRef =>
      Document.colRef(collectionPath);
}
















