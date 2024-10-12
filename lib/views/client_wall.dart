import 'package:flutter/material.dart';
import 'package:freelance_app/widgets/post_a_job_card.dart';
import 'package:freelance_app/widgets/services_container.dart';
import 'package:freelance_app/widgets/top_freelancers_list.dart';

class ClientWall extends StatefulWidget {
  const ClientWall({super.key});

  @override
  State<ClientWall> createState() => _ClientWallState();
}

class _ClientWallState extends State<ClientWall> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: Column(
          children: [
            PostAJobCard(),
            SizedBox(height: 5),
        
            ServicesForYou(),
            Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                    ),
            SizedBox(height: 5,),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star_border, color: Colors.orange, size: 24,),
                Text('Top Rated Freelancers', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                Icon(Icons.star_border, color: Colors.orange, size: 24,),
              ],
            ),
            TopFreelancersList()
          ]
        ),
      
    );
  }
}