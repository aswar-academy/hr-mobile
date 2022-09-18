import 'package:aswar/src/home/home.dart';
import 'package:aswar/src/login/login_screen.dart';
import 'package:aswar/ui/intro_screen.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomeScreen,
      path: "home",
    ),
    AutoRoute(
      page: IntroScreen,
      initial: true,
    ),
    AutoRoute(
      page: LoginScreen,
    ),
  ],
)
class $AppRouter {}

const String deepLinkBaseUrl = "https://aswar.iq";

extension DeepLinkExtension on PageRouteInfo {
  String get deepLink {
    return "$deepLinkBaseUrl$fullPath";
  }
}
