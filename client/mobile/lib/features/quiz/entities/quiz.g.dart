// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizImpl _$$QuizImplFromJson(Map<String, dynamic> json) => _$QuizImpl(
      id: json['quiz_id'] as String,
      createUserId: json['create_user_id'] as String,
      question: json['question'] as String,
      choices:
          (json['choices'] as List<dynamic>).map((e) => e as String).toList(),
      answer: json['answer'] as String,
      translation: json['translation'] as String,
      explanation: json['explanation'] as String,
      category: json['category'] as String,
      createdAt: const DateTimeTimestampConverter()
          .fromJson(json['createdAt'] as Timestamp),
      updatedAt: const DateTimeTimestampConverter()
          .fromJson(json['updatedAt'] as Timestamp),
      commentIds: (json['commentIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      countAnswers: (json['countAnswers'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [0, 0, 0, 0],
    );

Map<String, dynamic> _$$QuizImplToJson(_$QuizImpl instance) =>
    <String, dynamic>{
      'quiz_id': instance.id,
      'create_user_id': instance.createUserId,
      'question': instance.question,
      'choices': instance.choices,
      'answer': instance.answer,
      'translation': instance.translation,
      'explanation': instance.explanation,
      'category': instance.category,
      'createdAt':
          const DateTimeTimestampConverter().toJson(instance.createdAt),
      'updatedAt':
          const DateTimeTimestampConverter().toJson(instance.updatedAt),
      'commentIds': instance.commentIds,
      'countAnswers': instance.countAnswers,
    };
