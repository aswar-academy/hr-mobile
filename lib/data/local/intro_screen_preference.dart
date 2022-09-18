import 'package:aswar/data/local/preferences.dart';
import 'package:aswar/data/local/utils/base.dart';
import 'package:injectable/injectable.dart';

// TODO(masreplay): mason it
@LazySingleton()
class IntroScreenPreference extends BoolPreference {
  IntroScreenPreference(super.sharedPreference)
      : super(key: Preferences.introScreen);
}
