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
      iconUrl: json['iconUrl'] as String? ?? '',
      description: json['description'] as String? ?? '',
      exPoint: json['exPoint'] as int? ?? 0,
      correctCount: json['correctCount'] as int? ?? 0,
      inCorrectCount: json['inCorrectCount'] as int? ?? 0,
      winCount: json['winCount'] as int? ?? 0,
      loseCount: json['loseCount'] as int? ?? 0,
      favoriteQuizIds: (json['favoriteQuizIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: const DateTimeTimestampConverter()
          .fromJson(json['createdAt'] as Timestamp?),
      updatedAt: const DateTimeTimestampConverter()
          .fromJson(json['updatedAt'] as Timestamp?),
      lastAnsweredQuizCreatedAt: const DateTimeTimestampConverter()
          .fromJson(json['lastAnsweredQuizCreatedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'authId': instance.authId,
      'displayId': instance.displayId,
      'name': instance.name,
      'iconUrl': instance.iconUrl,
      'description': instance.description,
      'exPoint': instance.exPoint,
      'correctCount': instance.correctCount,
      'inCorrectCount': instance.inCorrectCount,
      'winCount': instance.winCount,
      'loseCount': instance.loseCount,
      'favoriteQuizIds': instance.favoriteQuizIds,
      'createdAt':
          const DateTimeTimestampConverter().toJson(instance.createdAt),
      'updatedAt':
          const DateTimeTimestampConverter().toJson(instance.updatedAt),
      'lastAnsweredQuizCreatedAt': const DateTimeTimestampConverter()
          .toJson(instance.lastAnsweredQuizCreatedAt),
    };
