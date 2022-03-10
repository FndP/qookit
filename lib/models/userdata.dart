// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());
///Create model class for user
class UserDataModel {
  UserDataModel({
    this.id,
    this.userName,
    this.backgroundUrl,
    this.displayName,
    this.personal,
    this.preferences,
    this.recipes,
    this.pantryItems,
  });

  String id;
  String userName;
  String backgroundUrl;
  String displayName;
  Personal personal;
  Preferences preferences;
  List<dynamic> recipes;
  List<dynamic> pantryItems;

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    id: json['id'],
    userName: json['userName'],
    backgroundUrl: json['backgroundUrl'],
    displayName: json['displayName'],
    personal: Personal.fromJson(json['personal']),
    preferences: Preferences.fromJson(json['preferences']),
    recipes: List<dynamic>.from(json['recipes'].map((x) => x)),
    pantryItems: List<dynamic>.from(json['pantryItems'].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'userName': userName,
    'backgroundUrl': backgroundUrl,
    'displayName': displayName,
    'personal': personal.toJson(),
    'preferences': preferences.toJson(),
    'recipes': List<dynamic>.from(recipes.map((x) => x)),
    'pantryItems': List<dynamic>.from(pantryItems.map((x) => x)),
  };
}

class Personal {
  Personal({
    this.firstName,
    this.lastName,
    this.email,
    this.aboutMe,
    this.location,
  });

  String firstName;
  String lastName;
  String email;
  String aboutMe;
  Location location;

  factory Personal.fromJson(Map<String, dynamic> json) => Personal(
    firstName: json['firstName'],
    lastName: json['lastName'],
    email: json['email'],
    aboutMe: json['aboutMe'],
    location: Location.fromJson(json['location']),
  );

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'aboutMe': aboutMe,
    'location': location.toJson(),
  };
}

class Location {
  Location({
    this.city,
    this.state,
    this.country,
    this.zip,
    this.gps,
    this.ipAddr,
  });

  String city;
  String state;
  String country;
  String zip;
  String gps;
  String ipAddr;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    city: json['city'],
    state: json['state'],
    country: json['country'],
    zip: json['zip'],
    gps: json['gps'],
    ipAddr: json["ip_adder"],
  );

  Map<String, dynamic> toJson() => {
    'city': city,
    'state': state,
    'country': country,
    'zip': zip,
    'gps': gps,
    'ip_addr': ipAddr,
  };
}

class Preferences {
  Preferences({
    this.units,
    this.recipe,
    this.diet,
  });

  String units;
  List<String> recipe;
  List<String> diet;

  factory Preferences.fromJson(Map<String, dynamic> json) => Preferences(
    units: json['units'],
    recipe: List<String>.from(json['recipe'].map((x) => x)),
    diet: List<String>.from(json['diet'].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    'units': units,
    'recipe': List<dynamic>.from(recipe.map((x) => x)),
    'diet': List<dynamic>.from(diet.map((x) => x)),
  };
}
