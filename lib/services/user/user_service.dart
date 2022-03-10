import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:qookit/services/services.dart';

@singleton
class UserService {

  /// List of user KEYS
  static const String fullName = 'fullName'; // String
  static const String displayName = 'displayName'; // String
  static const String bio = 'bio'; // String
  static const String finishedOnboarding = 'finishedOnboarding'; // Boolean
  static const String profileImage = 'profileImage'; // String (path to image)
  static const String lastScreen = 'lastScreen';
  static const String userDiets = 'userDiets';
  static const String userRecommendations = 'userRecommendations';
  static const String userRecipes = 'userRecipes';
  static const String userEmail = 'userEmail';
  static const String userId = 'userId';


  String get uid {
    return authService.uid;
  }

  Future<bool> initializeUser() async {
    print('UserService ');
    try {
      await Hive.box('master').put('ready', true);
      return true;

    } on Exception catch (e) {
      print('error: ' + e.toString());

      return false;
    }
  }
}