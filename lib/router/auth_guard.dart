import 'package:aswar/common_libs.dart';
import 'package:aswar/data/local/intro_screen_preference.dart';
import 'package:aswar/data/local/registration.dart';
import 'package:aswar/di/injection.dart';
import 'package:aswar/ui/intro_screen.dart';
import 'package:auto_route/auto_route.dart';

// TODO(masreplay): mason it
class IntroScreenGuard extends AutoRouteGuard {
  final IntroScreenPreference _introScreenPreference;

  IntroScreenGuard(this._introScreenPreference);
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final firstTime = _introScreenPreference.getData() ?? true;
    if (firstTime) {
      router.pushNativeRoute(
        MaterialPageRoute(
          builder: (_) => const IntroScreen(),
        ),
      );
    } else {
      resolver.next(true);
    }
  }
}

class AuthenticatedGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final registration = getIt.get<RegistrationPreference>().getData();
    if (registration == null) {
      router.push(const LoginRoute());
    } else {
      resolver.next();
    }
  }
}

class NotAuthenticatedGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final registration = getIt.get<RegistrationPreference>().getData();
    if (registration == null) {
      router.push(const LoginRoute());
    } else {
      resolver.next();
    }
  }
}
