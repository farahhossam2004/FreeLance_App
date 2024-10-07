// ignore_for_file: non_constant_identifier_names

class Person {
  String? password;
  String personName;
  final String role;
  final String country;
  String Email;
  List<double> rate = [];
  List<int> jobsFinished = [];

// Constructor
  Person({
    required this.Email,
    required this.personName,
    required this.role,
    required this.country,
    this.password,
  });

  // getters
  String get getPersonName => personName;
  String get getPersonrole => role;
  List<double> get getPersonrate => rate;
  List<int> get getPersonJobs => jobsFinished;
  String get getPersonPassword => password!;
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

  set setPersonPassword(String password) {
    password = password;
  }
}
