import 'package:aswar/data/local/preferences.dart';
import 'package:aswar/data/local/utils/base.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class LanguagePreference extends StringPreference {
  const LanguagePreference(super.sharedPreference)
      : super(key: Preferences.language);
}
