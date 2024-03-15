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
  List<String> get answeredQuizIds => throw _privateConstructorUsedError;
  List<String> get correctQuizIds => throw _privateConstructorUsedError;
  List<String> get inCorrectQuizIds => throw _privateConstructorUsedError;
  List<String> get commentQuizIds => throw _privateConstructorUsedError;
  List<String> get favoriteQuizIds => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get updateAt => throw _privateConstructorUsedError;

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
      List<String> answeredQuizIds,
      List<String> correctQuizIds,
      List<String> inCorrectQuizIds,
      List<String> commentQuizIds,
      List<String> favoriteQuizIds,
      @DateTimeTimestampConverter() DateTime createdAt,
      @DateTimeTimestampConverter() DateTime updateAt});
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
    Object? answeredQuizIds = null,
    Object? correctQuizIds = null,
    Object? inCorrectQuizIds = null,
    Object? commentQuizIds = null,
    Object? favoriteQuizIds = null,
    Object? createdAt = null,
    Object? updateAt = null,
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
      answeredQuizIds: null == answeredQuizIds
          ? _value.answeredQuizIds
          : answeredQuizIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctQuizIds: null == correctQuizIds
          ? _value.correctQuizIds
          : correctQuizIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      inCorrectQuizIds: null == inCorrectQuizIds
          ? _value.inCorrectQuizIds
          : inCorrectQuizIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      commentQuizIds: null == commentQuizIds
          ? _value.commentQuizIds
          : commentQuizIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoriteQuizIds: null == favoriteQuizIds
          ? _value.favoriteQuizIds
          : favoriteQuizIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateAt: null == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
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
      List<String> answeredQuizIds,
      List<String> correctQuizIds,
      List<String> inCorrectQuizIds,
      List<String> commentQuizIds,
      List<String> favoriteQuizIds,
      @DateTimeTimestampConverter() DateTime createdAt,
      @DateTimeTimestampConverter() DateTime updateAt});
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
    Object? answeredQuizIds = null,
    Object? correctQuizIds = null,
    Object? inCorrectQuizIds = null,
    Object? commentQuizIds = null,
    Object? favoriteQuizIds = null,
    Object? createdAt = null,
    Object? updateAt = null,
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
      answeredQuizIds: null == answeredQuizIds
          ? _value._answeredQuizIds
          : answeredQuizIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctQuizIds: null == correctQuizIds
          ? _value._correctQuizIds
          : correctQuizIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      inCorrectQuizIds: null == inCorrectQuizIds
          ? _value._inCorrectQuizIds
          : inCorrectQuizIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      commentQuizIds: null == commentQuizIds
          ? _value._commentQuizIds
          : commentQuizIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoriteQuizIds: null == favoriteQuizIds
          ? _value._favoriteQuizIds
          : favoriteQuizIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateAt: null == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
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
      final List<String> answeredQuizIds = const [],
      final List<String> correctQuizIds = const [],
      final List<String> inCorrectQuizIds = const [],
      final List<String> commentQuizIds = const [],
      final List<String> favoriteQuizIds = const [],
      @DateTimeTimestampConverter() required this.createdAt,
      @DateTimeTimestampConverter() required this.updateAt})
      : _answeredQuizIds = answeredQuizIds,
        _correctQuizIds = correctQuizIds,
        _inCorrectQuizIds = inCorrectQuizIds,
        _commentQuizIds = commentQuizIds,
        _favoriteQuizIds = favoriteQuizIds,
        super._();

  factory _$AppUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUserImplFromJson(json);

  @override
  final String authId;
  @override
  final String displayId;
  @override
  final String name;
  final List<String> _answeredQuizIds;
  @override
  @JsonKey()
  List<String> get answeredQuizIds {
    if (_answeredQuizIds is EqualUnmodifiableListView) return _answeredQuizIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answeredQuizIds);
  }

  final List<String> _correctQuizIds;
  @override
  @JsonKey()
  List<String> get correctQuizIds {
    if (_correctQuizIds is EqualUnmodifiableListView) return _correctQuizIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_correctQuizIds);
  }

  final List<String> _inCorrectQuizIds;
  @override
  @JsonKey()
  List<String> get inCorrectQuizIds {
    if (_inCorrectQuizIds is EqualUnmodifiableListView)
      return _inCorrectQuizIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inCorrectQuizIds);
  }

  final List<String> _commentQuizIds;
  @override
  @JsonKey()
  List<String> get commentQuizIds {
    if (_commentQuizIds is EqualUnmodifiableListView) return _commentQuizIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commentQuizIds);
  }

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
  final DateTime createdAt;
  @override
  @DateTimeTimestampConverter()
  final DateTime updateAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppUser(authId: $authId, displayId: $displayId, name: $name, answeredQuizIds: $answeredQuizIds, correctQuizIds: $correctQuizIds, inCorrectQuizIds: $inCorrectQuizIds, commentQuizIds: $commentQuizIds, favoriteQuizIds: $favoriteQuizIds, createdAt: $createdAt, updateAt: $updateAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppUser'))
      ..add(DiagnosticsProperty('authId', authId))
      ..add(DiagnosticsProperty('displayId', displayId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('answeredQuizIds', answeredQuizIds))
      ..add(DiagnosticsProperty('correctQuizIds', correctQuizIds))
      ..add(DiagnosticsProperty('inCorrectQuizIds', inCorrectQuizIds))
      ..add(DiagnosticsProperty('commentQuizIds', commentQuizIds))
      ..add(DiagnosticsProperty('favoriteQuizIds', favoriteQuizIds))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updateAt', updateAt));
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
            const DeepCollectionEquality()
                .equals(other._answeredQuizIds, _answeredQuizIds) &&
            const DeepCollectionEquality()
                .equals(other._correctQuizIds, _correctQuizIds) &&
            const DeepCollectionEquality()
                .equals(other._inCorrectQuizIds, _inCorrectQuizIds) &&
            const DeepCollectionEquality()
                .equals(other._commentQuizIds, _commentQuizIds) &&
            const DeepCollectionEquality()
                .equals(other._favoriteQuizIds, _favoriteQuizIds) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      authId,
      displayId,
      name,
      const DeepCollectionEquality().hash(_answeredQuizIds),
      const DeepCollectionEquality().hash(_correctQuizIds),
      const DeepCollectionEquality().hash(_inCorrectQuizIds),
      const DeepCollectionEquality().hash(_commentQuizIds),
      const DeepCollectionEquality().hash(_favoriteQuizIds),
      createdAt,
      updateAt);

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
          final List<String> answeredQuizIds,
          final List<String> correctQuizIds,
          final List<String> inCorrectQuizIds,
          final List<String> commentQuizIds,
          final List<String> favoriteQuizIds,
          @DateTimeTimestampConverter() required final DateTime createdAt,
          @DateTimeTimestampConverter() required final DateTime updateAt}) =
      _$AppUserImpl;
  _AppUser._() : super._();

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$AppUserImpl.fromJson;

  @override
  String get authId;
  @override
  String get displayId;
  @override
  String get name;
  @override
  List<String> get answeredQuizIds;
  @override
  List<String> get correctQuizIds;
  @override
  List<String> get inCorrectQuizIds;
  @override
  List<String> get commentQuizIds;
  @override
  List<String> get favoriteQuizIds;
  @override
  @DateTimeTimestampConverter()
  DateTime get createdAt;
  @override
  @DateTimeTimestampConverter()
  DateTime get updateAt;
  @override
  @JsonKey(ignore: true)
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
