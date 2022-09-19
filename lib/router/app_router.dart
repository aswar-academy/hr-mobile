import 'package:aswar/router/router.dart';
import 'package:aswar/src/home/home.dart';
import 'package:aswar/src/login/login_screen.dart';
import 'package:aswar/src/my_tasks/my_tasks.dart';
import 'package:aswar/src/profile/profile.dart';
import 'package:aswar/ui/intro_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: PayrollScreen,
      path: "payroll",
    ),
    AutoRoute(
      page: MyTasksScreen,
      path: "my-tasks",
    ),
    AutoRoute(
      page: ProfileScreen,
      path: "profile",
    ),
    AutoRoute(
      page: HomeScreen,
      path: "home",
      initial: true,
      guards: [IntroScreenGuard, AuthenticatedGuard],
    ),
    AutoRoute(
      page: LoginScreen,
      guards: [NotAuthenticatedGuard],
    ),
    AutoRoute(
      page: IntroScreen,
      guards: [],
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
