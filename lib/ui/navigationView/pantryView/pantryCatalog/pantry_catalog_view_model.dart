import 'package:stacked/stacked.dart';

class PantryCatalogViewModel extends BaseViewModel{

  List<PantryCategory> categories = [
    PantryCategory('MEATS', 'assets/images/meat_image.png'),
    PantryCategory('PRODUCE', 'assets/images/produce_image.png'),
    PantryCategory('DRY PASTA', 'assets/images/dry_pasta_image.png'),
    PantryCategory('DAIRY', 'assets/images/dairy_image.png'),
  ];
}

class PantryCategory{
  final String label;
  final String coverImage;

  PantryCategory(this.label, this.coverImage);
}