import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lwa/lwa.dart';
import 'package:qookit/app/app_router.gr.dart';
import 'package:qookit/bloc/user_bloc.dart';
import 'package:qookit/services/auth/auth_service.dart';
import 'package:qookit/services/services.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_lwa_platform_interface/flutter_lwa_platform_interface.dart';

class LoginViewModel extends BaseViewModel {
  String email;
  String password;
  String confirmPassword;
  String name;
  bool showPassword = false;
  bool confirmShowPassword = false;
  bool passwordVisible = false;

  LwaAuthorizeResult lwaAuth;

  GlobalKey<ScaffoldState> scaffoldKey;
  var globalKey;

  FocusNode focusNumber = FocusNode();
  FocusNode focusPassword = FocusNode();
  FocusNode pinPutFocusNode = FocusNode();
  FocusNode focusEmailId = FocusNode();
  FocusNode focusName = FocusNode();
  FocusNode focusConfirmPassword = FocusNode();

  final TextEditingController pinPutController = TextEditingController();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtEmailId = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();
  final TextEditingController txtConfirmPassword = TextEditingController();
  final TextEditingController txtEmailIDForgotPassword = TextEditingController();

  String receivedOtp = '';
  String receivedUserId = '';
  Function callback;
  Function callbackOpenPasswordChangedDialog;

  void init(callback1, callback2) {
    callback = callback1;
    callbackOpenPasswordChangedDialog = callback2;
  }

  void updateName(String newName) {
    name = newName;
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    email = newEmail;
    notifyListeners();
  }

  void updatePassword(String newPass) {
    password = newPass;
    notifyListeners();
  }

  void updateConfirm(String newPass) {
    confirmPassword = newPass;
    notifyListeners();
  }

  RegisterController() {
    this.scaffoldKey = GlobalKey<ScaffoldState>();
  }

  LoginController() {
    this.scaffoldKey = GlobalKey<ScaffoldState>();
  }

  void toggleShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void toggleShowConfirmPassword() {
    confirmShowPassword = !confirmShowPassword;
    notifyListeners();
  }

  void passwordToggle() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  Future<void> loginWithEmail(BuildContext context) async {
    String message = await authService.signInWithEmail(context, email, password);
    if (message == 'Success') {
      await UserBloc().getUserData().then((value){
        ExtendedNavigator.named('topNav').pushAndRemoveUntil(Routes.splashScreenView, (route) => false);} );

    } else {
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(message, textAlign: TextAlign.center),
      ));
    }
  }

  Future<void> loginWithGoogle(BuildContext context) async {
    String message = await authService.signInWithGoogle();
    await loginNavigation(message, context);
  }

  Future<void> loginWithFacebook(BuildContext context) async {
    String message = await authService.signInWithFacebook();
    await loginNavigation(message, context);
  }

  Future<void> signUpWithEmail(BuildContext context) async {
    String message = await authService.signUpWithEmail(context, email, password, name);
    await loginNavigation(message, context);
  }

  Future<void> SignInWithAmazon(BuildContext context) async {

    LoginWithAmazon _loginWithAmazon = LoginWithAmazon(
      scopes: <Scope>[ProfileScope.profile(), ProfileScope.postalCode()],
    );

    _loginWithAmazon.onLwaAuthorizeChanged.listen((LwaAuthorizeResult auth) {
      lwaAuth = auth;
    });

      await _loginWithAmazon.signInSilently();

    try {
      await _loginWithAmazon.signIn();

    } catch (error) {
      if (error is PlatformException) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('${error.message}'),
        ));
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(error.toString( )),
        ));
      }
    }
  }

  Future<void> loginWithApple(BuildContext context) async {
    if (Platform.isAndroid) {
      var redirectURL = '';
      // var clientID = "com.appideas.chatcity";
      var clientID = 'com.qookit.mobileapp';

      final appleIdCredential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
          webAuthenticationOptions: WebAuthenticationOptions(
              clientId: clientID, redirectUri: Uri.parse(redirectURL)));

      final oAuthProvider = OAuthProvider('apple.com');
      final credential = oAuthProvider.credential(
        idToken: appleIdCredential.identityToken,
        accessToken: appleIdCredential.authorizationCode,
      );

      print(credential);
    } else {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
            clientId: 'com.aboutyou.dart_packages.sign_in_with_apple.example',
            redirectUri: Uri.parse(
                'https://flutter-sign-in-with-apple-example.glitch.me/callbacks/sign_in_with_apple')),
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
          if (credential.familyName != null) 'lastName': credential. familyName,
          'useBundleId': Platform.isIOS || Platform.isMacOS ? 'true' : 'false',
          if (credential.state != null) 'state': credential.state,
        },
      );
      final session = await http.Client().post(signInWithAppleEndpoint).then((value) => AuthService().updateUserDataToBackend);
      print(session);
    }
  }

  Future<void> loginNavigation(String message, BuildContext context) async {
    if (message == 'Success') {
      await ExtendedNavigator.named('topNav')
          .pushAndRemoveUntil(Routes.splashScreenView, (route) => false);
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ));
    }
  }
}
