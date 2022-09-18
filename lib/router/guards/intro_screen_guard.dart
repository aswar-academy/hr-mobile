import 'package:aswar/common_libs.dart';
import 'package:aswar/data/local/intro_screen_preference.dart';
import 'package:aswar/di/injection.dart';
import 'package:auto_route/auto_route.dart';

class IntroScreenGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final firstTime = getIt<IntroScreenPreference>().getData() ?? true;

    if (firstTime) {
      router.push(const IntroRoute());
    } else {
      resolver.next(true);
    }
  }
}
