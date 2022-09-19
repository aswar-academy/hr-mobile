// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../data/local/intro_screen_preference.dart' as _i8;
import '../data/local/registration.dart' as _i9;
import '../src/home/home_cubit.dart' as _i10;
import '../src/login/login_cubit.dart' as _i4;
import '../src/profile/profile_cubit.dart' as _i6;
import '../swagger_generated_code/openapi.swagger.dart' as _i5;
import '../ui/strings.dart' as _i3;
import 'modules/client_module.dart' as _i11;
import 'modules/local_module.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final clientModule = _$ClientModule();
  final localModule = _$LocalModule();
  gh.singleton<_i3.LocaleLogic>(_i3.LocaleLogic());
  gh.factory<_i4.LoginCubit>(() => _i4.LoginCubit());
  gh.factory<_i5.Openapi>(() => clientModule.provideClient());
  gh.factory<_i6.ProfileCubit>(() => _i6.ProfileCubit());
  await gh.factoryAsync<_i7.SharedPreferences>(
      () => localModule.provideSharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i8.IntroScreenPreference>(
      () => _i8.IntroScreenPreference(get<_i7.SharedPreferences>()));
  gh.singleton<_i9.RegistrationPreference>(
      _i9.RegistrationPreference(get<_i7.SharedPreferences>()));
  gh.factory<_i10.HomeCubit>(
      () => _i10.HomeCubit(get<_i9.RegistrationPreference>()));
  return get;
}

class _$ClientModule extends _i11.ClientModule {}

class _$LocalModule extends _i12.LocalModule {}
