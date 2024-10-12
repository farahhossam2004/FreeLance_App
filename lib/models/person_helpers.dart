// ignore_for_file: non_constant_identifier_names

import 'package:freelance_app/models/person.dart';

class PersonHelpers {
  //==========================================
  static List<Person> allPersonList = [];

  static List<Person> getallPersons() {
    return allPersonList;
  }

//=====================================
  static double CalculatePersonRate(List<dynamic> personrates) {
    List<dynamic> allrates = personrates;
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
