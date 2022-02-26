import 'package:qookit/ui/navigationView/pantryView/pantryCatalog/pantry_catalog_view_model.dart';
import 'package:stacked/stacked.dart';

class PantryViewModel extends BaseViewModel{

  List<String> categories = [
    'Produce',
    'Dairy',
    'Meat',
    'Carbs'
  ];

  int totalItems = 0;
}