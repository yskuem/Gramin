// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answered_quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnsweredQuiz _$AnsweredQuizFromJson(Map<String, dynamic> json) {
  return _AnsweredQuiz.fromJson(json);
}

/// @nodoc
mixin _$AnsweredQuiz {
  String get quizId => throw _privateConstructorUsedError;
  int get userSelectIndex => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnsweredQuizCopyWith<AnsweredQuiz> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnsweredQuizCopyWith<$Res> {
  factory $AnsweredQuizCopyWith(
          AnsweredQuiz value, $Res Function(AnsweredQuiz) then) =
      _$AnsweredQuizCopyWithImpl<$Res, AnsweredQuiz>;
  @useResult
  $Res call(
      {String quizId,
      int userSelectIndex,
      @DateTimeTimestampConverter() DateTime? createdAt,
      @DateTimeTimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$AnsweredQuizCopyWithImpl<$Res, $Val extends AnsweredQuiz>
    implements $AnsweredQuizCopyWith<$Res> {
  _$AnsweredQuizCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizId = null,
    Object? userSelectIndex = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      userSelectIndex: null == userSelectIndex
          ? _value.userSelectIndex
          : userSelectIndex // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnsweredQuizImplCopyWith<$Res>
    implements $AnsweredQuizCopyWith<$Res> {
  factory _$$AnsweredQuizImplCopyWith(
          _$AnsweredQuizImpl value, $Res Function(_$AnsweredQuizImpl) then) =
      __$$AnsweredQuizImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String quizId,
      int userSelectIndex,
      @DateTimeTimestampConverter() DateTime? createdAt,
      @DateTimeTimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$AnsweredQuizImplCopyWithImpl<$Res>
    extends _$AnsweredQuizCopyWithImpl<$Res, _$AnsweredQuizImpl>
    implements _$$AnsweredQuizImplCopyWith<$Res> {
  __$$AnsweredQuizImplCopyWithImpl(
      _$AnsweredQuizImpl _value, $Res Function(_$AnsweredQuizImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizId = null,
    Object? userSelectIndex = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$AnsweredQuizImpl(
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      userSelectIndex: null == userSelectIndex
          ? _value.userSelectIndex
          : userSelectIndex // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnsweredQuizImpl extends _AnsweredQuiz {
  const _$AnsweredQuizImpl(
      {required this.quizId,
      required this.userSelectIndex,
      @DateTimeTimestampConverter() this.createdAt,
      @DateTimeTimestampConverter() this.updatedAt})
      : super._();

  factory _$AnsweredQuizImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnsweredQuizImplFromJson(json);

  @override
  final String quizId;
  @override
  final int userSelectIndex;
  @override
  @DateTimeTimestampConverter()
  final DateTime? createdAt;
  @override
  @DateTimeTimestampConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'AnsweredQuiz(quizId: $quizId, userSelectIndex: $userSelectIndex, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnsweredQuizImpl &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.userSelectIndex, userSelectIndex) ||
                other.userSelectIndex == userSelectIndex) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, quizId, userSelectIndex, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnsweredQuizImplCopyWith<_$AnsweredQuizImpl> get copyWith =>
      __$$AnsweredQuizImplCopyWithImpl<_$AnsweredQuizImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnsweredQuizImplToJson(
      this,
    );
  }
}

abstract class _AnsweredQuiz extends AnsweredQuiz {
  const factory _AnsweredQuiz(
          {required final String quizId,
          required final int userSelectIndex,
          @DateTimeTimestampConverter() final DateTime? createdAt,
          @DateTimeTimestampConverter() final DateTime? updatedAt}) =
      _$AnsweredQuizImpl;
  const _AnsweredQuiz._() : super._();

  factory _AnsweredQuiz.fromJson(Map<String, dynamic> json) =
      _$AnsweredQuizImpl.fromJson;

  @override
  String get quizId;
  @override
  int get userSelectIndex;
  @override
  @DateTimeTimestampConverter()
  DateTime? get createdAt;
  @override
  @DateTimeTimestampConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$AnsweredQuizImplCopyWith<_$AnsweredQuizImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
