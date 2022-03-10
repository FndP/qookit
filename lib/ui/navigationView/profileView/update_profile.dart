import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qookit/app/theme/colors.dart';
import 'package:qookit/bloc/user_bloc.dart';
import 'package:qookit/elements/block_button_widget.dart';
import 'package:qookit/services/elastic/elastic_service.dart';
import 'package:qookit/services/elastic/endpoints/users_service.dart';
import 'package:qookit/services/services.dart';
import 'package:qookit/services/user/user_service.dart';
import 'package:qookit/services/utilities/string_service.dart';
import 'package:qookit/ui/signInSignUp/loginView/login_components.dart';
import 'package:qookit/ui/signInSignUp/loginView/login_view_model.dart';
import 'package:stacked/stacked.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  static GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  String urlimg1;
  String document_path1;

  TextEditingController nameController = TextEditingController(
      text: hiveService.userBox.get(UserService.displayName, defaultValue: 'Karen'));
  TextEditingController emailController = TextEditingController(
      text: hiveService.userBox.get(UserService.userEmail, defaultValue: ' '));

  @override
  void initState() {
    super.initState();
    urlimg1 = hiveService.userBox.get(UserService.profileImage,
        defaultValue:
            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png');
  }

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
                                  'Edit Profile',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'sofia_bold'),
                                ),
                                SizedBox(width: 30),
                              ],
                            ),
                            SizedBox(height: 30),
                            Column(
                              children: <Widget>[
                                SizedBox(height: 10),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 0, bottom: 10),
                                  child: TextFormField(
                                    controller: nameController,
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
                                    controller: emailController,
                                    maxLength: 100,
                                    enabled: false,
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
                                Builder(
                                  builder: (context) => BlockButtonWidget(
                                    text: 'UPDATE',
                                    color: colorTheme,
                                    onPressed: () {
                                      if (_loginFormKey.currentState
                                          .validate()) {
                                        ///Update profile method
                                        updateProfile(model);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ))),
              )),
        );
      },
    );
  }

  Future<void> updateProfile(LoginViewModel model) async {

    var userId = hiveService.userBox.get(UserService.userId);

    var token = await authService.token;

    final response = await http.patch(
        Uri.https(elasticService.domain , '/v1/user/' + userId),
        headers: {
          'Authorization': 'Bearer $token',
          'accept': 'application/json',
          'Content-Type': 'application/json-patch+json',
        },
        body: json.encode([{'op': 'replace', 'path': 'displayName', 'value': nameController.text}]));
    if(response.statusCode==200){
      await UserBloc().getUserData();
      Navigator.pop(context);
    }
    return response;
  }
}
