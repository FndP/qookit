import 'package:qookit/services/elastic/endpoints/ingredients_service.dart';
import 'package:qookit/services/elastic/endpoints/recipes_service.dart';
import 'package:qookit/services/elastic/endpoints/users_service.dart';
import 'package:qookit/services/getIt.dart';
import 'package:qookit/services/ml/ml_service.dart';
import 'package:qookit/services/navigation/navigation_service.dart';
import 'package:qookit/services/settings/settings_service.dart';
import 'package:qookit/services/system/hive_service.dart';
import 'package:qookit/services/system/system_service.dart';
import 'package:qookit/services/user/user_service.dart';

import 'auth/auth_service.dart';
import 'elastic/elastic_service.dart';

AuthService get authService {
  return getIt.get<AuthService>();
}

HiveService get hiveService {
  return getIt.get<HiveService>();
}

SettingsService get settingsService {
  return getIt.get<SettingsService>();
}

SystemService get systemService {
  return getIt.get<SystemService>();
}

MlService get mlService {
  return getIt.get<MlService>();
}

NavigationService get navigationService {
  return getIt.get<NavigationService>();
}

ElasticService get elasticService {
  return getIt.get<ElasticService>();
}


RecipesService get recipeService {
  return getIt.get<RecipesService>();
}

IngredientsService get ingredientsService {
  return getIt.get<IngredientsService>();
}

UserService get userService {
  return getIt.get<UserService>();
}

UsersService get usersService {
  return getIt.get<UsersService>();
}