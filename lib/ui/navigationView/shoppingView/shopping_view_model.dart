import 'package:stacked/stacked.dart';

class ShoppingViewModel extends BaseViewModel{

  String screenMode = 'recipes';

  void updateScreenMode(String newMode){
    screenMode = newMode;
    notifyListeners();
  }
}