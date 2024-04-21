// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  String get authId => throw _privateConstructorUsedError;
  String get displayId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get iconUrl =>
      throw _privateConstructorUsedError; //TODO: デフォルトの画像URLを追加
  String get description => throw _privateConstructorUsedError;
  int get exPoint => throw _privateConstructorUsedError; //合計経験値
  int get correctCount => throw _privateConstructorUsedError;
  int get inCorrectCount => throw _privateConstructorUsedError;
  int get winCount => throw _privateConstructorUsedError;
  int get loseCount => throw _privateConstructorUsedError;
  int get maxConsecutiveWins => throw _privateConstructorUsedError; //最大連勝数
  int get consecutiveWins => throw _privateConstructorUsedError; //現在の連勝数
  int get maxConsecutiveCorrects => throw _privateConstructorUsedError; //最大の連勝数
  int get consecutiveCorrects => throw _privateConstructorUsedError; //現在の連勝数
  List<String> get favoriteQuizIds => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get lastAnsweredQuizCreatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call(
      {String authId,
      String displayId,
      String name,
      String iconUrl,
      String description,
      int exPoint,
      int correctCount,
      int inCorrectCount,
      int winCount,
      int loseCount,
      int maxConsecutiveWins,
      int consecutiveWins,
      int maxConsecutiveCorrects,
      int consecutiveCorrects,
      List<String> favoriteQuizIds,
      @DateTimeTimestampConverter() DateTime createdAt,
      @DateTimeTimestampConverter() DateTime updatedAt,
      @DateTimeTimestampConverter() DateTime lastAnsweredQuizCreatedAt});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authId = null,
    Object? displayId = null,
    Object? name = null,
    Object? iconUrl = null,
    Object? description = null,
    Object? exPoint = null,
    Object? correctCount = null,
    Object? inCorrectCount = null,
    Object? winCount = null,
    Object? loseCount = null,
    Object? maxConsecutiveWins = null,
    Object? consecutiveWins = null,
    Object? maxConsecutiveCorrects = null,
    Object? consecutiveCorrects = null,
    Object? favoriteQuizIds = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? lastAnsweredQuizCreatedAt = null,
  }) {
    return _then(_value.copyWith(
      authId: null == authId
          ? _value.authId
          : authId // ignore: cast_nullable_to_non_nullable
              as String,
      displayId: null == displayId
          ? _value.displayId
          : displayId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      exPoint: null == exPoint
          ? _value.exPoint
          : exPoint // ignore: cast_nullable_to_non_nullable
              as int,
      correctCount: null == correctCount
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int,
      inCorrectCount: null == inCorrectCount
          ? _value.inCorrectCount
          : inCorrectCount // ignore: cast_nullable_to_non_nullable
              as int,
      winCount: null == winCount
          ? _value.winCount
          : winCount // ignore: cast_nullable_to_non_nullable
              as int,
      loseCount: null == loseCount
          ? _value.loseCount
          : loseCount // ignore: cast_nullable_to_non_nullable
              as int,
      maxConsecutiveWins: null == maxConsecutiveWins
          ? _value.maxConsecutiveWins
          : maxConsecutiveWins // ignore: cast_nullable_to_non_nullable
              as int,
      consecutiveWins: null == consecutiveWins
          ? _value.consecutiveWins
          : consecutiveWins // ignore: cast_nullable_to_non_nullable
              as int,
      maxConsecutiveCorrects: null == maxConsecutiveCorrects
          ? _value.maxConsecutiveCorrects
          : maxConsecutiveCorrects // ignore: cast_nullable_to_non_nullable
              as int,
      consecutiveCorrects: null == consecutiveCorrects
          ? _value.consecutiveCorrects
          : consecutiveCorrects // ignore: cast_nullable_to_non_nullable
              as int,
      favoriteQuizIds: null == favoriteQuizIds
          ? _value.favoriteQuizIds
          : favoriteQuizIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastAnsweredQuizCreatedAt: null == lastAnsweredQuizCreatedAt
          ? _value.lastAnsweredQuizCreatedAt
          : lastAnsweredQuizCreatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppUserImplCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$AppUserImplCopyWith(
          _$AppUserImpl value, $Res Function(_$AppUserImpl) then) =
      __$$AppUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String authId,
      String displayId,
      String name,
      String iconUrl,
      String description,
      int exPoint,
      int correctCount,
      int inCorrectCount,
      int winCount,
      int loseCount,
      int maxConsecutiveWins,
      int consecutiveWins,
      int maxConsecutiveCorrects,
      int consecutiveCorrects,
      List<String> favoriteQuizIds,
      @DateTimeTimestampConverter() DateTime createdAt,
      @DateTimeTimestampConverter() DateTime updatedAt,
      @DateTimeTimestampConverter() DateTime lastAnsweredQuizCreatedAt});
}

