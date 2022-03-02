import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:qookit/app/app_router.gr.dart';
import 'package:qookit/ui/splashscreenView/splashscreen_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SplashScreenView extends StatelessWidget {
  List<Slide> slides = [];

  Function goToTab;

  final List<String> imgList = [
    'assets/images/splash1.png',
    'assets/images/splash2.png',
    'assets/images/splash3.png',
  ];

  final List<String> txtList = [
    'Meal Planning in 60 Seconds',
    'Your Pantry in your Pocket',
    'Recipes Based On Your Goals',
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      viewModelBuilder: () => SplashScreenViewModel(),
      onModelReady: (model) async => await model.initialize(),
      builder: (context, model, builder) => Scaffold(
          body: model.isBusy?Center(
            child: CircularProgressIndicator(),
          ):Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              height: MediaQuery.of(context).size.height,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                model.updateTitle(index);
              },
            ),
            items: imgList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage(i),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container());
                },
              );
            }).toList(),
          ),

          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 5, right: 10),
                    child: Text(
                      'Qookit',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'sofia_bold',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 5, right: 10),
                    child: Text(
                      txtList[model.titlePositon],
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontFamily: 'opensans',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                  ),
                  GetStartedButton(context),
                  SizedBox(
                    height: 15,
                  ),
                  LoginButton(context),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: InkWell(
                      child: Text(
                        'Maybe Later',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontFamily: 'opensans',
                        ),
                      ),
                      onTap: () {
                        ExtendedNavigator.named('topNav').push(Routes.loginView);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget GetStartedButton(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 5, right: 10),
      child: InkWell(
        splashFactory: InkSplash.splashFactory,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.amber,
              border: Border.all(color: Colors.white)),
          width: 250,
          height: 45,
          child: Center(
            child: Text(
              'GET STARTED',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: 'opensans',
              ),
            ),
          ),
        ),
        onTap: () {
          ExtendedNavigator.named('topNav').push(Routes.registerView);
        },
      ),
    );
  }

  Widget LoginButton(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 5, right: 10),
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.amber)),
          width: 250,
          height: 45,
          child: Center(
            child: Text(
              'LOG IN',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontFamily: 'opensans',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        onTap: () {
          ExtendedNavigator.named('topNav').push(Routes.loginView);
        },
      ),
    );
  }
}
