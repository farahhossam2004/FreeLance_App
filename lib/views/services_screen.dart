import 'package:flutter/material.dart';
import 'package:freelance_app/widgets/services_card.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  final List<Map<String, dynamic>> services = const [
    {'title': 'UI/UX Designer', 'noOfFreelancers': 200},
    {'title': 'Mobile App Developer', 'noOfFreelancers': 350},
    {'title': 'Web Developer', 'noOfFreelancers': 150},
    {'title': 'Data Scientist', 'noOfFreelancers': 100},
    {'title': 'Graphic Designer', 'noOfFreelancers': 250},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Services',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Avaliable Services',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.green),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                return Padding(padding: const EdgeInsets.only(bottom: 10),
                child: ServiceCard(title: service['title'], noOfFreelancers: service['noOfFreelancers']),);
              },
            ))
          ],
        ),
      ),
    );
  }
}
