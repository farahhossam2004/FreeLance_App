// ignore_for_file: non_constant_identifier_names

import 'package:freelance_app/models/person.dart';

class FreeLancer extends Person {
  List<String> skills;
  double price;
  String aboutMe;
  List<String> languages;

  FreeLancer(
      {required super.personName,
      required super.role,
      required super.country,
      required this.skills,
      required this.price,
      required this.aboutMe,
      required this.languages,
      required super.Email,
      required super.password});

  // Overloaded constructor with only Name, Email, password, and Country
  FreeLancer.basic(
      {required super.personName,
      required super.Email,
      required super.password,
      required super.country,
      required super.role})
      : skills = [],
        price = 0.0,
        aboutMe = '',
        languages = [];

  //getters
  List<String> get getFreelancerskills => skills;
  double get getFreelancerPrice => price;
  String get getFreelancerAbout => aboutMe;
  List<String> get getFreeLancerLanguages => languages;

  // Setters
  set setFreeLancerPrice(double price) {
    price = price;
  }

  set setFreeLancerAbout(String about) {
    aboutMe = about;
  }

  set setFreeLancerSkills(List<String> List) {
    skills = List;
  }

  set setFreeLancerLanguages(List<String> list) {
    languages = list;
  }
}
