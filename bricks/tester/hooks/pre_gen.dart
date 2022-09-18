import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  await addRoute();
  await addCubit();
}

Future<void> addCubit() async {
  final name = "{{name}}";
  print(name);

  final path = "lib/app.dart";
  final file = File(path);
  var content = await file.readAsString();

  final finder = "providers: <BlocProvider>[";

  final route = """
        BlocProvider<{{name.pascalCase()}}Cubit>(create: (_) => getIt<{{name.pascalCase()}}Cubit>()),""";

  content = content.replaceFirst(finder, "$finder\n$route");

  file.writeAsString(content);
}

Future<void> addRoute() async {
  final addRoute = "{{add_route}}" == "true" ? true : false;
  print(addRoute);

  if (addRoute) {
    final path = "lib/router/app_router.dart";
    final file = File(path);
    var content = await file.readAsString();

    final finder = "routes: <AutoRoute>[";

    final route = """
    AutoRoute(
      page: {{name.pascalCase()}}Screen,
      path: "{{name.snakeCase()}}",
    ),""";

    content = content.replaceFirst(finder, "$finder\n$route");

    file.writeAsString(content);
  }
}
