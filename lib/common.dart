import 'package:aswar/common_libs.dart';
import 'package:aswar/data/local/registration.dart';
import 'package:aswar/data/local/utils/base.dart';
import 'package:shared_preferences/shared_preferences.dart';

// typedef _ProvideCallback<T> = ObjectSharedPreference<T> Function(
//   SharedPreferences sharedPreference,
// );

// extension on FutureProvider<SharedPreferences> {
//   FutureProvider<ObjectSharedPreference<T>> provideSharedPreference<T>(
//       _ProvideCallback<T> provide) {
//     return FutureProvider((ref) async {
//       SharedPreferences sharedPreferences = await ref.watch(future);
//       return provide(sharedPreferences);
//     });
//   }
// }

final sharedPreferencesProvider =
    FutureProvider((ref) => SharedPreferences.getInstance());

final registrationPreferenceProvider = FutureProvider((ref) async {
  final sharedPreferences = await ref.read(sharedPreferencesProvider.future);
  return RegistrationPreference(sharedPreferences);
});
