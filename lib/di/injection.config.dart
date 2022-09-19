// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../common_libs.dart' as _i7;
import '../data/local/intro_screen_preference.dart' as _i11;
import '../data/local/registration.dart' as _i12;
import '../src/home/home_cubit.dart' as _i13;
import '../src/login/login_cubit.dart' as _i4;
import '../src/my_department/my_department_cubit.dart' as _i5;
import '../src/my_tasks/my_tasks_cubit.dart' as _i6;
import '../src/payroll/payroll_cubit.dart' as _i8;
import '../src/profile/profile_cubit.dart' as _i9;
import '../ui/strings.dart' as _i3;
import 'modules/client_module.dart' as _i14;
import 'modules/local_module.dart'
    as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final clientModule = _$ClientModule();
  final localModule = _$LocalModule();
  gh.singleton<_i3.LocaleLogic>(_i3.LocaleLogic());
  gh.factory<_i4.LoginCubit>(() => _i4.LoginCubit());
  gh.factory<_i5.MyDepartmentCubit>(() => _i5.MyDepartmentCubit());
  gh.factory<_i6.MyTasksCubit>(() => _i6.MyTasksCubit());
  gh.factory<_i7.Openapi>(() => clientModule.provideClient());
  gh.factory<_i8.PayrollCubit>(() => _i8.PayrollCubit());
  gh.factory<_i9.ProfileCubit>(() => _i9.ProfileCubit());
  await gh.factoryAsync<_i10.SharedPreferences>(
      () => localModule.provideSharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i11.IntroScreenPreference>(
      () => _i11.IntroScreenPreference(get<_i10.SharedPreferences>()));
  gh.singleton<_i12.RegistrationPreference>(
      _i12.RegistrationPreference(get<_i10.SharedPreferences>()));
  gh.factory<_i13.HomeCubit>(
      () => _i13.HomeCubit(get<_i12.RegistrationPreference>()));
  return get;
}

class _$ClientModule extends _i14.ClientModule {}

class _$LocalModule extends _i15.LocalModule {}
