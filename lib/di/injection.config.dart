// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import '../common_libs.dart' as _i8;
import '../data/local/intro_screen_preference.dart' as _i12;
import '../data/local/registration.dart' as _i13;
import '../src/add_task/add_task_cubit.dart' as _i3;
import '../src/home/home_cubit.dart' as _i14;
import '../src/login/login_cubit.dart' as _i5;
import '../src/my_department/my_department_cubit.dart' as _i6;
import '../src/my_tasks/my_tasks_cubit.dart' as _i7;
import '../src/payroll/payroll_cubit.dart' as _i9;
import '../src/profile/profile_cubit.dart' as _i10;
import '../ui/strings.dart' as _i4;
import 'modules/client_module.dart' as _i15;
import 'modules/local_module.dart'
    as _i16; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final clientModule = _$ClientModule();
  final localModule = _$LocalModule();
  gh.factory<_i3.AddTaskCubit>(() => _i3.AddTaskCubit());
  gh.singleton<_i4.LocaleLogic>(_i4.LocaleLogic());
  gh.factory<_i5.LoginCubit>(() => _i5.LoginCubit());
  gh.factory<_i6.MyDepartmentCubit>(() => _i6.MyDepartmentCubit());
  gh.factory<_i7.MyTasksCubit>(() => _i7.MyTasksCubit());
  gh.factory<_i8.Openapi>(() => clientModule.provideClient());
  gh.factory<_i9.PayrollCubit>(() => _i9.PayrollCubit());
  gh.factory<_i10.ProfileCubit>(() => _i10.ProfileCubit());
  await gh.factoryAsync<_i11.SharedPreferences>(
      () => localModule.provideSharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i12.IntroScreenPreference>(
      () => _i12.IntroScreenPreference(get<_i11.SharedPreferences>()));
  gh.singleton<_i13.RegistrationPreference>(
      _i13.RegistrationPreference(get<_i11.SharedPreferences>()));
  gh.factory<_i14.HomeCubit>(
      () => _i14.HomeCubit(get<_i13.RegistrationPreference>()));
  return get;
}

class _$ClientModule extends _i15.ClientModule {}

class _$LocalModule extends _i16.LocalModule {}
