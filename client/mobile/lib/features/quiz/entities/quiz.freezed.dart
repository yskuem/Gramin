// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return _Quiz.fromJson(json);
}

/// @nodoc
mixin _$Quiz {
  @JsonKey(name: 'quiz_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'create_user_id')
  String get createUserId => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  List<String> get choices => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  String get translation => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  List<String> get commentIds => throw _privateConstructorUsedError;
  List<String> get answeredUserIds => throw _privateConstructorUsedError;
  List<int> get countAnswers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizCopyWith<Quiz> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizCopyWith<$Res> {
  factory $QuizCopyWith(Quiz value, $Res Function(Quiz) then) =
      _$QuizCopyWithImpl<$Res, Quiz>;
  @useResult
  $Res call(
      {@JsonKey(name: 'quiz_id') String id,
      @JsonKey(name: 'create_user_id') String createUserId,
      String question,
      List<String> choices,
      String answer,
      String translation,
      String explanation,
      String category,
      @DateTimeTimestampConverter() DateTime? createdAt,
      @DateTimeTimestampConverter() DateTime? updatedAt,
      List<String> commentIds,
      List<String> answeredUserIds,
      List<int> countAnswers});
}

/// @nodoc
class _$QuizCopyWithImpl<$Res, $Val extends Quiz>
    implements $QuizCopyWith<$Res> {
  _$QuizCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createUserId = null,
    Object? question = null,
    Object? choices = null,
    Object? answer = null,
    Object? translation = null,
    Object? explanation = null,
    Object? category = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? commentIds = null,
    Object? answeredUserIds = null,
    Object? countAnswers = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createUserId: null == createUserId
          ? _value.createUserId
          : createUserId // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      translation: null == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      commentIds: null == commentIds
          ? _value.commentIds
          : commentIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answeredUserIds: null == answeredUserIds
          ? _value.answeredUserIds
          : answeredUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      countAnswers: null == countAnswers
          ? _value.countAnswers
          : countAnswers // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizImplCopyWith<$Res> implements $QuizCopyWith<$Res> {
  factory _$$QuizImplCopyWith(
          _$QuizImpl value, $Res Function(_$QuizImpl) then) =
      __$$QuizImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'quiz_id') String id,
      @JsonKey(name: 'create_user_id') String createUserId,
      String question,
      List<String> choices,
      String answer,
      String translation,
      String explanation,
      String category,
      @DateTimeTimestampConverter() DateTime? createdAt,
      @DateTimeTimestampConverter() DateTime? updatedAt,
      List<String> commentIds,
      List<String> answeredUserIds,
      List<int> countAnswers});
}

