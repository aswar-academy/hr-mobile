import 'dart:ui';

import 'package:aswar/common_libs.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl_standalone.dart';

extension AppLocalizationsExtension on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this);
}

@singleton
class LocaleLogic {
  AppLocalizations? _strings;
  AppLocalizations get strings => _strings!;

  bool get isLoaded => _strings != null;

  Future<void> load() async {
    final localeCode = await findSystemLocale();
    Locale locale = Locale(localeCode.split('_')[0]);

    if (!AppLocalizations.delegate.isSupported(locale)) {
      locale = const Locale('en');
    }
    _strings = await AppLocalizations.delegate.load(locale);
  }
}
