import 'package:email_validator/email_validator.dart' as Validator;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qookit/app/theme/colors.dart';
import 'package:qookit/elements/block_button_widget.dart';
import 'package:qookit/services/utilities/string_service.dart';
import 'package:qookit/ui/signInSignUp/loginView/login_components.dart';
import 'package:qookit/ui/signInSignUp/loginView/login_view_model.dart';
import 'package:stacked/stacked.dart';

class RegisterView extends StatelessWidget {

  static GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (contest, model, child) {
        return Scaffold(
          body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/signupbg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Form(
                    key: _loginFormKey,
                    child: SingleChildScrollView(
                        child: Container(
                      width: double.infinity,
                      child: Container(
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(230),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  10.0) //                 <--- border radius here
                              ),
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InkWell(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    height: 25, // height of the button
                                    width: 25, // width of the button
                                    child: Center(
                                      child: Image.asset(
                                          'assets/images/back.png',
                                          width: 25,
                                          height: 25,
                                          fit: BoxFit.contain),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                Text(
                                  'Sign up',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'sofia_bold'),
                                ),
                                SizedBox(width: 30),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Sign up with:',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'opensans'),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ThirdPartyIcons(),
                            SizedBox(height: 10),
                            Text(
                              'OR',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'opensans'),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'With an email address:',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'opensans'),
                            ),
                            SizedBox(height: 10),
                            Column(
                              children: <Widget>[
                                SizedBox(height: 10),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 0, bottom: 10),
                                  child: TextFormField(
                                    controller: model.txtName,
                                    maxLength: 100,
                                    validator: nameValidator,
                                    textInputAction: TextInputAction.next,
                                    focusNode: model.focusName,
                                    onFieldSubmitted: (term) {
                                      model.focusName.unfocus();
                                      FocusScope.of(context)
                                          .requestFocus(model.focusNumber);
                                    },
                                    onChanged: (value) {
                                      model.updateName(value);
                                    },
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0.0, horizontal: 10.0),
                                        hintText: 'Enter Full Name',
                                        labelText: 'Name',
                                        counterText: '',
                                        labelStyle: TextStyle(
                                            fontFamily: 'opensans',
                                            fontSize: 14),
                                        hintStyle: TextStyle(
                                            fontFamily: 'opensans',
                                            fontSize: 14)),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 5, bottom: 10),
                                  child: TextFormField(
                                    controller: model.txtEmailId,
                                    maxLength: 100,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    focusNode: model.focusNumber,
                                    validator: emailValidator,
                                    onFieldSubmitted: (term) {
                                      model.focusNumber.unfocus();
                                      FocusScope.of(context)
                                          .requestFocus(model.focusPassword);
                                    },
                                    onChanged: (value) {
                                      model.updateEmail(value);
                                    },
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0.0, horizontal: 10.0),
                                        hintText: 'Enter Email ID',
                                        labelText: 'Email ID',
                                        counterText: '',
                                        labelStyle: TextStyle(
                                            fontFamily: 'opensans',
                                            fontSize: 14),
                                        hintStyle: TextStyle(
                                            fontFamily: 'opensans',
                                            fontSize: 14)),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 0, bottom: 10),
                                  child: TextFormField(
                                    controller: model.txtPassword,
                                    maxLength: 20,
                                    validator: pwdValidator,
                                    obscureText: !model.showPassword,
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (term) {
                                      model.focusPassword.unfocus();
                                      FocusScope.of(context).requestFocus(
                                          model.focusConfirmPassword);
                                    },
                                    onChanged: (value) {
                                      model.updatePassword(value);
                                    },
                                    focusNode: model.focusPassword,
                                    decoration: InputDecoration(
                                        errorMaxLines: 3,
                                        suffixIcon: model.showPassword
                                            ? IconButton(
                                                icon: Icon(Icons
                                                    .visibility_off_outlined),
                                                onPressed: () {
                                                  model.toggleShowPassword();
                                                },
                                              )
                                            : IconButton(
                                                icon: Icon(
                                                    Icons.visibility_outlined),
                                                onPressed: () {
                                                  model.toggleShowPassword();
                                                },
                                              ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0.0, horizontal: 10.0),
                                        hintText: 'Enter Password',
                                        labelText: 'Password',
                                        counterText: '',
                                        labelStyle: TextStyle(
                                            fontFamily: 'opensans',
                                            fontSize: 14),
                                        hintStyle: TextStyle(
                                            fontFamily: 'opensans',
                                            fontSize: 14)),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 0, bottom: 10),
                                  child: TextFormField(
                                    controller: model.txtConfirmPassword,
                                    maxLength: 20,
                                    validator: confirmPwdValidator,
                                    obscureText: !model.confirmShowPassword,
                                    textInputAction: TextInputAction.done,
                                    focusNode: model.focusConfirmPassword,
                                    onChanged: (value) {
                                      model.updateConfirm(value);
                                    },
                                    decoration: InputDecoration(
                                        suffixIcon: model.confirmShowPassword
                                            ? IconButton(
                                                icon: Icon(Icons
                                                    .visibility_off_outlined),
                                                onPressed: () {
                                                  model
                                                      .toggleShowConfirmPassword();
                                                },
                                              )
                                            : IconButton(
                                                icon: Icon(
                                                    Icons.visibility_outlined),
                                                onPressed: () {
                                                  model
                                                      .toggleShowConfirmPassword();
                                                },
                                              ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0.0, horizontal: 10.0),
                                        hintText: 'Enter Confirm Password',
                                        labelText: 'Confirm Password',
                                        counterText: '',
                                        labelStyle: TextStyle(
                                            fontFamily: 'opensans',
                                            fontSize: 14),
                                        hintStyle: TextStyle(
                                            fontFamily: 'opensans',
                                            fontSize: 14)),
                                  ),
                                ),
                                SizedBox(height: 30),
                                Builder(
                                  builder: (context) => BlockButtonWidget(
                                    text: 'SIGN UP',
                                    color: colorTheme,
                                    onPressed: () {
                                      if (_loginFormKey.currentState.validate()) {
                                        model.signUpWithEmail(context);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('By signing up you agree to our ',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'opensans')),
                                Flexible(
                                  child: InkWell(
                                    child: Column(
                                      children: <Widget>[
                                        Text('user agreement',
                                            style: TextStyle(
                                                color: colorTheme,
                                                fontSize: 16,
                                                height: 1.2,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'opensans')),
                                        Container(
                                            color: Colors.yellow,
                                            height: 1,
                                            width: 115)
                                      ],
                                    ),
                                    onTap: () {
                                      //navigateToLoginPage(context);
                                    },
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ))),
              )),
        );
      },
    );
  }

  void forgotPassword(LoginViewModel model, BuildContext context) {
    model.txtEmailIDForgotPassword.clear();
    showDialog(
      context: context,
      builder: (context1) {
        return StatefulBuilder(
          builder: (context1, setState1) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 0,
              insetPadding: EdgeInsets.all(20),
              backgroundColor: Colors.transparent,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Wrap(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context1);
                              },
                              child: Container(
                                height: 15,
                                width: 15,
                                child: Image.asset(
                                  "assets/images/close.png",
                                  height: 17,
                                  width: 17,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/forgot_password.png",
                              height: 80,
                              width: MediaQuery.of(context).size.width * 0.7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("FORGOT YOUR PASSWORD?",
                                    style: TextStyle(
                                        color: colorTheme,
                                        fontSize: 18,
                                        fontFamily: 'sofia_bold'))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Flexible(
                                  child: Padding(
                                    child: Text(
                                        "Enter your email address we will send you the 4 digit verification code",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: colorTheme,
                                            fontSize: 13,
                                            fontFamily: 'sofia_bold')),
                                    padding: EdgeInsets.only(
                                        left: 20, right: 20, top: 5),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 22,
                                ),
                                Text(
                                  "Email ID",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'sofia',
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 15,
                                        right: 15,
                                        top: 5,
                                        bottom: 10),
                                    child: TextFormField(
                                      controller:
                                          model.txtEmailIDForgotPassword,
                                      maxLength: 40,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.done,
                                      focusNode: model.focusEmailId,
                                      onFieldSubmitted: (term) {
                                        model.focusEmailId.unfocus();
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0.0, horizontal: 10.0),
                                        hintText: 'Enter Email ID',
                                        counterText: "",
                                        labelStyle: TextStyle(
                                            fontFamily: 'seg', fontSize: 14),
                                        hintStyle: TextStyle(
                                            fontFamily: 'seg', fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0)),
                                          borderSide: BorderSide(
                                              color: Colors.black26,
                                              width: 1.0),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0)),
                                          borderSide: const BorderSide(
                                              color: Colors.black26,
                                              width: 1.0),
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        new SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          onTap: () {
                            if (model.txtEmailIDForgotPassword.text == "") {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context1) => Card(
                                        child: Column(
                                          children: [
                                            Text('Validation Failed'),
                                            Text("Please enter valid email id")
                                          ],
                                        ),
                                      ));
                            } else if (!Validator.EmailValidator.Validate(
                                model.txtEmailIDForgotPassword.text.trim())) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context1) => Card(
                                        child: Column(
                                          children: [
                                            Text('Validation Failed'),
                                            Text("Please enter valid email id")
                                          ],
                                        ),
                                      ));
                            } else {
                              Navigator.pop(context1);
                            }
                          },
                          child: Center(
                            child: Container(
                              width: 120,
                              height: 37,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: LinearGradient(
                                  colors: [
                                    colorTheme,
                                    colorTheme,
                                    colorTheme,
                                  ],
                                ),
                              ),
                              child: GestureDetector(
                                child: Center(
                                  child:  GestureDetector(
                                      child:  Text("SUBMIT",
                                          style: TextStyle(
                                              color: colorTheme2,
                                              fontSize: 15,
                                              height: 1.2,
                                              fontFamily: 'sofia_bold'))),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context1);
                      },
                      child: Container(
                        child: Image.asset(
                          "assets/images/close.png",
                          width: 35,
                          height: 35,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
