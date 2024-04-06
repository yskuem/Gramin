// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provide_target_user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$provideTargetUserHash() => r'fc38052e9fa0b29de9d776da9a8671b365637dfa';

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

/// See also [provideTargetUser].
@ProviderFor(provideTargetUser)
const provideTargetUserProvider = ProvideTargetUserFamily();

/// See also [provideTargetUser].
class ProvideTargetUserFamily extends Family<AsyncValue<AppUser?>> {
  /// See also [provideTargetUser].
  const ProvideTargetUserFamily();

  /// See also [provideTargetUser].
  ProvideTargetUserProvider call({
    required String userId,
  }) {
    return ProvideTargetUserProvider(
      userId: userId,
    );
  }

  @override
  ProvideTargetUserProvider getProviderOverride(
    covariant ProvideTargetUserProvider provider,
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
  String? get name => r'provideTargetUserProvider';
}

/// See also [provideTargetUser].
class ProvideTargetUserProvider extends AutoDisposeFutureProvider<AppUser?> {
  /// See also [provideTargetUser].
  ProvideTargetUserProvider({
    required String userId,
  }) : this._internal(
          (ref) => provideTargetUser(
            ref as ProvideTargetUserRef,
            userId: userId,
          ),
          from: provideTargetUserProvider,
          name: r'provideTargetUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$provideTargetUserHash,
          dependencies: ProvideTargetUserFamily._dependencies,
          allTransitiveDependencies:
              ProvideTargetUserFamily._allTransitiveDependencies,
          userId: userId,
        );

  ProvideTargetUserProvider._internal(
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
    FutureOr<AppUser?> Function(ProvideTargetUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProvideTargetUserProvider._internal(
        (ref) => create(ref as ProvideTargetUserRef),
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
  AutoDisposeFutureProviderElement<AppUser?> createElement() {
    return _ProvideTargetUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProvideTargetUserProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProvideTargetUserRef on AutoDisposeFutureProviderRef<AppUser?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _ProvideTargetUserProviderElement
    extends AutoDisposeFutureProviderElement<AppUser?>
    with ProvideTargetUserRef {
  _ProvideTargetUserProviderElement(super.provider);

  @override
  String get userId => (origin as ProvideTargetUserProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
