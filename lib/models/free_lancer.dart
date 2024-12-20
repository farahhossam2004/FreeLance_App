// ignore_for_file: non_constant_identifier_names

import 'package:freelance_app/models/person.dart';

class FreeLancer extends Person {
  List<dynamic> skills;
  double price;
  String aboutMe;
  List<dynamic> languages;
  List<dynamic> joptitle;

  factory FreeLancer.fromMap(Map<String, dynamic> data) {
    return FreeLancer(
        imageURL: data['image_url'],
        personName: data['full_name'],
        role: data['role'],
        Email: data['email'],
        country: data['Country'],
        skills: data['Skills'],
        price: data['Price'],
        aboutMe: data['About me'],
        languages: data['Languages'],
        joptitle: data['jop_title'],
        rate: data['rate']);
  }

  FreeLancer(
      {super.imageURL,
      required super.personName,
      required super.role,
      required super.country,
      required this.skills,
      required this.price,
      required this.aboutMe,
      required this.languages,
      required super.Email,
      required this.joptitle,
      required super.rate});

  //getters
  List<dynamic> get getFreelancerskills => skills;
  double get getFreelancerPrice => price;
  String get getFreelancerAbout => aboutMe;
  List<dynamic> get getFreeLancerLanguages => languages;
  List<dynamic> get getfreeLancerJopTitle => joptitle;

  // Setters
  set setFreeLancerPrice(double price) {
    price = price;
  }

  set setFreeLancerAbout(String about) {
    aboutMe = about;
  }

  set setFreeLancerSkills(List<dynamic> List) {
    skills = List;
  }

  set setFreeLancerLanguages(List<dynamic> list) {
    languages = list;
  }
}
