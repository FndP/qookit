// Service for handling app navigation
//import 'package:injectable/injectable.dart';
import 'package:injectable/injectable.dart';
import 'package:qookit/app/app_router.gr.dart';

@singleton
class NavigationService {

  List<String> hideNavBar = [
    NavigationViewRoutes.cameraView,
    NavigationViewRoutes.recipeSearchView,
    NavigationViewRoutes.pantryCatalogView,
  ];
}
