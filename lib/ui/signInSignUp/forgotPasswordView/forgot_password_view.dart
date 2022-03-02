import 'package:flutter/material.dart';
import 'package:qookit/ui/signInSignUp/forgotPasswordView/forgot_password_view_model.dart';
import 'package:stacked/stacked.dart';

import 'forgot_password_components.dart';

class ForgotPasswordView extends StatelessWidget {
  static const String id = 'forgot_password_screen';

  static GlobalKey<FormState> _forgotpasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
      viewModelBuilder: () => ForgotPasswordViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration:  BoxDecoration(
              image:  DecorationImage(
                image:  ExactAssetImage('assets/images/forgotbg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Form(
                  key: _forgotpasswordFormKey,
                  child: SingleChildScrollView(
                      child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 0),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.95,
                      child: Container(
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(230),
                          borderRadius: BorderRadius.all(Radius.circular(10.0) //                 <--- border radius here
                              ),
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 30,
                            ),
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
                                        "assets/images/back.png",
                                        width: 25,
                                        height: 25,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                Text(
                                  'Forgot\nPassword',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'sofia_bold',
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                              ],
                            ),
                            ForgotPassMessage(),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 10),
                                  child: TextFormField(
                                    controller: model.txtEmailId,
                                    maxLength: 100,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.done,
                                    focusNode: model.focusNumber,
                                    validator: emailValidator,
                                    onChanged: (newEmail) {
                                      model.updateEmail(newEmail);
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0.0, horizontal: 10.0),
                                      hintText: 'Enter Email ID',
                                      labelText: 'Email ID',
                                      counterText: '',
                                      labelStyle:  TextStyle(
                                          fontFamily: 'opensans', fontSize: 14),
                                      hintStyle:  TextStyle(
                                          fontFamily: 'opensans', fontSize: 14),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                ),
                                if(!model.emailSent)SendEmailButton(_forgotpasswordFormKey),
                                if(model.emailSent) BackToLoginButton()
                              ],
                            ),
                            SizedBox(
                              height: 150,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))),
            )),
      ),
    );
  }

  //EMAIL VALIDATION
  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex =  RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }
}
