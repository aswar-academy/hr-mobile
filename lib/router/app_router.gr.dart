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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../src/home/home.dart' as _i3;
import '../src/login/login_screen.dart' as _i4;
import '../src/my_tasks/my_tasks.dart' as _i1;
import '../src/profile/profile.dart' as _i2;
import '../ui/intro_screen.dart' as _i5;
import 'router.dart' as _i8;

class AppRouter extends _i6.RootStackRouter {
  AppRouter(
      {_i7.GlobalKey<_i7.NavigatorState>? navigatorKey,
      required this.introScreenGuard,
      required this.authenticatedGuard,
      required this.notAuthenticatedGuard})
      : super(navigatorKey);

  final _i8.IntroScreenGuard introScreenGuard;

  final _i8.AuthenticatedGuard authenticatedGuard;

  final _i8.NotAuthenticatedGuard notAuthenticatedGuard;

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    MyTasksRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MyTasksScreen());
    },
    ProfileRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ProfileScreen());
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomeScreen());
    },
    LoginRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.LoginScreen());
    },
    IntroRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.IntroScreen());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig('/#redirect',
            path: '/', redirectTo: 'home', fullMatch: true),
        _i6.RouteConfig(MyTasksRoute.name, path: 'my-tasks'),
        _i6.RouteConfig(ProfileRoute.name, path: 'profile'),
        _i6.RouteConfig(HomeRoute.name,
            path: 'home', guards: [introScreenGuard, authenticatedGuard]),
        _i6.RouteConfig(LoginRoute.name,
            path: '/login-screen', guards: [notAuthenticatedGuard]),
        _i6.RouteConfig(IntroRoute.name, path: '/intro-screen')
      ];
}

/// generated route for
/// [_i1.MyTasksScreen]
class MyTasksRoute extends _i6.PageRouteInfo<void> {
  const MyTasksRoute() : super(MyTasksRoute.name, path: 'my-tasks');

  static const String name = 'MyTasksRoute';
}

/// generated route for
/// [_i2.ProfileScreen]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-screen');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i5.IntroScreen]
class IntroRoute extends _i6.PageRouteInfo<void> {
  const IntroRoute() : super(IntroRoute.name, path: '/intro-screen');

  static const String name = 'IntroRoute';
}
