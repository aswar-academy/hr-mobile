// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import '../common_libs.dart' as _i9;
import '../data/local/intro_screen_preference.dart' as _i13;
import '../data/local/language.dart' as _i14;
import '../data/local/registration.dart' as _i15;
import '../language.dart' as _i4;
import '../src/add_task/add_task_cubit.dart' as _i3;
import '../src/home/home_cubit.dart' as _i16;
import '../src/login/login_cubit.dart' as _i6;
import '../src/my_department/my_department_cubit.dart' as _i7;
import '../src/my_tasks/my_tasks_cubit.dart' as _i8;
import '../src/payroll/payroll_cubit.dart' as _i10;
import '../src/profile/profile_cubit.dart' as _i11;
import '../ui/strings.dart' as _i5;
import 'modules/client_module.dart' as _i17;
import 'modules/local_module.dart'
    as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final clientModule = _$ClientModule();
  final localModule = _$LocalModule();
  gh.factory<_i3.AddTaskCubit>(() => _i3.AddTaskCubit());
  gh.factory<_i4.LanguageCubit>(() => _i4.LanguageCubit());
  gh.singleton<_i5.LocaleLogic>(_i5.LocaleLogic());
  gh.factory<_i6.LoginCubit>(() => _i6.LoginCubit());
  gh.factory<_i7.MyDepartmentCubit>(() => _i7.MyDepartmentCubit());
  gh.factory<_i8.MyTasksCubit>(() => _i8.MyTasksCubit());
  gh.factory<_i9.Openapi>(() => clientModule.provideClient());
  gh.factory<_i10.PayrollCubit>(() => _i10.PayrollCubit());
  gh.factory<_i11.ProfileCubit>(() => _i11.ProfileCubit());
  await gh.factoryAsync<_i12.SharedPreferences>(
      () => localModule.provideSharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i13.IntroScreenPreference>(
      () => _i13.IntroScreenPreference(get<_i12.SharedPreferences>()));
  gh.singleton<_i14.LanguagePreference>(
      _i14.LanguagePreference(get<_i12.SharedPreferences>()));
  gh.singleton<_i15.RegistrationPreference>(
      _i15.RegistrationPreference(get<_i12.SharedPreferences>()));
  gh.factory<_i16.HomeCubit>(
      () => _i16.HomeCubit(get<_i15.RegistrationPreference>()));
  return get;
}

class _$ClientModule extends _i17.ClientModule {}

class _$LocalModule extends _i18.LocalModule {}
