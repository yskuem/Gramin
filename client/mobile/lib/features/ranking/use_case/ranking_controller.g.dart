// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rankingUserCollectionPagingRepositoryHash() =>
    r'12c30c6effb1d7f6b6cc1082f1ed153425a1507a';

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

/// See also [rankingUserCollectionPagingRepository].
@ProviderFor(rankingUserCollectionPagingRepository)
const rankingUserCollectionPagingRepositoryProvider =
    RankingUserCollectionPagingRepositoryFamily();

/// See also [rankingUserCollectionPagingRepository].
class RankingUserCollectionPagingRepositoryFamily
    extends Family<CollectionPagingRepository<AppUser>> {
  /// See also [rankingUserCollectionPagingRepository].
  const RankingUserCollectionPagingRepositoryFamily();

  /// See also [rankingUserCollectionPagingRepository].
  RankingUserCollectionPagingRepositoryProvider call(
    CollectionParam<AppUser> query,
  ) {
    return RankingUserCollectionPagingRepositoryProvider(
      query,
    );
  }

  @override
  RankingUserCollectionPagingRepositoryProvider getProviderOverride(
    covariant RankingUserCollectionPagingRepositoryProvider provider,
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
  String? get name => r'rankingUserCollectionPagingRepositoryProvider';
}

/// See also [rankingUserCollectionPagingRepository].
class RankingUserCollectionPagingRepositoryProvider
    extends Provider<CollectionPagingRepository<AppUser>> {
  /// See also [rankingUserCollectionPagingRepository].
  RankingUserCollectionPagingRepositoryProvider(
    CollectionParam<AppUser> query,
  ) : this._internal(
          (ref) => rankingUserCollectionPagingRepository(
            ref as RankingUserCollectionPagingRepositoryRef,
            query,
          ),
          from: rankingUserCollectionPagingRepositoryProvider,
          name: r'rankingUserCollectionPagingRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$rankingUserCollectionPagingRepositoryHash,
          dependencies:
              RankingUserCollectionPagingRepositoryFamily._dependencies,
          allTransitiveDependencies: RankingUserCollectionPagingRepositoryFamily
              ._allTransitiveDependencies,
          query: query,
        );

  RankingUserCollectionPagingRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final CollectionParam<AppUser> query;

  @override
  Override overrideWith(
    CollectionPagingRepository<AppUser> Function(
            RankingUserCollectionPagingRepositoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RankingUserCollectionPagingRepositoryProvider._internal(
        (ref) => create(ref as RankingUserCollectionPagingRepositoryRef),
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
  ProviderElement<CollectionPagingRepository<AppUser>> createElement() {
    return _RankingUserCollectionPagingRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RankingUserCollectionPagingRepositoryProvider &&
        other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RankingUserCollectionPagingRepositoryRef
    on ProviderRef<CollectionPagingRepository<AppUser>> {
  /// The parameter `query` of this provider.
  CollectionParam<AppUser> get query;
}

class _RankingUserCollectionPagingRepositoryProviderElement
    extends ProviderElement<CollectionPagingRepository<AppUser>>
    with RankingUserCollectionPagingRepositoryRef {
  _RankingUserCollectionPagingRepositoryProviderElement(super.provider);

  @override
  CollectionParam<AppUser> get query =>
      (origin as RankingUserCollectionPagingRepositoryProvider).query;
}

String _$rankingUserControllerHash() =>
    r'cfa976c49084a3c2d2cb19dee5bd92e6591797a5';

/// See also [RankingUserController].
@ProviderFor(RankingUserController)
final rankingUserControllerProvider = AutoDisposeAsyncNotifierProvider<
    RankingUserController, List<AppUser>>.internal(
  RankingUserController.new,
  name: r'rankingUserControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rankingUserControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RankingUserController = AutoDisposeAsyncNotifier<List<AppUser>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
