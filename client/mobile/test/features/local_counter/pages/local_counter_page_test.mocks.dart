// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_app_template/test/features/local_counter/pages/local_counter_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:flutter_app_template/core/repositories/shared_preferences/shared_preference_key.dart'
    as _i4;
import 'package:flutter_app_template/core/repositories/shared_preferences/shared_preference_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [SharedPreferencesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferencesRepository extends _i1.Mock
    implements _i2.SharedPreferencesRepository {
  @override
  _i3.Future<bool> save<T>(
    _i4.SharedPreferencesKey? key,
    T? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #save,
          [
            key,
            value,
          ],
        ),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  T? fetch<T>(_i4.SharedPreferencesKey? key) => (super.noSuchMethod(
        Invocation.method(
          #fetch,
          [key],
        ),
        returnValueForMissingStub: null,
      ) as T?);

  @override
  _i3.Future<bool> remove(_i4.SharedPreferencesKey? key) => (super.noSuchMethod(
        Invocation.method(
          #remove,
          [key],
        ),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}
