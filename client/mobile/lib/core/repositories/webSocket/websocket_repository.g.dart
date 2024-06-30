// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'websocket_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$webSocketRepositoryHash() =>
    r'88ec8ca96b6c4f1ce43b2a53aa3af05933f0c0f3';

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

/// See also [webSocketRepository].
@ProviderFor(webSocketRepository)
const webSocketRepositoryProvider = WebSocketRepositoryFamily();

/// See also [webSocketRepository].
class WebSocketRepositoryFamily extends Family<WebSocketRepository> {
  /// See also [webSocketRepository].
  const WebSocketRepositoryFamily();

  /// See also [webSocketRepository].
  WebSocketRepositoryProvider call({
    required String endPoint,
    required String initialToken,
  }) {
    return WebSocketRepositoryProvider(
      endPoint: endPoint,
      initialToken: initialToken,
    );
  }

  @override
  WebSocketRepositoryProvider getProviderOverride(
    covariant WebSocketRepositoryProvider provider,
  ) {
    return call(
      endPoint: provider.endPoint,
      initialToken: provider.initialToken,
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
  String? get name => r'webSocketRepositoryProvider';
}

/// See also [webSocketRepository].
class WebSocketRepositoryProvider extends Provider<WebSocketRepository> {
  /// See also [webSocketRepository].
  WebSocketRepositoryProvider({
    required String endPoint,
    required String initialToken,
  }) : this._internal(
          (ref) => webSocketRepository(
            ref as WebSocketRepositoryRef,
            endPoint: endPoint,
            initialToken: initialToken,
          ),
          from: webSocketRepositoryProvider,
          name: r'webSocketRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$webSocketRepositoryHash,
          dependencies: WebSocketRepositoryFamily._dependencies,
          allTransitiveDependencies:
              WebSocketRepositoryFamily._allTransitiveDependencies,
          endPoint: endPoint,
          initialToken: initialToken,
        );

  WebSocketRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.endPoint,
    required this.initialToken,
  }) : super.internal();

  final String endPoint;
  final String initialToken;

  @override
  Override overrideWith(
    WebSocketRepository Function(WebSocketRepositoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WebSocketRepositoryProvider._internal(
        (ref) => create(ref as WebSocketRepositoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        endPoint: endPoint,
        initialToken: initialToken,
      ),
    );
  }

  @override
  ProviderElement<WebSocketRepository> createElement() {
    return _WebSocketRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WebSocketRepositoryProvider &&
        other.endPoint == endPoint &&
        other.initialToken == initialToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, endPoint.hashCode);
    hash = _SystemHash.combine(hash, initialToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WebSocketRepositoryRef on ProviderRef<WebSocketRepository> {
  /// The parameter `endPoint` of this provider.
  String get endPoint;

  /// The parameter `initialToken` of this provider.
  String get initialToken;
}

class _WebSocketRepositoryProviderElement
    extends ProviderElement<WebSocketRepository> with WebSocketRepositoryRef {
  _WebSocketRepositoryProviderElement(super.provider);

  @override
  String get endPoint => (origin as WebSocketRepositoryProvider).endPoint;
  @override
  String get initialToken =>
      (origin as WebSocketRepositoryProvider).initialToken;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
