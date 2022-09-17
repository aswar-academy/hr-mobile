import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final addRoute = "{{add_route}}" == "true" ? true : false;
  if (addRoute) print(addRoute);
}
