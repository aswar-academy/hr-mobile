// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../swagger_generated_code/openapi.swagger.dart' as _i4;
import '../ui/strings.dart' as _i3;
import 'modules.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final clientModule = _$ClientModule();
  final localModule = _$LocalModule();
  gh.singleton<_i3.LocaleLogic>(_i3.LocaleLogic());
  gh.factory<_i4.Openapi>(() => clientModule.provideClient());
  await gh.factoryAsync<_i5.SharedPreferences>(
      () => localModule.provideSharedPreferences(),
      preResolve: true);
  return get;
}

class _$ClientModule extends _i6.ClientModule {}

class _$LocalModule extends _i6.LocalModule {}
