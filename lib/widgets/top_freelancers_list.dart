import 'package:flutter/material.dart';
import 'package:freelance_app/services/array_data_for_test.dart';
import 'package:freelance_app/widgets/top_freelancer_card.dart';

class TopFreelancersList extends StatelessWidget {
  const TopFreelancersList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView(
        shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: freelancers.map((freelancer) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: 180,
                child: GestureDetector(
                  onTap: () {},
                  child: TopFreelancerCard(name: freelancer['name'], rating: freelancer['rating'], imagePath: freelancer['image'], description: freelancer['bio'],),
                ),
              ),
            );
          }).toList()),
    );
  }
}
