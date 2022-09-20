import 'package:aswar/app.dart';
import 'package:aswar/common_libs.dart';
import 'package:aswar/data/local/language.dart';
import 'package:aswar/data/local/registration.dart';
import 'package:aswar/ui/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await configureInjection();
  _setupLogging();
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
RegistrationPreference get $registrationPreference => getIt.get<RegistrationPreference>();
LanguagePreference get $language => getIt.get<LanguagePreference>();

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    if (kDebugMode) {
      print('${rec.level.name}: ${rec.time}: ${rec.message}');
    }
  });
}
