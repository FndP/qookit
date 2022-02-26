// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'auth/auth_service.dart' as _i7;
import 'elastic/elastic_service.dart' as _i3;
import 'elastic/endpoints/ingredients_service.dart' as _i9;
import 'elastic/endpoints/recipes_service.dart' as _i12;
import 'elastic/endpoints/users_service.dart' as _i14;
import 'ml/ml_service.dart' as _i10;
import 'navigation/navigation_service.dart' as _i11;
import 'settings/settings_service.dart' as _i4;
import 'system/hive_service.dart' as _i8;
import 'system/system_service.dart' as _i5;
import 'theme/theme_service.dart' as _i6;
import 'user/user_service.dart' as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ElasticService>(() => _i3.ElasticService());
  gh.factory<_i4.SettingsService>(() => _i4.SettingsService());
  gh.factory<_i5.SystemService>(() => _i5.SystemService());
  gh.factory<_i6.ThemeService>(() => _i6.ThemeService());
  gh.singleton<_i7.AuthService>(_i7.AuthService());
  gh.singleton<_i8.HiveService>(_i8.HiveService());
  gh.singleton<_i9.IngredientsService>(_i9.IngredientsService());
  gh.singleton<_i10.MlService>(_i10.MlService());
  gh.singleton<_i11.NavigationService>(_i11.NavigationService());
  gh.singleton<_i12.RecipesService>(_i12.RecipesService());
  gh.singleton<_i13.UserService>(_i13.UserService());
  gh.singleton<_i14.UsersService>(_i14.UsersService());
  return get;
}
