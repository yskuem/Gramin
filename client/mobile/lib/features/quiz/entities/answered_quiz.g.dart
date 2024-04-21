// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answered_quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnsweredQuizImpl _$$AnsweredQuizImplFromJson(Map<String, dynamic> json) =>
    _$AnsweredQuizImpl(
      id: json['id'] as String,
      userSelectIndex: json['userSelectIndex'] as int,
      isCorrect: json['isCorrect'] as bool,
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const DateTimeTimestampConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['updatedAt'], const DateTimeTimestampConverter().fromJson),
    );

Map<String, dynamic> _$$AnsweredQuizImplToJson(_$AnsweredQuizImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userSelectIndex': instance.userSelectIndex,
      'isCorrect': instance.isCorrect,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const DateTimeTimestampConverter().toJson),
      'updatedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.updatedAt, const DateTimeTimestampConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
