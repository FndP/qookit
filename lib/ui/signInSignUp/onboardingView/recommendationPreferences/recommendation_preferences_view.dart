import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:qookit/services/getIt.dart';
import 'package:qookit/services/services.dart';
import 'package:qookit/services/user/user_service.dart';
import 'package:qookit/ui/signInSignUp/onboardingView/recommendationPreferences/recommendation_preferences_view_model.dart';
import 'package:qookit/ui/signInSignUp/onboardingView/shared_onboarding_widgets.dart';
import 'package:stacked/stacked.dart';

class RecommendationPreferences extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecommendationPreferencesViewModel>.reactive(
      viewModelBuilder: () => RecommendationPreferencesViewModel(),
      builder: (context, model, child) {
        return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      BackgroundImage(model.background),
                      OnboardingTitle(model.title + ' ${hiveService.userBox.get(UserService.displayName, defaultValue: 'Karen')}!'),
                      OnboardingSubtitle(model.subtitle),
                      Recommendations(model, context),
                      OnboardingButtons(context, true, false, model.nextRoute)
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }

  Widget Recommendations(RecommendationPreferencesViewModel model, BuildContext context){
    return ValueListenableBuilder(
      valueListenable: hiveService.recommendationsListenable,
      builder: (context, box, child) {
        return Center(
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                for (String rec in model.recs) RecommendationOption(
                    rec, context, model,box)
              ],
            )
        );
      },
    );
  }

  Widget RecommendationOption(String label, BuildContext context,
      RecommendationPreferencesViewModel model,Box box) {
    return Column(
      children: [
        InkWell(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            height: 45,
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
                color: box.containsKey(label)
                    ? Colors.black
                    : Colors.white,
                border: Border.all(
                    color: box.containsKey(label)
                        ? Colors.black
                        : Colors.grey)),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  color: box.containsKey(label)
                      ? Colors.white
                      : Colors.black,
                  fontSize: 15,
                  height: 1.1,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'sofia_bold',
                ),
              ),
            ),
          ),
          onTap: () {
            model.updateRecommendations(label);
          },
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

