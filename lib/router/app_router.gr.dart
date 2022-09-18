// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../src/home/home.dart' as _i2;
import '../src/login/login_screen.dart' as _i3;
import '../src/profile/profile.dart' as _i1;
import '../ui/intro_screen.dart' as _i4;
import 'auth_guard.dart' as _i7;

class AppRouter extends _i5.RootStackRouter {
  AppRouter(
      {_i6.GlobalKey<_i6.NavigatorState>? navigatorKey,
      required this.introScreenGuard,
      required this.authenticatedGuard,
      required this.notAuthenticatedGuard})
      : super(navigatorKey);

  final _i7.IntroScreenGuard introScreenGuard;

  final _i7.AuthenticatedGuard authenticatedGuard;

  final _i7.NotAuthenticatedGuard notAuthenticatedGuard;

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    ProfileRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.ProfileScreen());
    },
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeScreen());
    },
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginScreen());
    },
    IntroRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.IntroScreen());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig('/#redirect',
            path: '/', redirectTo: 'home', fullMatch: true),
        _i5.RouteConfig(ProfileRoute.name, path: 'profile'),
        _i5.RouteConfig(HomeRoute.name,
            path: 'home', guards: [introScreenGuard, authenticatedGuard]),
        _i5.RouteConfig(LoginRoute.name,
            path: '/login-screen', guards: [notAuthenticatedGuard]),
        _i5.RouteConfig(IntroRoute.name, path: '/intro-screen')
      ];
}

/// generated route for
/// [_i1.ProfileScreen]
class ProfileRoute extends _i5.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-screen');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.IntroScreen]
class IntroRoute extends _i5.PageRouteInfo<void> {
  const IntroRoute() : super(IntroRoute.name, path: '/intro-screen');

  static const String name = 'IntroRoute';
}
