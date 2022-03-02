import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qookit/app/theme/colors.dart';
import 'package:qookit/elements/block_button_widget.dart';
import 'package:qookit/ui/signInSignUp/loginView/login_components.dart';
import 'package:qookit/ui/signInSignUp/loginView/login_view_model.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {

  static GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  String fullName = '';
  String profileImage = '';
  String strEmail = '';

  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: [
            Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/images/loginbg.png'),
                    fit: BoxFit.cover,
                  )),
                child: Container()),
            Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Flexible(
                  child: Form(
                      key: _loginFormKey,
                      child: SingleChildScrollView(
                          child: Container(
                        margin: EdgeInsets.only(top: 0),
                        width: double.infinity,
                        child: Container(
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white.withAlpha(230),
                              borderRadius: BorderRadius.all(Radius.circular(
                                      10.0) //                 <--- border radius here
                                  )),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Log In',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'sofia_bold',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text('with:',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'opensans',
                                  )),
                              SizedBox(height: 20),
                              ThirdPartyIcons(),
                              SizedBox(height: 15),
                              Text(
                                "OR",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'opensans',
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Enter your email address:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'opensans',
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    child: TextFormField(
                                      controller: model.txtEmailId,
                                      maxLength: 100,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      validator: emailValidator,
                                      focusNode: model.focusNumber,
                                      onChanged: (newText) {
                                        model.updateEmail(newText);
                                      },
                                      onFieldSubmitted: (term) {
                                        model.focusNumber.unfocus();
                                        FocusScope.of(context)
                                            .requestFocus(model.focusPassword);
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0.0, horizontal: 10.0),
                                        hintText: 'Enter Email ID',
                                        labelText: 'Email ID',
                                        counterText: "",
                                        labelStyle: TextStyle(
                                            fontFamily: 'opensans',
                                            fontSize: 14),
                                        hintStyle: TextStyle(
                                            fontFamily: 'opensans',
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    child: TextFormField(
                                      controller: model.txtPassword,
                                      maxLength: 20,
                                      obscureText: !model.passwordVisible,
                                      textInputAction: TextInputAction.done,
                                      focusNode: model.focusPassword,
                                      validator: pwdValidator,
                                      onChanged: (newText) {
                                        model.updatePassword(newText);
                                      },
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                            icon: Icon(
                                              model.passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Colors.black,
                                            ),
                                            onPressed: () {
                                              model.passwordToggle();
                                            }),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0.0, horizontal: 10.0),
                                        hintText: 'Enter Password',
                                        labelText: 'Password',
                                        counterText: "",
                                        labelStyle: TextStyle(
                                            fontFamily: 'opensans',
                                            fontSize: 14),
                                        hintStyle: TextStyle(
                                            fontFamily: 'opensans',
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  ForgotPasswordButton(),
                                  SizedBox(height: 30),
                                  Builder(
                                    builder: (context) => BlockButtonWidget(
                                      text: 'LOG IN',
                                      color: colorTheme,
                                      onPressed: () {
                                        if (_loginFormKey.currentState.validate()) {
                                          model.loginWithEmail(context);
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              NoAccountRow()
                            ],
                          ),
                        ),
                      ))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //TOGGLE(SHOW/HIDE) PASSWORD FUNCTION

  //EMAIL VALIDATION
  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  //PASSWORD VALIDATION
  String pwdValidator(String value) {
    if (value.length == 0) {
      return 'Enter Password';
    } else {
      return null;
    }
  }
}
