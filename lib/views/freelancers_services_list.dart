import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/views/other_freeLancer_profile.dart';
import 'package:freelance_app/widgets/freelancer_in_service_card.dart';

class FreelancersServicesList extends StatelessWidget {
  const FreelancersServicesList({super.key, required this.serviceTitle});

  final String serviceTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(53, 158, 158, 158),
        title: Text(
          serviceTitle,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Avaliable Freelancers',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color.fromARGB(255, 209, 126, 1)),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: _getFreelancers(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
              
                    if (snapshot.hasError) {
                      return const Center(child: Text('Error'));
                    }
              
                    final freelancers = snapshot.data ?? [];
                    if (freelancers.isEmpty) {
                      return const Center(child: Text('No freelancers available yet'));
                    }
              
                    return ListView.builder(
                        itemCount: freelancers.length,
                        itemBuilder: (context, index) {
                          final freelancer = freelancers[index];
                          return FreelancerInServiceCard(
                              about: freelancer['about'],
                              email: freelancer['email'],
                              full_name: freelancer['full_name']);
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> _getFreelancers() async {
    final freelancersSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('role', isEqualTo: 'free_lancer')
        .get();

    List<Map<String, dynamic>> freelancers = [];

    for (var doc in freelancersSnapshot.docs) {
      List<dynamic> jobTitles = doc['jop_title'] ?? [];
      if (jobTitles.contains(serviceTitle)) {
        freelancers.add({
          'full_name': doc['full_name'],
          'about': doc['About me'],
          'email': doc['email']
          // Add other relevant fields as needed
        });
      }
    }

    return freelancers;
  }
}
