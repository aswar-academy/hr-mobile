import 'package:aswar/ui/intro_screen.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: IntroScreen,
      maintainState: false,
      initial: true,
    ),
  ],
)
class $AppRouter {}

const String websiteBaseUrl = "ibaity.com";

const String deepLinkBaseUrl = "https://ibaity.com";

const String termAndConditionUrl = "$deepLinkBaseUrl/terms-conditions";

extension DeepLinkExtension on PageRouteInfo {
  String get deepLink {
    return "$deepLinkBaseUrl$fullPath";
  }
}
