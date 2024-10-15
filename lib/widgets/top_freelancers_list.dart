import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/views/other_freeLancer_profile.dart';
import 'package:freelance_app/widgets/top_freelancer_card.dart';

class TopFreelancersList extends StatelessWidget {
  const TopFreelancersList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .where('role', isEqualTo: 'free_lancer')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No data'));
          }

          final freelancers = snapshot.data!.docs;
          // print(freelancers);
          // Sort the freelancers based on their average rating
          freelancers.sort((a, b) {
            final List<dynamic> ratingsA = a['rate'];
            final List<dynamic> ratingsB = b['rate'];

            double avgRatingA = ratingsA.isNotEmpty
                ? ratingsA.reduce((a, b) => a + b) / ratingsA.length
                : 0.0;

            double avgRatingB = ratingsB.isNotEmpty
                ? ratingsB.reduce((a, b) => a + b) / ratingsB.length
                : 0.0;

            // Sort in descending order (highest rating first)
            return avgRatingB.compareTo(avgRatingA);
          });

          return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: freelancers.length > 8 ? 8 : freelancers.length,
              itemBuilder: (context, index) {
                final freelancer = freelancers[index];
                final name = freelancer['full_name'];
                final about = freelancer['About me'];
                final email = freelancer['email'];
                final imageURL = freelancer['image_url'];

                final ratings = freelancer['rate'] as List<dynamic>;

                final double totalRating = ratings.isNotEmpty
                    ? ratings.reduce((a, b) => a + b) / ratings.length
                    : 0.0;

                final String formattedRating = totalRating.toStringAsFixed(2);
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    width: 180,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    OtherFreelancerProfile(email: email)));
                      },
                      child: TopFreelancerCard(
                        imagePath: imageURL,
                        name: name,
                        rating: formattedRating,
                        description: about,
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
