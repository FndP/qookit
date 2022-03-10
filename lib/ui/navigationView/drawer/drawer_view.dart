import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_lwa/lwa.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qookit/models/location.dart';
import 'package:qookit/models/personal.dart';
import 'package:qookit/models/preference.dart';
import 'package:qookit/models/user.dart';
import 'package:qookit/services/elastic/endpoints/recipes_service.dart';
import 'package:qookit/services/services.dart';

class NavDrawer extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Text('QOOKIT')),
          ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: Text('Log out'),
                onTap: () async {

                  authService.signOut(context);
                  await _googleSignIn.disconnect();
                  await FacebookLogin().logOut();
                  await LoginWithAmazon().signOut();
                  //await ExtendedNavigator.named('topNav').pushAndRemoveUntil(Routes.splashScreenView, (route) => false);
                },
              ),
              ListTile(
                title: Text('Empty pantry'),
                onTap: () async {
                  await hiveService.pantryBox.deleteAll(hiveService.pantryBox.keys);
                  await hiveService.fridgeBox.deleteAll(hiveService.fridgeBox.keys);
                  await hiveService.freezerBox.deleteAll(hiveService.freezerBox.keys);
                },
              ),
              ListTile(
                title: Text('Query Recipes'),
                onTap: () {
                  RecipeParameters queryParameters = RecipeParameters(searchString: 'kale');
                  elasticService.recipesEndpoint.getRecipeFromSearch(queryParameters);
                },
              ),
              ListTile(
                title: Text('Add User'),
                onTap: () async {
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
                        email: 'test1@test.com',
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
                },
              ),
              ListTile(
                title: Text('Query My Recipes'),
                onTap: () {
                  usersService.getUserRecipes(authService.user.uid);
                },
              ),
              ListTile(
                title: Text('Print Token'),
                onTap: () async {
                  print(await authService.token);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
