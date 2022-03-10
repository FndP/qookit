// To parse this JSON data, do
//
//     final unmatchUserReportRequestModel = unmatchUserReportRequestModelFromJson(jsonString);

import 'dart:convert';

UnmatchUserReportRequestModel unmatchUserReportRequestModelFromJson(String str) => UnmatchUserReportRequestModel.fromJson(json.decode(str));

String unmatchUserReportRequestModelToJson(UnmatchUserReportRequestModel data) => json.encode(data.toJson());
///Create user model class
class UnmatchUserReportRequestModel {
  UnmatchUserReportRequestModel({
    this.userName,
    this.photoUrl,
    this.backgroundUrl,
    this.displayName,
    this.personal,
    this.preferences,
  });

  String userName;
  String photoUrl;
  String backgroundUrl;
  String displayName;
  Personal personal;
  Preferences preferences;

  factory UnmatchUserReportRequestModel.fromJson(Map<String, dynamic> json) => UnmatchUserReportRequestModel(
    userName: json['userName'],
    photoUrl: json['photoUrl'],
    backgroundUrl: json['backgroundUrl'],
    displayName: json['displayName'],
    personal: Personal.fromJson(json['personal']),
    preferences: Preferences.fromJson(json['preferences']),
  );

  Map<String, dynamic> toJson() => {
    'userName': userName,
    'photoUrl': photoUrl,
    'backgroundUrl': backgroundUrl,
    'displayName': displayName,
    'personal': personal.toJson(),
    'preferences': preferences.toJson(),
  };
}

class Personal {
  Personal({
    this.firstName,
    this.lastName,
    this.fullName,
    this.email,
    this.aboutMe,
    this.homeUrl,
    this.location,
  });

  String firstName;
  String lastName;
  String fullName;
  String email;
  String aboutMe;
  String homeUrl;
  Location location;

  factory Personal.fromJson(Map<String, dynamic> json) => Personal(
    firstName: json['firstName'],
    lastName: json['lastName'],
    fullName: json['fullName'],
    email: json['email'],
    aboutMe: json['aboutMe'],
    homeUrl: json['homeUrl'],
    location: Location.fromJson(json['location']),
  );

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'fullName': fullName,
    'email': email,
    'aboutMe': aboutMe,
    'homeUrl': homeUrl,
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
    ipAddr: json['ip_addr'],
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
