// ignore_for_file: non_constant_identifier_names

import 'package:freelance_app/models/person.dart';

class Client extends Person {
  
  // To Be implemented
  Client(
      {required super.personName,
      required super.role,
      required super.country,
      required super.Email,
      required super.rate});

  factory Client.fromMap(Map<String, dynamic> data) {
    return Client(
      personName: data['full_name'],
      role: data['role'],
      Email: data['email'],
      country: data['Country'],
      rate: data['rate']
    );
  }
}
