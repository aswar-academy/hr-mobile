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
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../src/home/home.dart' as _i5;
import '../src/login/login_screen.dart' as _i6;
import '../src/my_department/my_department_screen.dart' as _i1;
import '../src/my_tasks/my_tasks.dart' as _i3;
import '../src/payroll/payroll.dart' as _i2;
import '../src/profile/profile.dart' as _i4;
import '../ui/intro_screen.dart' as _i7;
import 'router.dart' as _i10;

class AppRouter extends _i8.RootStackRouter {
  AppRouter(
      {_i9.GlobalKey<_i9.NavigatorState>? navigatorKey,
      required this.introScreenGuard,
      required this.authenticatedGuard,
      required this.notAuthenticatedGuard})
      : super(navigatorKey);

  final _i10.IntroScreenGuard introScreenGuard;

  final _i10.AuthenticatedGuard authenticatedGuard;

  final _i10.NotAuthenticatedGuard notAuthenticatedGuard;

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    MyDepartmentRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MyDepartmentScreen());
    },
    PayrollRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.PayrollScreen());
    },
    MyTasksRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.MyTasksScreen());
    },
    ProfileRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ProfileScreen());
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.HomeScreen());
    },
    LoginRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.LoginScreen());
    },
    IntroRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.IntroScreen());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig('/#redirect',
            path: '/', redirectTo: 'home', fullMatch: true),
        _i8.RouteConfig(MyDepartmentRoute.name, path: 'my_department'),
        _i8.RouteConfig(PayrollRoute.name, path: 'payroll'),
        _i8.RouteConfig(MyTasksRoute.name, path: 'my-tasks'),
        _i8.RouteConfig(ProfileRoute.name, path: 'profile'),
        _i8.RouteConfig(HomeRoute.name,
            path: 'home', guards: [introScreenGuard, authenticatedGuard]),
        _i8.RouteConfig(LoginRoute.name,
            path: '/login-screen', guards: [notAuthenticatedGuard]),
        _i8.RouteConfig(IntroRoute.name, path: '/intro-screen')
      ];
}

/// generated route for
/// [_i1.MyDepartmentScreen]
class MyDepartmentRoute extends _i8.PageRouteInfo<void> {
  const MyDepartmentRoute()
      : super(MyDepartmentRoute.name, path: 'my_department');

  static const String name = 'MyDepartmentRoute';
}

/// generated route for
/// [_i2.PayrollScreen]
class PayrollRoute extends _i8.PageRouteInfo<void> {
  const PayrollRoute() : super(PayrollRoute.name, path: 'payroll');

  static const String name = 'PayrollRoute';
}

/// generated route for
/// [_i3.MyTasksScreen]
class MyTasksRoute extends _i8.PageRouteInfo<void> {
  const MyTasksRoute() : super(MyTasksRoute.name, path: 'my-tasks');

  static const String name = 'MyTasksRoute';
}

/// generated route for
/// [_i4.ProfileScreen]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-screen');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i7.IntroScreen]
class IntroRoute extends _i8.PageRouteInfo<void> {
  const IntroRoute() : super(IntroRoute.name, path: '/intro-screen');

  static const String name = 'IntroRoute';
}
