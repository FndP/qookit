import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:qookit/services/getIt.dart';
import 'package:qookit/services/services.dart';
import 'package:qookit/services/user/user_service.dart';
import 'package:qookit/ui/signInSignUp/onboardingView/dietPreferences/diet_preferences_view_model.dart';
import 'package:qookit/ui/signInSignUp/onboardingView/shared_onboarding_widgets.dart';
import 'package:stacked/stacked.dart';

class DietPreferencesView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DietPreferencesViewModel>.reactive(
      viewModelBuilder: () => DietPreferencesViewModel(),
      builder: (context, model, child) {
        return SafeArea(
            child: Scaffold(
          body: Center(
            child: Column(
              children: [
                BackgroundImage(model.background),
                OnboardingTitle(model.title),
                Diets(model, context),
                OnboardingButtons(context, true, false, model.nextRoute)
              ],
            ),
          ),
        ));
      },
    );
  }
}

Widget Diets(DietPreferencesViewModel model, BuildContext context) {
  return ValueListenableBuilder(
    valueListenable: hiveService.dietsListenable,
    builder: (context, box, child) {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 4,
              mainAxisSpacing: 10,
              children: [
                for (String diet in model.diets)
                  DietOption(diet, context, model, box)
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      );
    },
  );
}

Widget DietOption(String label, BuildContext context,
    DietPreferencesViewModel model, Box box) {
  return InkWell(
    child: Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          color: box.containsKey(label) ? Colors.black : Colors.white,
          border: Border.all(
              color: box.containsKey(label)
                  ? Colors.black
                  : Colors.grey)),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: box.containsKey(label) ? Colors.white : Colors.black,
            fontSize: 15,
            height: 1.1,
            fontWeight: FontWeight.w600,
            fontFamily: 'sofia_bold',
          ),
        ),
      ),
    ),
    onTap: () {
      model.updateDiets(label);
    },
  );
}
