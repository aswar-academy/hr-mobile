import 'package:aswar/app.dart';
import 'package:aswar/common_libs.dart';
import 'package:aswar/di/injection.dart';
import 'package:aswar/ui/strings.dart';
import 'package:get_it/get_it.dart';

Future<void> main() async {
  await bootstrap();
  runApp(const AswarApp());
  configureInjection();
}

Future<void> bootstrap() async {
  await localeLogic.load();
}

LocaleLogic get localeLogic => GetIt.I.get<LocaleLogic>();
AppLocalizations get $strings => LocaleLogic().strings;
