// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      authId: json['authId'] as String,
      displayId: json['displayId'] as String,
      name: json['name'] as String,
      answeredQuizIds: (json['answeredQuizIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      correctQuizIds: (json['correctQuizIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      inCorrectQuizIds: (json['inCorrectQuizIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      commentQuizIds: (json['commentQuizIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      favoriteQuizIds: (json['favoriteQuizIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updateAt: DateTime.parse(json['updateAt'] as String),
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'authId': instance.authId,
      'displayId': instance.displayId,
      'name': instance.name,
      'answeredQuizIds': instance.answeredQuizIds,
      'correctQuizIds': instance.correctQuizIds,
      'inCorrectQuizIds': instance.inCorrectQuizIds,
      'commentQuizIds': instance.commentQuizIds,
      'favoriteQuizIds': instance.favoriteQuizIds,
      'createdAt': instance.createdAt.toIso8601String(),
      'updateAt': instance.updateAt.toIso8601String(),
    };