// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProfileStateCWProxy {
  ProfileState logout(ResultState<dynamic> logout);

  ProfileState user(ResultState<dynamic> user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProfileState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProfileState(...).copyWith(id: 12, name: "My name")
  /// ````
  ProfileState call({
    ResultState<dynamic>? logout,
    ResultState<dynamic>? user,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProfileState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProfileState.copyWith.fieldName(...)`
class _$ProfileStateCWProxyImpl implements _$ProfileStateCWProxy {
  final ProfileState _value;

  const _$ProfileStateCWProxyImpl(this._value);

  @override
  ProfileState logout(ResultState<dynamic> logout) => this(logout: logout);

  @override
  ProfileState user(ResultState<dynamic> user) => this(user: user);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProfileState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProfileState(...).copyWith(id: 12, name: "My name")
  /// ````
  ProfileState call({
    Object? logout = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
  }) {
    return ProfileState(
      logout: logout == const $CopyWithPlaceholder() || logout == null
          ? _value.logout
          // ignore: cast_nullable_to_non_nullable
          : logout as ResultState<dynamic>,
      user: user == const $CopyWithPlaceholder() || user == null
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as ResultState<dynamic>,
    );
  }
}

extension $ProfileStateCopyWith on ProfileState {
  /// Returns a callable class that can be used as follows: `instanceOfProfileState.copyWith(...)` or like so:`instanceOfProfileState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProfileStateCWProxy get copyWith => _$ProfileStateCWProxyImpl(this);
}
