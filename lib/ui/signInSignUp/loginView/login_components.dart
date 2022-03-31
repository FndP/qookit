import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qookit/app/app_router.gr.dart';
import 'package:qookit/ui/signInSignUp/loginView/login_view_model.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordButton extends ViewModelWidget<LoginViewModel> {
  @override
  Widget build(BuildContext context, LoginViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 20),
          child: InkWell(
            child: Container(
              padding: EdgeInsets.only(top:16,bottom: 16),
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  shadows: [Shadow(color: Colors.black, offset: Offset(0, -8))],
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.amber,
                  decorationThickness: 2,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ),
            onTap: () {
              ExtendedNavigator.named('topNav').push(Routes.forgotPasswordView);
            },
          ),
        ),
      ],
    );
  }
}

class NoAccountRow extends ViewModelWidget<LoginViewModel> {
  @override
  Widget build(BuildContext context, LoginViewModel model) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            "Don't have an Account?",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'opensans',
            ),
          ),
        ),
        InkWell(
          child: Padding(
            child: Column(
              children: <Widget>[
                Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.transparent,
                      shadows: [Shadow(offset: Offset(0, -5))],
                      fontSize: 16,
                      height: 1.2,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'opensans',
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      decorationColor: Colors.amber),
                ),
              ],
            ),
            padding: EdgeInsets.all(10),
          ),
          onTap: () {
            ExtendedNavigator.named('topNav').replace(Routes.registerView);
          },
        )
      ],
    );
  }
}

class ThirdPartyIcons extends ViewModelWidget<LoginViewModel> {
  ThirdParty amazon = ThirdParty(image: 'assets/images/amazone_icon.png', label: 'Amazon');
  ThirdParty facebook = ThirdParty(image: 'assets/images/facebook_icon.png', label: 'Facebook');
  ThirdParty google = ThirdParty(image: 'assets/images/google_icon.png', label: 'Google');
  ThirdParty apple = ThirdParty(image: 'assets/images/apple_icon.png', label: 'Apple');

  @override
  Widget build(BuildContext context, model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SingleIcon(amazon, model),
        SingleIcon(facebook, model),
        SingleIcon(google, model),
        SingleIcon(apple, model)
      ],
    );
  }

  Widget SingleIcon(ThirdParty party, LoginViewModel model) {
    return Builder(
      builder: (context) => InkWell(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Center(
            child: Image.asset(
              party.image,
              height: 40,
              width: 40,
              fit: BoxFit.contain,
            ),
          ),
        ),
        onTap: () {
          switch (party.label) {
            case 'Amazon':
              model.loginWithAmazon(context);
              break;
            case 'Facebook':
              model.loginWithFacebook(context);
              break;
            case 'Google':
              model.loginWithGoogle(context);
              break;
            case 'Apple':
              model.loginWithApple(context);
              break;
          }
        },
      ),
    );
  }
}

class ThirdParty {
  String image;
  String label;

  ThirdParty({this.image, this.label});
}
