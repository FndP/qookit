import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:qookit/app/app_router.gr.dart';
import 'package:qookit/services/getIt.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:qookit/services/user/user_service.dart';
import 'package:qookit/services/utilities/string_service.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_lwa_platform_interface/flutter_lwa_platform_interface.dart';

import '../services.dart';

@singleton
class AuthService extends ChangeNotifier {
  LwaAuthorizeResult _lwaAuth;

  FirebaseAuth get auth {
    return FirebaseAuth.instance;
  }

  String get uid {
    return FirebaseAuth.instance.currentUser.uid;
  }

  User get user {

    return FirebaseAuth.instance.currentUser;
  }

  // Firebase auth automatically keeps token updated
  // https://stackoverflow.com/questions/49656489/is-the-firebase-access-token-refreshed-automatically?rq=1#:~:text=Firebase%20automatically%20refreshes%20if%20it,cause%20that%20listener%20to%20trigger.
  Future<String> get token async {

    String value = await  auth.currentUser.getIdToken();
    print('Token ' +value);
    return value;
  }

  void addAuthListener(BuildContext context) {
    auth.authStateChanges().listen((User user) {
      if (user == null) {
        ExtendedNavigator.named('topNav').pushAndRemoveUntil(Routes.splashScreenView, (route) => false);
      }
    });
  }

  void signOut(BuildContext context) {
    auth.signOut();
   /* getIt
        .get<NavigationService>()
        .navigateToFirstScreen(route: SplashScreenView.id, context: context);*/
    ExtendedNavigator.named('topNav').pushAndRemoveUntil(Routes.loginView, (route) => false);
    notifyListeners();
  }

  //**************************************************************************
  // Sign In Methods
  // **************************************************************************
  Future<String> signInWithEmail(BuildContext context, String email, String password) async {
    String message;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      // Successfully signed in

      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Email or password is incorrect.';
      }
      return message;
    }
  }
  Future<String> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    print('googleUser ' + googleUser.toString());
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);

      return 'Success';
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  Future<String> signInWithFacebook() async {
    final result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final FacebookAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.token);

    try {
      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      return 'Success';
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  // **************************************************************************
  // Sign Up Methods
  // **************************************************************************
  Future<String> signUpWithEmail(BuildContext context, String email, String password, String name) async {

    String message;
    try {
      var userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

      //await ExtendedNavigator.named('topNav').replace(Routes.recommendationPreferences);
      //await ExtendedNavigator.named('topNav').pushAndRemoveUntil(Routes.splashScreenView, (route) => false);
      return 'Success';

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists for that email.';
      }
      return message;
    } catch (e) {
      print(e);
      return 'Something went wrong. Try again later.';
    }
  }



  // **************************************************************************
  // Email Interaction
  // **************************************************************************
  Future<void> resetPassword(BuildContext context, String email) async {
    if (email.isValidEmail()) {
      try {
        await getIt
            .get<AuthService>()
            .auth
            .sendPasswordResetEmail(email: email);

        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
            'Email reset email sent',
            textAlign: TextAlign.center,
          ),
        ));
      } catch (e) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
            e,
            textAlign: TextAlign.center,
          ),
        ));
        print(e);
      }
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
          'Enter a valid email before requesting reset',
          textAlign: TextAlign.center,
        ),
      ));
    }
  }

  void initDynamicLinks(BuildContext context) async {
    FirebaseDynamicLinks.instance.onLink;

    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      Navigator.pushNamed(context, deepLink.path);
    }
  }
}
