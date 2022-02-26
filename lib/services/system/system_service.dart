import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class SystemService {
  double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
