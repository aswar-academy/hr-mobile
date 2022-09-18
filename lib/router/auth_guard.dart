import 'package:aswar/common_libs.dart';
import 'package:aswar/data/local/intro_screen_preference.dart';
import 'package:aswar/data/local/registration.dart';
import 'package:aswar/di/injection.dart';
import 'package:auto_route/auto_route.dart';

class IntroScreenGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final firstTime = getIt<IntroScreenPreference>().getData() ?? true;
    print(firstTime);
    if (firstTime) {
      router.push(const IntroRoute());
    } else {
      resolver.next(true);
    }
  }
}

class AuthenticatedGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final registration = getIt<RegistrationPreference>().getData();
    final isLoggedIn = registration != null;

    print("isLoggedIn: $registration");
    print("isLoggedIn: $isLoggedIn");

    if (isLoggedIn) {
      resolver.next(true);
    } else {
      router.push(const LoginRoute());
    }
  }
}

class NotAuthenticatedGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final registration = getIt<RegistrationPreference>().getData();
    final isLoggedIn = registration == null;

    print("isNotLoggedIn: $registration");
    print("isNotLoggedIn: $isLoggedIn");

    if (isLoggedIn) {
      resolver.next(true);
    } else {
      router.push(const LoginRoute());
    }
  }
}
