import 'package:auto_route/annotations.dart';
import 'package:qookit/ui/navigationView/cameraView/camera_view.dart';
import 'package:qookit/ui/navigationView/navigation_view.dart';
import 'package:qookit/ui/navigationView/pantryView/pantryCatalog/pantry_catalog_view.dart';
import 'package:qookit/ui/navigationView/pantryView/pantry_view.dart';
import 'package:qookit/ui/navigationView/profileView/profile_view.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeDetails/recipe_details_view.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeSearch/recipe_search_view.dart';
import 'package:qookit/ui/navigationView/recipesView/recipes_view.dart';
import 'package:qookit/ui/navigationView/settingsView/settings_view.dart';
import 'package:qookit/ui/navigationView/shoppingView/shopping_view.dart';
import 'package:qookit/ui/signInSignUp/forgotPasswordView/forgot_password_view.dart';
import 'package:qookit/ui/signInSignUp/loginView/login_view.dart';
import 'package:qookit/ui/signInSignUp/onboardingView/dietPreferences/diet_preferences_view.dart';
import 'package:qookit/ui/signInSignUp/onboardingView/recipePreferences/recipe_preferences_view.dart';
import 'package:qookit/ui/signInSignUp/onboardingView/recommendationPreferences/recommendation_preferences_view.dart';
import 'package:qookit/ui/signInSignUp/registerView/register_view.dart';
import 'package:qookit/ui/splashscreenView/splashscreen_view.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    AdaptiveRoute(page: SplashScreenView,initial: true),
    AdaptiveRoute(page: LoginView),
    AdaptiveRoute(page: ForgotPasswordView),
    AdaptiveRoute(page: DietPreferencesView),
    AdaptiveRoute(page: RecipePreferencesView),
    AdaptiveRoute(page: RecommendationPreferences,),
    AdaptiveRoute(page: RegisterView,),
    AdaptiveRoute(page: NavigationView,
    children: [
      AdaptiveRoute(page: CameraView,),
      AdaptiveRoute(page: ProfileView,),
      AdaptiveRoute(page: PantryView, initial: true),
      AdaptiveRoute(page: PantryCatalogView,),
      AdaptiveRoute(page: RecipesView,),
      AdaptiveRoute(page: RecipeSearchView,),
      AdaptiveRoute(page: RecipeDetailsView,),
      AdaptiveRoute(page: SettingsView,),
      AdaptiveRoute(page: ShoppingView,),
    ]),
  ],
)
class $AppRouter {}