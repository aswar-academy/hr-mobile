import 'package:aswar/common_libs.dart';
import 'package:aswar/data/local/registration.dart';


class AuthenticatedGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final registration = getIt<RegistrationPreference>().getData();
    final isLoggedIn = registration != null;

    if (isLoggedIn) {
      resolver.next(true);
    } else {
      router.push(const LoginRoute());
    }
  }
}
