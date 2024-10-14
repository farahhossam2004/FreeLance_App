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
    return 0.0;
  } else {
    double sum = 0;
    for (int i = 0; i < allrates.length; i++) {
      sum += allrates[i];
    }
    double average = sum / allrates.length;
    return (average * 10).round() / 10; // Round to one decimal place
  }
}


  static String CalculatePersonJops(Person person) {
    List<dynamic> alljops = person.getPersonJobs;
    String number = alljops.length.toString();
    if (alljops.isEmpty) {
      return '0';
    } else {
      return number;
    }
  }
}
