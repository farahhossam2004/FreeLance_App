// ignore_for_file: non_constant_identifier_names

import 'package:freelance_app/models/person.dart';

class FreeLancer extends Person {
  List<String> skills;
  double price;
  String aboutMe;
  List<String> languages;
  

  factory FreeLancer.fromMap(Map<String, dynamic> data) {
    return FreeLancer(
      personName: data['full_name'],
      role: data['role'],
      Email: data['email'],
      country: data['Country'], 
      skills: data['Skills'], 
      price: data['Price'], 
      aboutMe: data['About me'], 
      languages: ['Languages'], 
    );
  }

  FreeLancer(
      {required super.personName,
      required super.role,
      required super.country,
      required this.skills,
      required this.price,
      required this.aboutMe,
      required this.languages,
      required super.Email,
      });


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