/// @nodoc
class __$$AppUserImplCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$AppUserImpl>
    implements _$$AppUserImplCopyWith<$Res> {
  __$$AppUserImplCopyWithImpl(
      _$AppUserImpl _value, $Res Function(_$AppUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authId = null,
    Object? displayId = null,
    Object? name = null,
    Object? iconUrl = null,
    Object? description = null,
    Object? exPoint = null,
    Object? correctCount = null,
    Object? inCorrectCount = null,
    Object? winCount = null,
    Object? loseCount = null,
    Object? maxConsecutiveWins = null,
    Object? consecutiveWins = null,
    Object? maxConsecutiveCorrects = null,
    Object? consecutiveCorrects = null,
    Object? favoriteQuizIds = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? lastAnsweredQuizCreatedAt = null,
  }) {
    return _then(_$AppUserImpl(
      authId: null == authId
          ? _value.authId
          : authId // ignore: cast_nullable_to_non_nullable
              as String,
      displayId: null == displayId
          ? _value.displayId
          : displayId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      exPoint: null == exPoint
          ? _value.exPoint
          : exPoint // ignore: cast_nullable_to_non_nullable
              as int,
      correctCount: null == correctCount
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int,
      inCorrectCount: null == inCorrectCount
          ? _value.inCorrectCount
          : inCorrectCount // ignore: cast_nullable_to_non_nullable
              as int,
      winCount: null == winCount
          ? _value.winCount
          : winCount // ignore: cast_nullable_to_non_nullable
              as int,
      loseCount: null == loseCount
          ? _value.loseCount
          : loseCount // ignore: cast_nullable_to_non_nullable
              as int,
      maxConsecutiveWins: null == maxConsecutiveWins
          ? _value.maxConsecutiveWins
          : maxConsecutiveWins // ignore: cast_nullable_to_non_nullable
              as int,
      consecutiveWins: null == consecutiveWins
          ? _value.consecutiveWins
          : consecutiveWins // ignore: cast_nullable_to_non_nullable
              as int,
      maxConsecutiveCorrects: null == maxConsecutiveCorrects
          ? _value.maxConsecutiveCorrects
          : maxConsecutiveCorrects // ignore: cast_nullable_to_non_nullable
              as int,
      consecutiveCorrects: null == consecutiveCorrects
          ? _value.consecutiveCorrects
          : consecutiveCorrects // ignore: cast_nullable_to_non_nullable
              as int,
      favoriteQuizIds: null == favoriteQuizIds
          ? _value._favoriteQuizIds
          : favoriteQuizIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastAnsweredQuizCreatedAt: null == lastAnsweredQuizCreatedAt
          ? _value.lastAnsweredQuizCreatedAt
          : lastAnsweredQuizCreatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppUserImpl extends _AppUser with DiagnosticableTreeMixin {
  _$AppUserImpl(
      {required this.authId,
      required this.displayId,
      required this.name,
      this.iconUrl = defaultImageUrl,
      this.description = '',
      this.exPoint = 0,
      this.correctCount = 0,
      this.inCorrectCount = 0,
      this.winCount = 0,
      this.loseCount = 0,
      this.maxConsecutiveWins = 0,
      this.consecutiveWins = 0,
      this.maxConsecutiveCorrects = 0,
      this.consecutiveCorrects = 0,
      final List<String> favoriteQuizIds = const [],
      @DateTimeTimestampConverter() required this.createdAt,
      @DateTimeTimestampConverter() required this.updatedAt,
      @DateTimeTimestampConverter() required this.lastAnsweredQuizCreatedAt})
      : _favoriteQuizIds = favoriteQuizIds,
        super._();

  factory _$AppUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUserImplFromJson(json);

  @override
  final String authId;
  @override
  final String displayId;
  @override
  final String name;
  @override
  @JsonKey()
  final String iconUrl;
//TODO: デフォルトの画像URLを追加
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final int exPoint;
//合計経験値
  @override
  @JsonKey()
  final int correctCount;
  @override
  @JsonKey()
  final int inCorrectCount;
  @override
  @JsonKey()
  final int winCount;
  @override
  @JsonKey()
  final int loseCount;
  @override
  @JsonKey()
  final int maxConsecutiveWins;
//最大連勝数
  @override
  @JsonKey()
  final int consecutiveWins;
//現在の連勝数
  @override
  @JsonKey()
  final int maxConsecutiveCorrects;
//最大の連勝数
  @override
  @JsonKey()
  final int consecutiveCorrects;
//現在の連勝数
  final List<String> _favoriteQuizIds;
//現在の連勝数
  @override
  @JsonKey()
  List<String> get favoriteQuizIds {
    if (_favoriteQuizIds is EqualUnmodifiableListView) return _favoriteQuizIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteQuizIds);
  }

  @override
  @DateTimeTimestampConverter()
  final DateTime createdAt;
  @override
  @DateTimeTimestampConverter()
  final DateTime updatedAt;
  @override
  @DateTimeTimestampConverter()
  final DateTime lastAnsweredQuizCreatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppUser(authId: $authId, displayId: $displayId, name: $name, iconUrl: $iconUrl, description: $description, exPoint: $exPoint, correctCount: $correctCount, inCorrectCount: $inCorrectCount, winCount: $winCount, loseCount: $loseCount, maxConsecutiveWins: $maxConsecutiveWins, consecutiveWins: $consecutiveWins, maxConsecutiveCorrects: $maxConsecutiveCorrects, consecutiveCorrects: $consecutiveCorrects, favoriteQuizIds: $favoriteQuizIds, createdAt: $createdAt, updatedAt: $updatedAt, lastAnsweredQuizCreatedAt: $lastAnsweredQuizCreatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppUser'))
      ..add(DiagnosticsProperty('authId', authId))
      ..add(DiagnosticsProperty('displayId', displayId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('iconUrl', iconUrl))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('exPoint', exPoint))
      ..add(DiagnosticsProperty('correctCount', correctCount))
      ..add(DiagnosticsProperty('inCorrectCount', inCorrectCount))
      ..add(DiagnosticsProperty('winCount', winCount))
      ..add(DiagnosticsProperty('loseCount', loseCount))
      ..add(DiagnosticsProperty('maxConsecutiveWins', maxConsecutiveWins))
      ..add(DiagnosticsProperty('consecutiveWins', consecutiveWins))
      ..add(
          DiagnosticsProperty('maxConsecutiveCorrects', maxConsecutiveCorrects))
      ..add(DiagnosticsProperty('consecutiveCorrects', consecutiveCorrects))
      ..add(DiagnosticsProperty('favoriteQuizIds', favoriteQuizIds))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty(
          'lastAnsweredQuizCreatedAt', lastAnsweredQuizCreatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUserImpl &&
            (identical(other.authId, authId) || other.authId == authId) &&
            (identical(other.displayId, displayId) ||
                other.displayId == displayId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.exPoint, exPoint) || other.exPoint == exPoint) &&
            (identical(other.correctCount, correctCount) ||
                other.correctCount == correctCount) &&
            (identical(other.inCorrectCount, inCorrectCount) ||
                other.inCorrectCount == inCorrectCount) &&
            (identical(other.winCount, winCount) ||
                other.winCount == winCount) &&
            (identical(other.loseCount, loseCount) ||
                other.loseCount == loseCount) &&
            (identical(other.maxConsecutiveWins, maxConsecutiveWins) ||
                other.maxConsecutiveWins == maxConsecutiveWins) &&
            (identical(other.consecutiveWins, consecutiveWins) ||
                other.consecutiveWins == consecutiveWins) &&
            (identical(other.maxConsecutiveCorrects, maxConsecutiveCorrects) ||
                other.maxConsecutiveCorrects == maxConsecutiveCorrects) &&
            (identical(other.consecutiveCorrects, consecutiveCorrects) ||
                other.consecutiveCorrects == consecutiveCorrects) &&
            const DeepCollectionEquality()
                .equals(other._favoriteQuizIds, _favoriteQuizIds) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.lastAnsweredQuizCreatedAt,
                    lastAnsweredQuizCreatedAt) ||
                other.lastAnsweredQuizCreatedAt == lastAnsweredQuizCreatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      authId,
      displayId,
      name,
      iconUrl,
      description,
      exPoint,
      correctCount,
      inCorrectCount,
      winCount,
      loseCount,
      maxConsecutiveWins,
      consecutiveWins,
      maxConsecutiveCorrects,
      consecutiveCorrects,
      const DeepCollectionEquality().hash(_favoriteQuizIds),
      createdAt,
      updatedAt,
      lastAnsweredQuizCreatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      __$$AppUserImplCopyWithImpl<_$AppUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUserImplToJson(
      this,
    );
  }
}

abstract class _AppUser extends AppUser {
  factory _AppUser(
      {required final String authId,
      required final String displayId,
      required final String name,
      final String iconUrl,
      final String description,
      final int exPoint,
      final int correctCount,
      final int inCorrectCount,
      final int winCount,
      final int loseCount,
      final int maxConsecutiveWins,
      final int consecutiveWins,
      final int maxConsecutiveCorrects,
      final int consecutiveCorrects,
      final List<String> favoriteQuizIds,
      @DateTimeTimestampConverter() required final DateTime createdAt,
      @DateTimeTimestampConverter() required final DateTime updatedAt,
      @DateTimeTimestampConverter()
      required final DateTime lastAnsweredQuizCreatedAt}) = _$AppUserImpl;
  _AppUser._() : super._();

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$AppUserImpl.fromJson;

  @override
  String get authId;
  @override
  String get displayId;
  @override
  String get name;
  @override
  String get iconUrl;
  @override //TODO: デフォルトの画像URLを追加
  String get description;
  @override
  int get exPoint;
  @override //合計経験値
  int get correctCount;
  @override
  int get inCorrectCount;
  @override
  int get winCount;
  @override
  int get loseCount;
  @override
  int get maxConsecutiveWins;
  @override //最大連勝数
  int get consecutiveWins;
  @override //現在の連勝数
  int get maxConsecutiveCorrects;
  @override //最大の連勝数
  int get consecutiveCorrects;
  @override //現在の連勝数
  List<String> get favoriteQuizIds;
  @override
  @DateTimeTimestampConverter()
  DateTime get createdAt;
  @override
  @DateTimeTimestampConverter()
  DateTime get updatedAt;
  @override
  @DateTimeTimestampConverter()
  DateTime get lastAnsweredQuizCreatedAt;
  @override
  @JsonKey(ignore: true)
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
