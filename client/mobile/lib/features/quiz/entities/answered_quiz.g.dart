// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answered_quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnsweredQuizImpl _$$AnsweredQuizImplFromJson(Map<String, dynamic> json) =>
    _$AnsweredQuizImpl(
      quizId: json['quizId'] as String,
      userSelectIndex: json['userSelectIndex'] as int,
      isCorrect: json['isCorrect'] as bool,
      createdAt: const DateTimeTimestampConverter()
          .fromJson(json['createdAt'] as Timestamp?),
      updatedAt: const DateTimeTimestampConverter()
          .fromJson(json['updatedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$AnsweredQuizImplToJson(_$AnsweredQuizImpl instance) =>
    <String, dynamic>{
      'quizId': instance.quizId,
      'userSelectIndex': instance.userSelectIndex,
      'isCorrect': instance.isCorrect,
      'createdAt':
          const DateTimeTimestampConverter().toJson(instance.createdAt),
      'updatedAt':
          const DateTimeTimestampConverter().toJson(instance.updatedAt),
    };
