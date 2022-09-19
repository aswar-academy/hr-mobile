// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProfileStateCWProxy {
  ProfileState logoutState(ResultState<dynamic> logoutState);

  ProfileState userState(ResultState<UserDetail> userState);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProfileState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProfileState(...).copyWith(id: 12, name: "My name")
  /// ````
  ProfileState call({
    ResultState<dynamic>? logoutState,
    ResultState<UserDetail>? userState,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProfileState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProfileState.copyWith.fieldName(...)`
class _$ProfileStateCWProxyImpl implements _$ProfileStateCWProxy {
  final ProfileState _value;

  const _$ProfileStateCWProxyImpl(this._value);

  @override
  ProfileState logoutState(ResultState<dynamic> logoutState) =>
      this(logoutState: logoutState);

  @override
  ProfileState userState(ResultState<UserDetail> userState) =>
      this(userState: userState);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProfileState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProfileState(...).copyWith(id: 12, name: "My name")
  /// ````
  ProfileState call({
    Object? logoutState = const $CopyWithPlaceholder(),
    Object? userState = const $CopyWithPlaceholder(),
  }) {
    return ProfileState(
      logoutState:
          logoutState == const $CopyWithPlaceholder() || logoutState == null
              ? _value.logoutState
              // ignore: cast_nullable_to_non_nullable
              : logoutState as ResultState<dynamic>,
      userState: userState == const $CopyWithPlaceholder() || userState == null
          ? _value.userState
          // ignore: cast_nullable_to_non_nullable
          : userState as ResultState<UserDetail>,
    );
  }
}

extension $ProfileStateCopyWith on ProfileState {
  /// Returns a callable class that can be used as follows: `instanceOfProfileState.copyWith(...)` or like so:`instanceOfProfileState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProfileStateCWProxy get copyWith => _$ProfileStateCWProxyImpl(this);
}
