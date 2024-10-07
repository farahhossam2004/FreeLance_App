import 'package:freelance_app/models/person.dart';

class Client extends Person {
  double clientRate;
  // To Be implemented
  Client(
      {required super.personName,
      required super.role,
      required super.country,
      required super.Email,
      super.password, this.clientRate = 0});

  factory Client.fromMap(Map<String, dynamic> data) {
    return Client(
      personName: data['full_name'],
      role: data['role'],
      Email: data['email'],
      country: data['Country'],
      clientRate: 0.0
    );
  }
}
