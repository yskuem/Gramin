// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$quizCollectionPagingRepositoryHash() =>
    r'0fe160f0a363945efc13a4d0a56322c6c8caaf60';

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
    extends Family<CollectionPagingRepository<Quiz>> {
  /// See also [quizCollectionPagingRepository].
  const QuizCollectionPagingRepositoryFamily();

  /// See also [quizCollectionPagingRepository].
  QuizCollectionPagingRepositoryProvider call(
    CollectionParam<Quiz> query,
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
    extends Provider<CollectionPagingRepository<Quiz>> {
  /// See also [quizCollectionPagingRepository].
  QuizCollectionPagingRepositoryProvider(
    CollectionParam<Quiz> query,
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

  final CollectionParam<Quiz> query;

  @override
  Override overrideWith(
    CollectionPagingRepository<Quiz> Function(
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
  ProviderElement<CollectionPagingRepository<Quiz>> createElement() {
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
    on ProviderRef<CollectionPagingRepository<Quiz>> {
  /// The parameter `query` of this provider.
  CollectionParam<Quiz> get query;
}

class _QuizCollectionPagingRepositoryProviderElement
    extends ProviderElement<CollectionPagingRepository<Quiz>>
    with QuizCollectionPagingRepositoryRef {
  _QuizCollectionPagingRepositoryProviderElement(super.provider);

  @override
  CollectionParam<Quiz> get query =>
      (origin as QuizCollectionPagingRepositoryProvider).query;
}

String _$quizControllerHash() => r'41f133512aa692258536334fbfb6b3b6c9c9563b';

/// See also [QuizController].
@ProviderFor(QuizController)
final quizControllerProvider =
    AutoDisposeAsyncNotifierProvider<QuizController, List<Quiz>>.internal(
  QuizController.new,
  name: r'quizControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$quizControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$QuizController = AutoDisposeAsyncNotifier<List<Quiz>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
