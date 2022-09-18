import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final addRoute = "{{add_route}}" == "true" ? true : false;
  print(addRoute);

  if (addRoute) {
    final path = "lib/router/app_router.dart";
    final file = File(path);
    var content = await file.readAsString();

    final x = "routes: <AutoRoute>[";

    final route = """
    AutoRoute(
      page: {{name.pascalCase()}}Screen,
      path: "{{name.snakeCase()}}",
    ),""";

    content = content.replaceFirst(x, "$x\n$route");

    file.writeAsString(content);
  }
}
