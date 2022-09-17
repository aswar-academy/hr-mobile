import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final dir = await Directory('lib/data/repositories');
  dir.list().forEach((element) async {
    if (await FileSystemEntity.isDirectory(element.path)) {
      final path = element.path
          .substring(element.path.lastIndexOf('/') + 1)
          .replaceAll("_repository", "");

      context.logger.info("      - ${path}");
    }
  });
}
