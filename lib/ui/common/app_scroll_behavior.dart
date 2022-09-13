import 'package:aswar/common_libs.dart';
import 'package:flutter/gestures.dart';

/// Add mouse drag on desktop for easier responsive testing
class AppScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices {
    return Set.from(super.dragDevices)..add(PointerDeviceKind.mouse);
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics();

  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    return RawScrollbar(controller: details.controller, child: child);
  }
}