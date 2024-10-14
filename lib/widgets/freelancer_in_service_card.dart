import 'package:flutter/material.dart';
import 'package:freelance_app/views/other_freeLancer_profile.dart';

class FreelancerInServiceCard extends StatelessWidget {
  FreelancerInServiceCard({super.key, required this.about, required this.email, required this.full_name});
  String full_name;
  String about;
  String email;
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: const Color.fromARGB(255, 209, 126, 1),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(
          full_name,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 209, 126, 1)),
        ),
        subtitle: Text(about),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Color.fromARGB(255, 209, 126, 1),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      OtherFreelancerProfile(email: email)));
        },
      ),
    );
  }
}
