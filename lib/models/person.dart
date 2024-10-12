// ignore_for_file: non_constant_identifier_names

class Person {
  String personName;
  final String role;
  final String country;
  String Email;
  List<dynamic> rate = [];
  List<int> jobsFinished = [];

// Constructor
  Person({
    required this.Email,
    required this.personName,
    required this.role,
    required this.country,
    required this.rate
  });

  // getters
  String get getPersonName => personName;
  String get getPersonrole => role;
  List<dynamic> get getPersonrate => rate;
  List<int> get getPersonJobs => jobsFinished;
  String get getPersonCountry => country;
    String get getPersonEmail => Email;


  // Setters
  set setpersonName(String name) {
    personName = name;
  }

  set setpersonrate(List<double> rates) {
    rate = rates;
  }

  set setjobs_Finished(List<int> jobs) {
    jobsFinished = jobs;
  }

  
}
