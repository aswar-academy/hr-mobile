import 'package:aswar/common_libs.dart';
import 'package:aswar/main.dart';

class AuthenticatedGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final registration = $registrationPreference.getData();
    final isLoggedIn = registration != null;

    if (isLoggedIn) {
      resolver.next(true);
    } else {
      router.push(const LoginRoute());
    }
  }
}
