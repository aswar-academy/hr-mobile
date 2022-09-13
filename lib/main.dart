import 'package:aswar/app.dart';
import 'package:aswar/common_libs.dart';
import 'package:aswar/di/injection.dart';
import 'package:aswar/ui/strings.dart';

Future<void> main() async {
  configureInjection();
  runApp(const AswarApp());
  await bootstrap();
}

Future<void> bootstrap() async {
  await getIt.get<LocaleLogic>().load();
}

AppLocalizations get $strings => getIt.get<LocaleLogic>().strings;
