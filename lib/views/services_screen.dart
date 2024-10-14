import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/widgets/services_card.dart';
import 'package:freelance_app/services/array_data_for_test.dart';
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  // final List<Map<String, dynamic>> services = const [
  //   {'title': 'UI/UX Designer', 'noOfFreelancers': 200},
  //   {'title': 'Mobile App Developer', 'noOfFreelancers': 350},
  //   {'title': 'Web Developer', 'noOfFreelancers': 150},
  //   {'title': 'Data Scientist', 'noOfFreelancers': 100},
  //   {'title': 'Graphic Designer', 'noOfFreelancers': 250},
  // ];

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
              child: FutureBuilder<Map<String, int>>(
                future: _getFreelancersCount(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text('Error'));
                  }

                  final jobCount = snapshot.data ?? {};
                  return ListView.builder(
                    itemCount: freelancerJobTitles.length,
                    itemBuilder: (context, index) {
                      final serviceTitle = freelancerJobTitles[index];
                      final noOfFreelancers = jobCount[serviceTitle] ?? 0;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ServiceCard(
                          title: serviceTitle,
                          noOfFreelancers: noOfFreelancers,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  Future<Map<String, int>> _getFreelancersCount() async {
    final freelancersSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('role', isEqualTo: 'free_lancer')
        .get();

    final Map<String, int> jobCount = {};

    for (var doc in freelancersSnapshot.docs) {
      List<dynamic> jobTitles = doc['jop_title'] ?? [];
      for (var title in jobTitles) {
        if (jobCount.containsKey(title)) {
          jobCount[title] = jobCount[title]! + 1;
        } else {
          jobCount[title] = 1;
        }
      }
    }

    return jobCount;
  }

