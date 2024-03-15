// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appUserCollectionPagingRepositoryHash() =>
    r'ab6f909b6b0cde73e2ea8ea626ffe9dabec7cdfa';

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

/// See also [appUserCollectionPagingRepository].
@ProviderFor(appUserCollectionPagingRepository)
const appUserCollectionPagingRepositoryProvider =
    AppUserCollectionPagingRepositoryFamily();

/// See also [appUserCollectionPagingRepository].
class AppUserCollectionPagingRepositoryFamily
    extends Family<CollectionPagingRepository<AppUser>> {
  /// See also [appUserCollectionPagingRepository].
  const AppUserCollectionPagingRepositoryFamily();

  /// See also [appUserCollectionPagingRepository].
  AppUserCollectionPagingRepositoryProvider call(
    CollectionParam<AppUser> query,
  ) {
    return AppUserCollectionPagingRepositoryProvider(
      query,
    );
  }

  @override
  AppUserCollectionPagingRepositoryProvider getProviderOverride(
    covariant AppUserCollectionPagingRepositoryProvider provider,
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
  String? get name => r'appUserCollectionPagingRepositoryProvider';
}

/// See also [appUserCollectionPagingRepository].
class AppUserCollectionPagingRepositoryProvider
    extends AutoDisposeProvider<CollectionPagingRepository<AppUser>> {
  /// See also [appUserCollectionPagingRepository].
  AppUserCollectionPagingRepositoryProvider(
    CollectionParam<AppUser> query,
  ) : this._internal(
          (ref) => appUserCollectionPagingRepository(
            ref as AppUserCollectionPagingRepositoryRef,
            query,
          ),
          from: appUserCollectionPagingRepositoryProvider,
          name: r'appUserCollectionPagingRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appUserCollectionPagingRepositoryHash,
          dependencies: AppUserCollectionPagingRepositoryFamily._dependencies,
          allTransitiveDependencies: AppUserCollectionPagingRepositoryFamily
              ._allTransitiveDependencies,
          query: query,
        );

  AppUserCollectionPagingRepositoryProvider._internal(
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
            AppUserCollectionPagingRepositoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AppUserCollectionPagingRepositoryProvider._internal(
        (ref) => create(ref as AppUserCollectionPagingRepositoryRef),
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
  AutoDisposeProviderElement<CollectionPagingRepository<AppUser>>
      createElement() {
    return _AppUserCollectionPagingRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppUserCollectionPagingRepositoryProvider &&
        other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AppUserCollectionPagingRepositoryRef
    on AutoDisposeProviderRef<CollectionPagingRepository<AppUser>> {
  /// The parameter `query` of this provider.
  CollectionParam<AppUser> get query;
}

class _AppUserCollectionPagingRepositoryProviderElement
    extends AutoDisposeProviderElement<CollectionPagingRepository<AppUser>>
    with AppUserCollectionPagingRepositoryRef {
  _AppUserCollectionPagingRepositoryProviderElement(super.provider);

  @override
  CollectionParam<AppUser> get query =>
      (origin as AppUserCollectionPagingRepositoryProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
