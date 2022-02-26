import 'package:stacked/stacked.dart';

class CameraDemoViewModel extends BaseViewModel {
  bool highlighting = false;
  double screenWidth;
  double screenHeight;

  List<String> images = [
    'assets/images/demo_pic_4.jpg',
    'assets/images/demo_pic_6.jpg',
    'assets/images/demo_pic_10.jpg',
  ];

  List<LocatedItem> get items {
    return [
      LocatedItem('Raspberries', (screenHeight / 3) + 32, screenWidth/3 + 8),
      LocatedItem('Bell Pepper', (screenHeight / 2 )-16, 16),
      LocatedItem('Cucumber', screenHeight/9, screenWidth/6),
    ];
  }

  void initialize(double width, double height) {
    screenWidth = width;
    screenHeight = height;
    notifyListeners();
  }

  void findItems() {
    highlighting = true;
    notifyListeners();
  }

  void clearScan() {
    highlighting = false;
    notifyListeners();
  }
}

class LocatedItem {
  final String label;
  final double bottom;
  final double left;

  LocatedItem(this.label, this.bottom, this.left);
}
