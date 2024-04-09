// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_ranking_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchAllUserCountHash() => r'a5e3b5beeea67600e28134d756bca6b2cfb393f1';

/// See also [fetchAllUserCount].
@ProviderFor(fetchAllUserCount)
final fetchAllUserCountProvider = FutureProvider<int>.internal(
  fetchAllUserCount,
  name: r'fetchAllUserCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAllUserCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchAllUserCountRef = FutureProviderRef<int>;
String _$fetchUserRankingHash() => r'c8c6afb45c6eb5ebfdc166ba2f7d3ec5286766ad';

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

/// See also [fetchUserRanking].
@ProviderFor(fetchUserRanking)
const fetchUserRankingProvider = FetchUserRankingFamily();

/// See also [fetchUserRanking].
class FetchUserRankingFamily extends Family<AsyncValue<int>> {
  /// See also [fetchUserRanking].
  const FetchUserRankingFamily();

  /// See also [fetchUserRanking].
  FetchUserRankingProvider call({
    required String userId,
  }) {
    return FetchUserRankingProvider(
      userId: userId,
    );
  }

  @override
  FetchUserRankingProvider getProviderOverride(
    covariant FetchUserRankingProvider provider,
  ) {
    return call(
      userId: provider.userId,
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
  String? get name => r'fetchUserRankingProvider';
}

/// See also [fetchUserRanking].
class FetchUserRankingProvider extends AutoDisposeFutureProvider<int> {
  /// See also [fetchUserRanking].
  FetchUserRankingProvider({
    required String userId,
  }) : this._internal(
          (ref) => fetchUserRanking(
            ref as FetchUserRankingRef,
            userId: userId,
          ),
          from: fetchUserRankingProvider,
          name: r'fetchUserRankingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchUserRankingHash,
          dependencies: FetchUserRankingFamily._dependencies,
          allTransitiveDependencies:
              FetchUserRankingFamily._allTransitiveDependencies,
          userId: userId,
        );

  FetchUserRankingProvider._internal(
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
  Override overrideWith(
    FutureOr<int> Function(FetchUserRankingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchUserRankingProvider._internal(
        (ref) => create(ref as FetchUserRankingRef),
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
  AutoDisposeFutureProviderElement<int> createElement() {
    return _FetchUserRankingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUserRankingProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchUserRankingRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _FetchUserRankingProviderElement
    extends AutoDisposeFutureProviderElement<int> with FetchUserRankingRef {
  _FetchUserRankingProviderElement(super.provider);

  @override
  String get userId => (origin as FetchUserRankingProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
