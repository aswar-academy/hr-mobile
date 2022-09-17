import 'package:auto/data/repositories/safe_repo.dart';
import 'package:auto/data/services/callbacks.dart';
import 'package:auto/di/injection_name.dart';
import 'package:injectable/injectable.dart';
import '{{name.snakeCase()}}_repo.dart';

@Singleton(as: {{name.pascalCase()}}Repository)
class {{name.pascalCase()}}RepositoryImpl with SafeRepository implements {{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}Client _{{name.camelCase()}}Client;

  const {{name.pascalCase()}}RepositoryImpl(@Named(clientNamed) this._{{name.camelCase()}}Client);
}
