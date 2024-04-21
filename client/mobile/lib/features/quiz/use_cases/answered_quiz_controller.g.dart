// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answered_quiz_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$answeredQuizCollectionPagingRepositoryHash() =>
    r'204219d363e0e288db3cfbee9a73a1b9fdeba791';

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

/// See also [answeredQuizCollectionPagingRepository].
@ProviderFor(answeredQuizCollectionPagingRepository)
const answeredQuizCollectionPagingRepositoryProvider =
    AnsweredQuizCollectionPagingRepositoryFamily();

/// See also [answeredQuizCollectionPagingRepository].
class AnsweredQuizCollectionPagingRepositoryFamily
    extends Family<CollectionPagingRepository<AnsweredQuiz>> {
  /// See also [answeredQuizCollectionPagingRepository].
  const AnsweredQuizCollectionPagingRepositoryFamily();

  /// See also [answeredQuizCollectionPagingRepository].
  AnsweredQuizCollectionPagingRepositoryProvider call(
    CollectionParam<AnsweredQuiz> query,
  ) {
    return AnsweredQuizCollectionPagingRepositoryProvider(
      query,
    );
  }

  @override
  AnsweredQuizCollectionPagingRepositoryProvider getProviderOverride(
    covariant AnsweredQuizCollectionPagingRepositoryProvider provider,
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
  String? get name => r'answeredQuizCollectionPagingRepositoryProvider';
}

/// See also [answeredQuizCollectionPagingRepository].
class AnsweredQuizCollectionPagingRepositoryProvider
    extends Provider<CollectionPagingRepository<AnsweredQuiz>> {
  /// See also [answeredQuizCollectionPagingRepository].
  AnsweredQuizCollectionPagingRepositoryProvider(
    CollectionParam<AnsweredQuiz> query,
  ) : this._internal(
          (ref) => answeredQuizCollectionPagingRepository(
            ref as AnsweredQuizCollectionPagingRepositoryRef,
            query,
          ),
          from: answeredQuizCollectionPagingRepositoryProvider,
          name: r'answeredQuizCollectionPagingRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$answeredQuizCollectionPagingRepositoryHash,
          dependencies:
              AnsweredQuizCollectionPagingRepositoryFamily._dependencies,
          allTransitiveDependencies:
              AnsweredQuizCollectionPagingRepositoryFamily
                  ._allTransitiveDependencies,
          query: query,
        );

  AnsweredQuizCollectionPagingRepositoryProvider._internal(
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
            AnsweredQuizCollectionPagingRepositoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AnsweredQuizCollectionPagingRepositoryProvider._internal(
        (ref) => create(ref as AnsweredQuizCollectionPagingRepositoryRef),
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
    return _AnsweredQuizCollectionPagingRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AnsweredQuizCollectionPagingRepositoryProvider &&
        other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AnsweredQuizCollectionPagingRepositoryRef
    on ProviderRef<CollectionPagingRepository<AnsweredQuiz>> {
  /// The parameter `query` of this provider.
  CollectionParam<AnsweredQuiz> get query;
}

class _AnsweredQuizCollectionPagingRepositoryProviderElement
    extends ProviderElement<CollectionPagingRepository<AnsweredQuiz>>
    with AnsweredQuizCollectionPagingRepositoryRef {
  _AnsweredQuizCollectionPagingRepositoryProviderElement(super.provider);

  @override
  CollectionParam<AnsweredQuiz> get query =>
      (origin as AnsweredQuizCollectionPagingRepositoryProvider).query;
}

String _$answeredQuizControllerHash() =>
    r'954f2ea820b071c280c78927c16b4f99dcf6f48e';

/// See also [AnsweredQuizController].
@ProviderFor(AnsweredQuizController)
final answeredQuizControllerProvider = AutoDisposeAsyncNotifierProvider<
    AnsweredQuizController, List<AnsweredQuiz>>.internal(
  AnsweredQuizController.new,
  name: r'answeredQuizControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$answeredQuizControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AnsweredQuizController = AutoDisposeAsyncNotifier<List<AnsweredQuiz>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
