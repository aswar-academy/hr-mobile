// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../data/local/registration.dart' as _i8;
import '../src/home/home_cubit.dart' as _i3;
import '../src/login/login_cubit.dart' as _i5;
import '../swagger_generated_code/openapi.swagger.dart' as _i6;
import '../ui/strings.dart' as _i4;
import 'modules.dart' as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final clientModule = _$ClientModule();
  final localModule = _$LocalModule();
  gh.factory<_i3.HomeCubit>(() => _i3.HomeCubit());
  gh.singleton<_i4.LocaleLogic>(_i4.LocaleLogic());
  gh.factory<_i5.LoginCubit>(() => _i5.LoginCubit());
  gh.factory<_i6.Openapi>(() => clientModule.provideClient());
  await gh.factoryAsync<_i7.SharedPreferences>(
      () => localModule.provideSharedPreferences(),
      preResolve: true);
  gh.singleton<_i8.RegistrationPreference>(
      _i8.RegistrationPreference(get<_i7.SharedPreferences>()));
  return get;
}

class _$ClientModule extends _i9.ClientModule {}

class _$LocalModule extends _i9.LocalModule {}
