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
  int get correctCount => throw _privateConstructorUsedError;
  int get inCorrectCount => throw _privateConstructorUsedError;
  int get winCount => throw _privateConstructorUsedError;
  int get loseCount => throw _privateConstructorUsedError;
  List<String> get favoriteQuizIds => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime? get lastAnsweredQuizCreatedAt => throw _privateConstructorUsedError;

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
      int correctCount,
      int inCorrectCount,
      int winCount,
      int loseCount,
      List<String> favoriteQuizIds,
      @DateTimeTimestampConverter() DateTime? createdAt,
      @DateTimeTimestampConverter() DateTime? updatedAt,
      @DateTimeTimestampConverter() DateTime? lastAnsweredQuizCreatedAt});
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
    Object? correctCount = null,
    Object? inCorrectCount = null,
    Object? winCount = null,
    Object? loseCount = null,
    Object? favoriteQuizIds = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? lastAnsweredQuizCreatedAt = freezed,
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
      favoriteQuizIds: null == favoriteQuizIds
          ? _value.favoriteQuizIds
          : favoriteQuizIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastAnsweredQuizCreatedAt: freezed == lastAnsweredQuizCreatedAt
          ? _value.lastAnsweredQuizCreatedAt
          : lastAnsweredQuizCreatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      int correctCount,
      int inCorrectCount,
      int winCount,
      int loseCount,
      List<String> favoriteQuizIds,
      @DateTimeTimestampConverter() DateTime? createdAt,
      @DateTimeTimestampConverter() DateTime? updatedAt,
      @DateTimeTimestampConverter() DateTime? lastAnsweredQuizCreatedAt});
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
    Object? correctCount = null,
    Object? inCorrectCount = null,
    Object? winCount = null,
    Object? loseCount = null,
    Object? favoriteQuizIds = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? lastAnsweredQuizCreatedAt = freezed,
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
      favoriteQuizIds: null == favoriteQuizIds
          ? _value._favoriteQuizIds
          : favoriteQuizIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastAnsweredQuizCreatedAt: freezed == lastAnsweredQuizCreatedAt
          ? _value.lastAnsweredQuizCreatedAt
          : lastAnsweredQuizCreatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      this.correctCount = 0,
      this.inCorrectCount = 0,
      this.winCount = 0,
      this.loseCount = 0,
      final List<String> favoriteQuizIds = const [],
      @DateTimeTimestampConverter() this.createdAt,
      @DateTimeTimestampConverter() this.updatedAt,
      @DateTimeTimestampConverter() this.lastAnsweredQuizCreatedAt})
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
  final List<String> _favoriteQuizIds;
  @override
  @JsonKey()
  List<String> get favoriteQuizIds {
    if (_favoriteQuizIds is EqualUnmodifiableListView) return _favoriteQuizIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteQuizIds);
  }

  @override
  @DateTimeTimestampConverter()
  final DateTime? createdAt;
  @override
  @DateTimeTimestampConverter()
  final DateTime? updatedAt;
  @override
  @DateTimeTimestampConverter()
  final DateTime? lastAnsweredQuizCreatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppUser(authId: $authId, displayId: $displayId, name: $name, correctCount: $correctCount, inCorrectCount: $inCorrectCount, winCount: $winCount, loseCount: $loseCount, favoriteQuizIds: $favoriteQuizIds, createdAt: $createdAt, updatedAt: $updatedAt, lastAnsweredQuizCreatedAt: $lastAnsweredQuizCreatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppUser'))
      ..add(DiagnosticsProperty('authId', authId))
      ..add(DiagnosticsProperty('displayId', displayId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('correctCount', correctCount))
      ..add(DiagnosticsProperty('inCorrectCount', inCorrectCount))
      ..add(DiagnosticsProperty('winCount', winCount))
      ..add(DiagnosticsProperty('loseCount', loseCount))
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
            (identical(other.correctCount, correctCount) ||
                other.correctCount == correctCount) &&
            (identical(other.inCorrectCount, inCorrectCount) ||
                other.inCorrectCount == inCorrectCount) &&
            (identical(other.winCount, winCount) ||
                other.winCount == winCount) &&
            (identical(other.loseCount, loseCount) ||
                other.loseCount == loseCount) &&
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
      correctCount,
      inCorrectCount,
      winCount,
      loseCount,
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
      final int correctCount,
      final int inCorrectCount,
      final int winCount,
      final int loseCount,
      final List<String> favoriteQuizIds,
      @DateTimeTimestampConverter() final DateTime? createdAt,
      @DateTimeTimestampConverter() final DateTime? updatedAt,
      @DateTimeTimestampConverter()
      final DateTime? lastAnsweredQuizCreatedAt}) = _$AppUserImpl;
  _AppUser._() : super._();

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$AppUserImpl.fromJson;

  @override
  String get authId;
  @override
  String get displayId;
  @override
  String get name;
  @override
  int get correctCount;
  @override
  int get inCorrectCount;
  @override
  int get winCount;
  @override
  int get loseCount;
  @override
  List<String> get favoriteQuizIds;
  @override
  @DateTimeTimestampConverter()
  DateTime? get createdAt;
  @override
  @DateTimeTimestampConverter()
  DateTime? get updatedAt;
  @override
  @DateTimeTimestampConverter()
  DateTime? get lastAnsweredQuizCreatedAt;
  @override
  @JsonKey(ignore: true)
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
