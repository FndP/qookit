import 'package:qookit/app/app_router.gr.dart';
import 'package:qookit/services/getIt.dart';
import 'package:qookit/services/services.dart';
import 'package:qookit/services/user/user_service.dart';
import 'package:stacked/stacked.dart';

class DietPreferencesViewModel extends BaseViewModel{
  String title = 'Choose your diet';
  String background = 'assets/images/get_started22.png';
  String nextRoute = Routes.recipePreferencesView;

  List<String> diets = [
    'Keto',
    'Paleo',
    'Low-Carb',
    'Kosher',
    'Vegan',
    'Vegetarian',
    'High Fiber',
    'Nut-free',
    'Gluten-free',
    'High-protein'
  ];

  List<dynamic> get dietsSelected{
   return hiveService.dietsBox.keys.toList();
  }

  void updateDiets(String option) {
    if (!hiveService.dietsBox.containsKey(option)) {
      hiveService.dietsBox.put(option, 'true');
    } else {
      hiveService.dietsBox.delete(option);
    }
    notifyListeners();
  }
}