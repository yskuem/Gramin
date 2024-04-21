import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/converters/date_time_timestamp_converter.dart';
import '../../../core/repositories/firestore/document.dart';
part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  factory Quiz({
    @JsonKey(name: 'quiz_id') required String id,
    @JsonKey(name: 'create_user_id') required String createUserId,
    required String question,
    required List<String> choices,
    required String answer,
    required String translation,
    required String explanation,
    required String category,
    @DateTimeTimestampConverter() required DateTime createdAt,
    @DateTimeTimestampConverter() required DateTime updatedAt,
    @Default([]) List<String> commentIds,
    @Default([0,0,0,0]) List<int> countAnswers,
  }) = _Quiz;
  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
  const Quiz._();
  static String get collectionPath => 'quiz';

  static CollectionReference<SnapType> get colRef =>
      Document.colRef(collectionPath);

  static String docPath(String quizId) => '$collectionPath/$quizId';

  static DocumentReference<SnapType> docRef(String id) =>
      Document.docRefWithDocPath(docPath(id));
  Map<String, dynamic> get toDoc => <String, dynamic>{
    ...toJson(),
    'createdAt': createdAt,
    'updatedAt': FieldValue.serverTimestamp(),
  };
}


























