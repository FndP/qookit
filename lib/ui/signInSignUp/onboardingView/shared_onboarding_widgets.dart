import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qookit/app/theme/colors.dart';
import 'package:qookit/models/location.dart';
import 'package:qookit/models/personal.dart';
import 'package:qookit/models/preference.dart';
import 'package:qookit/models/user.dart';
import 'package:qookit/services/services.dart';
import 'package:qookit/services/user/user_service.dart';
import 'package:stacked/stacked.dart';

class BackgroundImage extends StatelessWidget {
  final String image;

  BackgroundImage(this.image);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 170,
          child: Center(
            child: Image.asset(
              image,
              width: MediaQuery.of(context).size.width,
              height: 170,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 170,
          color: Colors.black38,
        ),
        Padding(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10, top: 5, right: 10),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'sofia_bold',
                  ),
                ),
              ),
            ],
          ),
          padding: EdgeInsets.only(top: 80),
        ),
      ],
    );
  }

}

Widget OnboardingTitle(String title) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 24),
    child: Row(
      children: [
        Flexible(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'sofia_bold',
            ),
          ),
        ),
      ],
    ),
  );
}

Widget OnboardingSubtitle(String subtitle) {
  return Padding(
    padding: EdgeInsets.only(left: 30,right: 30,bottom: 8),
    child: Text(
      subtitle,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: Colors.black,
        fontSize: 13,
      ),
    ),
  );
}

class OnboardingButtons extends StatelessWidget {
  final BuildContext context;
  final bool skip;
  final bool last;
  final String nextRoute;

  OnboardingButtons(this.context, this.skip, this.last, this.nextRoute);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      BlockButtonWidget(
        text: !last ? 'NEXT' : 'SAVE MY PREFERENCES',
        color: colorTheme,
        onPressed: () async {
          if(!last){
            await ExtendedNavigator.named('topNav').push(nextRoute);
          } else{
            await hiveService.userBox.put(UserService.finishedOnboarding, true);
            //usersService.addUserToElastic();
            await usersService.addUserToElastic(
              addUser: UserRoot(
                displayName: 'empty',
                userName: 'testUser',
                preferences: Preference(
                  units: 'Imperial',
                  diet: [],
                  recipe: [],
                ),
                personal: Personal(
                  email: authService.user.email,
                  firstName: 'empty',
                  lastName: 'empty',
                  fullName: 'empty' + ' ' + 'empty',
                  aboutMe: 'Hello',
                  homeUrl: '',
                  location: Location(
                    city: 'empty',
                    country: 'empty',
                    gps: 'empty',
                    ipAddr: 'empty',
                    state: 'empty',
                    zip: 'empty',
                  ),
                ),
                backgroundUrl: '',
                id: userService.uid,
                photoUrl: '',
                recipes: [],
                pantryItems: [],
              ),
            );
           await ExtendedNavigator.named('topNav').pushAndRemoveUntil(nextRoute, (route) => false); // Go to first screen
          }

        },
      ),
      SizedBox(
        height: 20,
      ),
      if (skip)
        Container(
          margin: EdgeInsets.only(bottom: 50),
          child: InkWell(
            child: Text(
              'Skip',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontFamily: 'opensans',
              ),
            ),
            onTap: () {
              //navigateToLoginPage(context);
              ExtendedNavigator.named('topNav').push(nextRoute);
            },
          ),
        ),
    ]);
  }
}

class BlockButtonWidget extends StatelessWidget {
  const BlockButtonWidget(
      {Key key,
      @required this.color,
      @required this.text,
      @required this.onPressed})
      : super(key: key);

  final Color color;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          child: Container(
            width: 250,
            height: 45,
            margin: EdgeInsets.only(left: 5, right: 0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.amber, border: Border.all(color: Colors.white)),
              width: 250,
              height: 45,
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ),
          onTap: () {
            onPressed.call();
          },
        )
      ],
    );
  }
}
