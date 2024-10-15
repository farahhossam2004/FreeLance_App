// ignore_for_file: non_constant_identifier_names
class Person {
  String? imageURL;
  String personName;
  final String role;
  final String country;
  String Email;
  List<dynamic> rate = [];
  List<dynamic> jobsFinished = [];

// Constructor
  Person(
      {this.imageURL,
      required this.Email,
      required this.personName,
      required this.role,
      required this.country,
      required this.rate});

  // getters
  String get getPersonName => personName;
  String get getPersonrole => role;
  List<dynamic> get getPersonrate => rate;
  List<dynamic> get getPersonJobs => jobsFinished;
  String get getPersonCountry => country;
  String get getPersonEmail => Email;
  String get getImageURL => imageURL!;
}
