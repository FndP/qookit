import 'package:qookit/app/app_router.gr.dart';
import 'package:qookit/services/services.dart';
import 'package:qookit/services/user/user_service.dart';
import 'package:stacked/stacked.dart';

class RecommendationPreferencesViewModel extends BaseViewModel{
  String title = 'Hi,';
  String subtitle = "Let's focus our recommendations on the things that matter most to you. You can always change this in your profile.";
  String nextRoute = Routes.dietPreferencesView;
  String background = 'assets/images/get_started11.png';

  List<String> recs = [
    'Healthier Lifestyle',
    'Be More Organized',
    'Less Food Waste',
    'Discover Trends',
    'Watch My Budget'
  ];

  List<dynamic> get recommendationsSelected{
    return hiveService.recommendationsBox.keys.toList();
  }

  void updateRecommendations(String option) {
    if (!hiveService.recommendationsBox.containsKey(option)) {
      hiveService.recommendationsBox.put(option, 'true');
    } else {
      hiveService.recommendationsBox.delete(option);
    }
    notifyListeners();
  }
}