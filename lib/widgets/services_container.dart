import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/views/services_screen.dart';
import 'package:freelance_app/widgets/services_card.dart';
import 'package:freelance_app/services/array_data_for_test.dart';
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
            SizedBox(
              height: 180,
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
                    itemCount: 2,
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
        ));
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
}
