// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../models/recipe.dart';
import '../ui/navigationView/cameraView/camera_view.dart';
import '../ui/navigationView/navigation_view.dart';
import '../ui/navigationView/pantryView/pantryCatalog/pantry_catalog_view.dart';
import '../ui/navigationView/pantryView/pantry_view.dart';
import '../ui/navigationView/profileView/profile_view.dart';
import '../ui/navigationView/recipesView/recipeDetails/recipe_details_view.dart';
import '../ui/navigationView/recipesView/recipeSearch/recipe_search_view.dart';
import '../ui/navigationView/recipesView/recipes_view.dart';
import '../ui/navigationView/settingsView/settings_view.dart';
import '../ui/navigationView/shoppingView/shopping_view.dart';
import '../ui/signInSignUp/forgotPasswordView/forgot_password_view.dart';
import '../ui/signInSignUp/loginView/login_view.dart';
import '../ui/signInSignUp/onboardingView/dietPreferences/diet_preferences_view.dart';
import '../ui/signInSignUp/onboardingView/recipePreferences/recipe_preferences_view.dart';
import '../ui/signInSignUp/onboardingView/recommendationPreferences/recommendation_preferences_view.dart';
import '../ui/signInSignUp/registerView/register_view.dart';
import '../ui/splashscreenView/splashscreen_view.dart';

class Routes {
  static const String splashScreenView = '/';
  static const String loginView = '/login-view';
  static const String forgotPasswordView = '/forgot-password-view';
  static const String dietPreferencesView = '/diet-preferences-view';
  static const String recipePreferencesView = '/recipe-preferences-view';
  static const String recommendationPreferences = '/recommendation-preferences';
  static const String registerView = '/register-view';
  static const String navigationView = '/navigation-view';
  static const all = <String>{
    splashScreenView,
    loginView,
    forgotPasswordView,
    dietPreferencesView,
    recipePreferencesView,
    recommendationPreferences,
    registerView,
    navigationView,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreenView, page: SplashScreenView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.forgotPasswordView, page: ForgotPasswordView),
    RouteDef(Routes.dietPreferencesView, page: DietPreferencesView),
    RouteDef(Routes.recipePreferencesView, page: RecipePreferencesView),
    RouteDef(Routes.recommendationPreferences, page: RecommendationPreferences),
    RouteDef(Routes.registerView, page: RegisterView),
    RouteDef(Routes.navigationView, page: NavigationView, generator: NavigationViewRouter())
  ];
  @override
  get pagesMap => _pagesMap;
  final _pagesMap = {
    SplashScreenView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SplashScreenView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    ForgotPasswordView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ForgotPasswordView(),
        settings: data,
      );
    },
    DietPreferencesView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => DietPreferencesView(),
        settings: data,
      );
    },
    RecipePreferencesView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => RecipePreferencesView(),
        settings: data,
      );
    },
    RecommendationPreferences: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => RecommendationPreferences(),
        settings: data,
      );
    },
    RegisterView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => RegisterView(),
        settings: data,
      );
    },
    NavigationView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => NavigationView(),
        settings: data,
      );
    },
  };
}

class NavigationViewRoutes {
  static const String cameraView = '/camera-view';
  static const String profileView = '/profile-view';
  static const String pantryView = '/';
  static const String pantryCatalogView = '/pantry-catalog-view';
  static const String recipesView = '/recipes-view';
  static const String recipeSearchView = '/recipe-search-view';
  static const String recipeDetailsView = '/recipe-details-view';
  static const String settingsView = '/settings-view';
  static const String shoppingView = '/shopping-view';
  static const all = <String>{
    cameraView,
    profileView,
    pantryView,
    pantryCatalogView,
    recipesView,
    recipeSearchView,
    recipeDetailsView,
    settingsView,
    shoppingView,
  };
}

class NavigationViewRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(NavigationViewRoutes.cameraView, page: CameraView),
    RouteDef(NavigationViewRoutes.profileView, page: ProfileView),
    RouteDef(NavigationViewRoutes.pantryView, page: PantryView),
    RouteDef(NavigationViewRoutes.pantryCatalogView, page: PantryCatalogView),
    RouteDef(NavigationViewRoutes.recipesView, page: RecipesView),
    RouteDef(NavigationViewRoutes.recipeSearchView, page: RecipeSearchView),
    RouteDef(NavigationViewRoutes.recipeDetailsView, page: RecipeDetailsView),
    RouteDef(NavigationViewRoutes.settingsView, page: SettingsView),
    RouteDef(NavigationViewRoutes.shoppingView, page: ShoppingView),
  ];
  @override
  get pagesMap => _pagesMap;
  final _pagesMap = {
    CameraView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => CameraView(),
        settings: data,
      );
    },
    ProfileView: (data) {
      final args = data.getArgs<ProfileViewArguments>(
        orElse: () => ProfileViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ProfileView(key: args.key),
        settings: data,
      );
    },
    PantryView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => PantryView(),
        settings: data,
      );
    },
    PantryCatalogView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => PantryCatalogView(),
        settings: data,
      );
    },
    RecipesView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => RecipesView(),
        settings: data,
      );
    },
    RecipeSearchView: (data) {
      final args = data.getArgs<RecipeSearchViewArguments>(
        orElse: () => RecipeSearchViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => RecipeSearchView(
          key: args.key,
          searchTerm: args.searchTerm,
        ),
        settings: data,
      );
    },
    RecipeDetailsView: (data) {
      final args = data.getArgs<RecipeDetailsViewArguments>(
        orElse: () => RecipeDetailsViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => RecipeDetailsView(
          key: args.key,
          recipe: args.recipe,
        ),
        settings: data,
      );
    },
    SettingsView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SettingsView(),
        settings: data,
      );
    },
    ShoppingView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ShoppingView(),
        settings: data,
      );
    },
  };
}

/// **************************************************************
/// Arguments holder classes
/// **************************************************************

/// ProfileView arguments holder class
class ProfileViewArguments {
  final Key key;
  ProfileViewArguments({this.key});
}

/// RecipeSearchView arguments holder class
class RecipeSearchViewArguments {
  final Key key;
  final String searchTerm;
  RecipeSearchViewArguments({this.key, this.searchTerm});
}

/// RecipeDetailsView arguments holder class
class RecipeDetailsViewArguments {
  final Key key;
  final Recipe recipe;
  RecipeDetailsViewArguments({this.key, this.recipe});
}