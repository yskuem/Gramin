// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answered_quiz_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$quizCollectionPagingRepositoryHash() =>
    r'e636589221db18050707c88cb5aecbbfebc4f533';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [quizCollectionPagingRepository].
@ProviderFor(quizCollectionPagingRepository)
const quizCollectionPagingRepositoryProvider =
    QuizCollectionPagingRepositoryFamily();

/// See also [quizCollectionPagingRepository].
class QuizCollectionPagingRepositoryFamily
    extends Family<CollectionPagingRepository<AnsweredQuiz>> {
  /// See also [quizCollectionPagingRepository].
  const QuizCollectionPagingRepositoryFamily();

  /// See also [quizCollectionPagingRepository].
  QuizCollectionPagingRepositoryProvider call(
    CollectionParam<AnsweredQuiz> query,
  ) {
    return QuizCollectionPagingRepositoryProvider(
      query,
    );
  }

  @override
  QuizCollectionPagingRepositoryProvider getProviderOverride(
    covariant QuizCollectionPagingRepositoryProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'quizCollectionPagingRepositoryProvider';
}

/// See also [quizCollectionPagingRepository].
class QuizCollectionPagingRepositoryProvider
    extends Provider<CollectionPagingRepository<AnsweredQuiz>> {
  /// See also [quizCollectionPagingRepository].
  QuizCollectionPagingRepositoryProvider(
    CollectionParam<AnsweredQuiz> query,
  ) : this._internal(
          (ref) => quizCollectionPagingRepository(
            ref as QuizCollectionPagingRepositoryRef,
            query,
          ),
          from: quizCollectionPagingRepositoryProvider,
          name: r'quizCollectionPagingRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$quizCollectionPagingRepositoryHash,
          dependencies: QuizCollectionPagingRepositoryFamily._dependencies,
          allTransitiveDependencies:
              QuizCollectionPagingRepositoryFamily._allTransitiveDependencies,
          query: query,
        );

  QuizCollectionPagingRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final CollectionParam<AnsweredQuiz> query;

  @override
  Override overrideWith(
    CollectionPagingRepository<AnsweredQuiz> Function(
            QuizCollectionPagingRepositoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: QuizCollectionPagingRepositoryProvider._internal(
        (ref) => create(ref as QuizCollectionPagingRepositoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  ProviderElement<CollectionPagingRepository<AnsweredQuiz>> createElement() {
    return _QuizCollectionPagingRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuizCollectionPagingRepositoryProvider &&
        other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QuizCollectionPagingRepositoryRef
    on ProviderRef<CollectionPagingRepository<AnsweredQuiz>> {
  /// The parameter `query` of this provider.
  CollectionParam<AnsweredQuiz> get query;
}

class _QuizCollectionPagingRepositoryProviderElement
    extends ProviderElement<CollectionPagingRepository<AnsweredQuiz>>
    with QuizCollectionPagingRepositoryRef {
  _QuizCollectionPagingRepositoryProviderElement(super.provider);

  @override
  CollectionParam<AnsweredQuiz> get query =>
      (origin as QuizCollectionPagingRepositoryProvider).query;
}

String _$answeredQuizControllerHash() =>
    r'ef34102ec9f386711b26f9618e1d5ee38dcd2f07';

abstract class _$AnsweredQuizController
    extends BuildlessAutoDisposeAsyncNotifier<List<AnsweredQuiz>> {
  late final String userId;

  FutureOr<List<AnsweredQuiz>> build(
    String userId,
  );
}

/// See also [AnsweredQuizController].
@ProviderFor(AnsweredQuizController)
const answeredQuizControllerProvider = AnsweredQuizControllerFamily();

/// See also [AnsweredQuizController].
class AnsweredQuizControllerFamily
    extends Family<AsyncValue<List<AnsweredQuiz>>> {
  /// See also [AnsweredQuizController].
  const AnsweredQuizControllerFamily();

  /// See also [AnsweredQuizController].
  AnsweredQuizControllerProvider call(
    String userId,
  ) {
    return AnsweredQuizControllerProvider(
      userId,
    );
  }

  @override
  AnsweredQuizControllerProvider getProviderOverride(
    covariant AnsweredQuizControllerProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'answeredQuizControllerProvider';
}

/// See also [AnsweredQuizController].
class AnsweredQuizControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AnsweredQuizController,
        List<AnsweredQuiz>> {
  /// See also [AnsweredQuizController].
  AnsweredQuizControllerProvider(
    String userId,
  ) : this._internal(
          () => AnsweredQuizController()..userId = userId,
          from: answeredQuizControllerProvider,
          name: r'answeredQuizControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$answeredQuizControllerHash,
          dependencies: AnsweredQuizControllerFamily._dependencies,
          allTransitiveDependencies:
              AnsweredQuizControllerFamily._allTransitiveDependencies,
          userId: userId,
        );

  AnsweredQuizControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  FutureOr<List<AnsweredQuiz>> runNotifierBuild(
    covariant AnsweredQuizController notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(AnsweredQuizController Function() create) {
    return ProviderOverride(
      origin: this,
      override: AnsweredQuizControllerProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AnsweredQuizController,
      List<AnsweredQuiz>> createElement() {
    return _AnsweredQuizControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AnsweredQuizControllerProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AnsweredQuizControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<AnsweredQuiz>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _AnsweredQuizControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AnsweredQuizController,
        List<AnsweredQuiz>> with AnsweredQuizControllerRef {
  _AnsweredQuizControllerProviderElement(super.provider);

  @override
  String get userId => (origin as AnsweredQuizControllerProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
