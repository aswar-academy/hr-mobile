// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../data/local/intro_screen_preference.dart' as _i7;
import '../data/local/registration.dart' as _i8;
import '../src/home/home_cubit.dart' as _i9;
import '../src/profile/profile_cubit.dart' as _i5;
import '../swagger_generated_code/openapi.swagger.dart' as _i4;
import '../ui/strings.dart' as _i3;
import 'modules/client_module.dart' as _i10;
import 'modules/local_module.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final clientModule = _$ClientModule();
  final localModule = _$LocalModule();
  gh.singleton<_i3.LocaleLogic>(_i3.LocaleLogic());
  gh.factory<_i4.Openapi>(() => clientModule.provideClient());
  gh.factory<_i5.ProfileCubit>(() => _i5.ProfileCubit());
  await gh.factoryAsync<_i6.SharedPreferences>(
      () => localModule.provideSharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i7.IntroScreenPreference>(
      () => _i7.IntroScreenPreference(get<_i6.SharedPreferences>()));
  gh.singleton<_i8.RegistrationPreference>(
      _i8.RegistrationPreference(get<_i6.SharedPreferences>()));
  gh.factory<_i9.HomeCubit>(
      () => _i9.HomeCubit(get<_i8.RegistrationPreference>()));
  return get;
}

class _$ClientModule extends _i10.ClientModule {}

class _$LocalModule extends _i11.LocalModule {}
