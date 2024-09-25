// ignore_for_file: non_constant_identifier_names

import 'package:freelance_app/models/free_lancer.dart';
import 'package:freelance_app/models/person.dart';

class PersonHelpers {
  //==========================================
  static List<Person> allPersonList = [];

  static List<Person> getallPersons() {
    return allPersonList;
  }

//=====================================
  static Person? current_person;
  static FreeLancer? current_freeLancer;

  static Person GetCurrentPerson() {
    return current_person!;
  }

  static FreeLancer GetCurrentfreeLancer() {
    return current_freeLancer!;
  }

  static void SetCurrentPerson(Person person) {
    current_person = person;
  }

  static void SetCurrentFreeLancer(FreeLancer freelancer) {
    current_freeLancer = freelancer;
  }

//=====================================
  static double CalculatePersonRate(Person person) {
    List<double> allrates = person.getPersonrate;
    if (allrates.isEmpty) {
      return 0;
    } else {
      double sum = 0;
      for (int i = 0; i < allrates.length; i++) {
        sum += allrates[i];
      }
      return sum / allrates.length;
    }
  }

  static String CalculatePersonJops(Person person) {
    List<int> alljops = person.getPersonJobs;
    String number = alljops.length.toString();
    if (alljops.isEmpty) {
      return '0';
    } else {
      return number;
    }
  }
}
