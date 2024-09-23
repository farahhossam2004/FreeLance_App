import 'package:flutter/material.dart';
import 'package:freelance_app/views/services_screen.dart';
import 'package:freelance_app/widgets/services_card.dart';

class ServicesForYou extends StatelessWidget {
  const ServicesForYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Services for you',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ServicesScreen()));
                  },
                  child: const Row(
                    children: [
                      Text(
                        'View all',
                        style: TextStyle(
                            color: Color.fromARGB(255, 18, 134, 77),
                            fontSize: 16),
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: 14, color: Color.fromARGB(255, 18, 134, 77)),
                    ],
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              height: 180,
              child: ListView(
                children: const [
                  ServiceCard(title: 'UI/UX Designer', noOfFreelancers: 200),
                  SizedBox(
                    height: 10,
                  ),
                  ServiceCard(
                      title: 'Mobile App Developer', noOfFreelancers: 350)
                ],
              ))
        ],
      ),
    );
  }
}
