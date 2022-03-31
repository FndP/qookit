import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lwa/lwa.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:qookit/app/app_router.gr.dart';
import 'package:qookit/bloc/create_user_bloc.dart';
import 'package:qookit/services/getIt.dart';
import 'package:http/http.dart' as http;
import 'package:qookit/services/utilities/string_service.dart';
import 'package:qookit/ui/signInSignUp/loginView/login_view_model.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_lwa_platform_interface/flutter_lwa_platform_interface.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import '../services.dart';

@singleton
class AuthService extends ChangeNotifier {
  LwaAuthorizeResult _lwaAuth;

  String currentLatLag;
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
    FacebookLogin().logOut();
    LoginWithAmazon().signOut();
    ExtendedNavigator.named('topNav').pushAndRemoveUntil(Routes.loginView, (route) => false);
    notifyListeners();
  }

  //**************************************************************************
  // Sign In Methods
  // **************************************************************************
  Future<String> signInWithEmail(BuildContext context, String email, String password) async {
    String message;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)/*.then((value) => updateUserDataToBackend(value))*/;
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

  Future<String> signInWithAmazon(BuildContext context) async {

    LoginWithAmazon _loginWithAmazon = LoginWithAmazon(scopes: <Scope>[ProfileScope.profile(), ProfileScope.postalCode()]);

    LwaUser _lwaUser = LwaUser.empty();

    _loginWithAmazon.onLwaAuthorizeChanged.listen((LwaAuthorizeResult auth) {
      // lwaAuth = auth;
      ///todo hio need to up user data in amazon.
    });

    await _loginWithAmazon.signIn()/*signInSilently()*/;

    try {
      await _loginWithAmazon.signIn();
      _lwaUser = await _loginWithAmazon.fetchUserProfile();
      print(_lwaUser.userInfo);


      await CreateUserBloc().postUserData({
        'userName': _lwaUser.userName,
        'photoUrl': 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
        'backgroundUrl': 'String',
        'displayName':_lwaUser.userName,
        'personal': {
          'firstName': 'String',
          'lastName': 'String',
          'fullName': 'String',
          'email': _lwaUser.userEmail,
          'aboutMe': 'String',
          'homeUrl': 'String',
          'location': {
            'city': 'String',
            'state': 'String',
            'country': 'String',
            'zip': 'String',
            'gps': '30.22, 30.55',
            'ip_addr': 'String'}
        },
        'preferences': {
          'units': 'Imperial',
          'recipe': ['String'],
          'diet': ['String']
        }
      });

      // return 'Success';

    } catch (error) {
      if (error is PlatformException) {
        print(error.message);
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('${error.message}'),
        ));
        return 'Failed';
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(error.toString()),
        ));
        return 'Failed';
      }
    }
  }

  Future<String> signInWithApple(BuildContext context) async {
    if (Platform.isAndroid) {
      var redirectURL = '';
      // var clientID = 'com.appideas.chatcity';
      var clientID = 'com.qookit.mobileapp';

      final appleIdCredential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName
          ],
          webAuthenticationOptions: WebAuthenticationOptions(clientId: clientID, redirectUri: Uri.parse(redirectURL)));

      final oAuthProvider = OAuthProvider('apple.com');
      final credential = oAuthProvider.credential(
        idToken: appleIdCredential.identityToken,
        accessToken: appleIdCredential.authorizationCode,
      );
      print(credential);

      ///add user data entry in firebase.
      var userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      ///add user data entry in backend.
      await updateUserDataToBackend(userCredential);

      ///todo call api and store data to backend and firebase.
      return 'Success';

    } else {

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
            clientId: 'com.aboutyou.dart_packages.sign_in_with_apple.example',
            redirectUri: Uri.parse('https://flutter-sign-in-with-apple-example.glitch.me/callbacks/sign_in_with_apple')),
        nonce: 'example-nonce',
        state: 'example-state',
      );

      final signInWithAppleEndpoint = Uri(
        scheme: 'https',
        host: 'flutter-sign-in-with-apple-example.glitch.me',
        path: '/sign_in_with_apple',
        queryParameters: <String, String>{
          'code': credential.authorizationCode,
          if (credential.givenName != null) 'firstName': credential.givenName,
          if (credential.familyName != null) 'lastName': credential.familyName,
          'useBundleId': Platform.isIOS || Platform.isMacOS ? 'true' : 'false',
          if (credential.state != null) 'state': credential.state,
        },
      );

      final session = await http.Client()
          .post(signInWithAppleEndpoint)
          .then((value) => AuthService().updateUserDataToBackend);
      // print(session);



      ///add user data entry in firebase.
      // var userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      ///add user data entry in backend.
      // await updateUserDataToBackend(userCredential);

      return 'Success';
    }
  }

  Future<String> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    print('googleUser ' + googleUser.toString());
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      // Once signed in, return the UserCredential
      ///add user data entry in firebase.
      var userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      ///add user data entry in backend.
      await updateUserDataToBackend(userCredential);
      return 'Success';
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  Future<String> initiateFacebookLogin() async {
    var facebookLogin = FacebookLogin();
    final facebookLoginResult = await facebookLogin.logIn(['public_profile', 'email']);

    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print(facebookLoginResult.errorMessage);
        return 'Failed';
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Something went wrong');
        return 'Failed';
        break;
      case FacebookLoginStatus.loggedIn:

        var graphResponse = await http.get(Uri.parse('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.width(400)&access_token=${facebookLoginResult.accessToken.token}'));
        var profile = json.decode(graphResponse.body);

        print('FB ' + profile.toString());
        final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(facebookLoginResult.accessToken.token);
        await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

          await CreateUserBloc().postUserData({
          'userName': profile['name'].toString(),
          'photoUrl': profile['picture']['data']['url'].toString(),
          'backgroundUrl': 'String',
          'displayName': profile['name'].toString(),
          'personal': {
            'firstName': 'String',
            'lastName': 'String',
            'fullName': 'String',
            'email': profile['email'].toString(),
            'aboutMe': 'String',
            'homeUrl': 'String',
            'location': {
              'city': 'String',
              'state': 'String',
              'country': 'String',
              'zip': 'String',
              'gps': '30.22, 30.55',
              'ip_addr': 'String'}
          },
          'preferences': {
            'units': 'Imperial',
            'recipe': ['String'],
            'diet': ['String']
          }
        });

        return 'Success';
        break;
    }
  }


  // **************************************************************************
  // Sign Up Methods
  // **************************************************************************
  Future<String> signUpWithEmail(BuildContext context, String email, String password, String name) async {

    String message;
    try {
      ///add user data entry in firebase.
      var userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      ///add user data entry in backend.
      await updateUserDataToBackend(userCredential, name: name);

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
        await getIt.get<AuthService>().auth.sendPasswordResetEmail(email: email);

        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
            'Email reset email sent',
            textAlign: TextAlign.center,
          ),
        ));
      } catch (e) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(e,
            textAlign: TextAlign.center,
          )));
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
      await Navigator.pushNamed(context, deepLink.path);
    }
  }

  Future<void> updateUserDataToBackend(UserCredential value, {String name = ''})  async {
    print(value);
   await CreateUserBloc().postUserData({
     'userName': name.isNotEmpty? name : value.user.displayName,
     'photoUrl': value.user.photoURL,
     'backgroundUrl': 'String',
     'displayName': name.isNotEmpty? name : value.user.displayName,
     'personal': {
       'firstName': 'String',
       'lastName': 'String',
       'fullName': 'String',
       'email': value.user.email,
       'aboutMe': 'String',
       'homeUrl': 'String',
       'location': {
         'city': 'String',
         'state': 'String',
         'country': 'String',
         'zip': 'String',
         'gps': '30.22, 30.55',
         'ip_addr': 'String'}
     },
     'preferences': {
       'units': 'Imperial',
       'recipe': ['String'],
       'diet': ['String']
     }
   });
  }
}
