import 'package:aswar/aswar_app.dart';
import 'package:aswar/common_libs.dart';
import 'package:aswar/di/injection.dart';
import 'package:aswar/ui/strings.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await configureInjection();

  runApp(const AswarApp());
  await bootstrap();

  FlutterNativeSplash.remove();
}

Future<void> bootstrap() async {
  await getIt.get<LocaleLogic>().load();
}

Openapi get $client => getIt.get<Openapi>();
AppLocalizations get $strings => getIt.get<LocaleLogic>().strings;
SharedPreferences get $shared => getIt.get<SharedPreferences>();