/// @nodoc
class __$$QuizImplCopyWithImpl<$Res>
    extends _$QuizCopyWithImpl<$Res, _$QuizImpl>
    implements _$$QuizImplCopyWith<$Res> {
  __$$QuizImplCopyWithImpl(_$QuizImpl _value, $Res Function(_$QuizImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createUserId = null,
    Object? question = null,
    Object? choices = null,
    Object? answer = null,
    Object? translation = null,
    Object? explanation = null,
    Object? category = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? commentIds = null,
    Object? answeredUserIds = null,
    Object? countAnswers = null,
  }) {
    return _then(_$QuizImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createUserId: null == createUserId
          ? _value.createUserId
          : createUserId // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      translation: null == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      commentIds: null == commentIds
          ? _value._commentIds
          : commentIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answeredUserIds: null == answeredUserIds
          ? _value._answeredUserIds
          : answeredUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      countAnswers: null == countAnswers
          ? _value._countAnswers
          : countAnswers // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizImpl extends _Quiz {
  _$QuizImpl(
      {@JsonKey(name: 'quiz_id') required this.id,
      @JsonKey(name: 'create_user_id') required this.createUserId,
      required this.question,
      required final List<String> choices,
      required this.answer,
      required this.translation,
      required this.explanation,
      required this.category,
      @DateTimeTimestampConverter() this.createdAt,
      @DateTimeTimestampConverter() this.updatedAt,
      final List<String> commentIds = const [],
      final List<String> answeredUserIds = const [],
      final List<int> countAnswers = const [0, 0, 0, 0]})
      : _choices = choices,
        _commentIds = commentIds,
        _answeredUserIds = answeredUserIds,
        _countAnswers = countAnswers,
        super._();

  factory _$QuizImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizImplFromJson(json);

  @override
  @JsonKey(name: 'quiz_id')
  final String id;
  @override
  @JsonKey(name: 'create_user_id')
  final String createUserId;
  @override
  final String question;
  final List<String> _choices;
  @override
  List<String> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  final String answer;
  @override
  final String translation;
  @override
  final String explanation;
  @override
  final String category;
  @override
  @DateTimeTimestampConverter()
  final DateTime? createdAt;
  @override
  @DateTimeTimestampConverter()
  final DateTime? updatedAt;
  final List<String> _commentIds;
  @override
  @JsonKey()
  List<String> get commentIds {
    if (_commentIds is EqualUnmodifiableListView) return _commentIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commentIds);
  }

  final List<String> _answeredUserIds;
  @override
  @JsonKey()
  List<String> get answeredUserIds {
    if (_answeredUserIds is EqualUnmodifiableListView) return _answeredUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answeredUserIds);
  }

  final List<int> _countAnswers;
  @override
  @JsonKey()
  List<int> get countAnswers {
    if (_countAnswers is EqualUnmodifiableListView) return _countAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countAnswers);
  }

  @override
  String toString() {
    return 'Quiz(id: $id, createUserId: $createUserId, question: $question, choices: $choices, answer: $answer, translation: $translation, explanation: $explanation, category: $category, createdAt: $createdAt, updatedAt: $updatedAt, commentIds: $commentIds, answeredUserIds: $answeredUserIds, countAnswers: $countAnswers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createUserId, createUserId) ||
                other.createUserId == createUserId) &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.translation, translation) ||
                other.translation == translation) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._commentIds, _commentIds) &&
            const DeepCollectionEquality()
                .equals(other._answeredUserIds, _answeredUserIds) &&
            const DeepCollectionEquality()
                .equals(other._countAnswers, _countAnswers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createUserId,
      question,
      const DeepCollectionEquality().hash(_choices),
      answer,
      translation,
      explanation,
      category,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_commentIds),
      const DeepCollectionEquality().hash(_answeredUserIds),
      const DeepCollectionEquality().hash(_countAnswers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizImplCopyWith<_$QuizImpl> get copyWith =>
      __$$QuizImplCopyWithImpl<_$QuizImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizImplToJson(
      this,
    );
  }
}

abstract class _Quiz extends Quiz {
  factory _Quiz(
      {@JsonKey(name: 'quiz_id') required final String id,
      @JsonKey(name: 'create_user_id') required final String createUserId,
      required final String question,
      required final List<String> choices,
      required final String answer,
      required final String translation,
      required final String explanation,
      required final String category,
      @DateTimeTimestampConverter() final DateTime? createdAt,
      @DateTimeTimestampConverter() final DateTime? updatedAt,
      final List<String> commentIds,
      final List<String> answeredUserIds,
      final List<int> countAnswers}) = _$QuizImpl;
  _Quiz._() : super._();

  factory _Quiz.fromJson(Map<String, dynamic> json) = _$QuizImpl.fromJson;

  @override
  @JsonKey(name: 'quiz_id')
  String get id;
  @override
  @JsonKey(name: 'create_user_id')
  String get createUserId;
  @override
  String get question;
  @override
  List<String> get choices;
  @override
  String get answer;
  @override
  String get translation;
  @override
  String get explanation;
  @override
  String get category;
  @override
  @DateTimeTimestampConverter()
  DateTime? get createdAt;
  @override
  @DateTimeTimestampConverter()
  DateTime? get updatedAt;
  @override
  List<String> get commentIds;
  @override
  List<String> get answeredUserIds;
  @override
  List<int> get countAnswers;
  @override
  @JsonKey(ignore: true)
  _$$QuizImplCopyWith<_$QuizImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
