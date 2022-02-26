import 'package:flutter/material.dart';
import 'package:qookit/services/auth/auth_service.dart';
import 'package:qookit/services/getIt.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordViewModel extends BaseViewModel{
  String email;
  bool emailSent = false;
  String emailMessage = "Enter your email address below to reset password";

  ForgotPasswrdController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  GlobalKey<ScaffoldState> scaffoldKey;
  var globalKey;

  final TextEditingController txtEmailId = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();
  final TextEditingController pinPutController = TextEditingController();
  final TextEditingController txtEmailIDForgotPassword = TextEditingController();

  FocusNode focusNumber = FocusNode();
  FocusNode focusPassword = FocusNode();
  FocusNode pinPutFocusNode = FocusNode();
  FocusNode focusEmailId = FocusNode();

  String btnText = "Login";
  String receivedOtp = "";
  String receivedUserId = "";
  Function callback;
  Function callbackOpenPasswordChangedDialog;

  void updateEmail(String newEmail){
    email = newEmail;
    notifyListeners();
  }

  void toggleEmailSent(){
    emailSent = !emailSent;
    if(emailSent){
      emailMessage = "Your password reset email has been sent to $email";
    } else {
      emailMessage = "Enter your email address below to reset password";
    }
    notifyListeners();
  }

  /*
  FUNCTION:
  DESCRIPTION:
  PARAMETERS:
  - BuildContext needed to display SnackBar
   */
  void sendResetPasswordEmail(BuildContext context){
    getIt.get<AuthService>().resetPassword(context, email);
    toggleEmailSent();
  }

  void init(callback1, callback2) {
    callback = callback1;
    callbackOpenPasswordChangedDialog = callback2;
  }
}