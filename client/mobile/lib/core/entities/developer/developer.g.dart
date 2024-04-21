// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'developer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeveloperImpl _$$DeveloperImplFromJson(Map<String, dynamic> json) =>
    _$DeveloperImpl(
      developerId: json['developerId'] as String?,
      name: json['name'] as String?,
      image: json['image'] == null
          ? null
          : StorageFile.fromJson(json['image'] as Map<String, dynamic>),
      birthdate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['birthdate'], const DateTimeTimestampConverter().fromJson),
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const DateTimeTimestampConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['updatedAt'], const DateTimeTimestampConverter().fromJson),
    );

Map<String, dynamic> _$$DeveloperImplToJson(_$DeveloperImpl instance) =>
    <String, dynamic>{
      'developerId': instance.developerId,
      'name': instance.name,
      'image': instance.image?.toJson(),
      'birthdate': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.birthdate, const DateTimeTimestampConverter().toJson),
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
