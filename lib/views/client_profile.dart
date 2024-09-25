import 'package:flutter/material.dart';
import 'package:freelance_app/models/person.dart';
import 'package:freelance_app/models/person_helpers.dart';
import 'package:freelance_app/views/home.dart';
import 'package:freelance_app/widgets/profile_helpers.dart';

class ClientProfile extends StatelessWidget {
  const ClientProfile({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  // Top Profile section
                  ProfileHelpers().getTopProfile(
                    name: PersonHelpers.GetCurrentPerson().getPersonName,
                    role: PersonHelpers.GetCurrentPerson().getPersonrole,
                    rate: PersonHelpers.CalculatePersonRate(
                        PersonHelpers.GetCurrentPerson()),
                  ),

                  SizedBox(height: screenHeight / 20),
                  const Divider(thickness: 1, color: Colors.grey),
                  SizedBox(height: screenHeight / 20),

                  // Profile containers (Country, Jobs)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProfileHelpers().getProfileContainer(
                        title: "Country",
                        item: PersonHelpers.GetCurrentPerson().getPersonCountry,
                      ),
                      ProfileHelpers().getProfileContainer(
                        title: "Jobs",
                        item: PersonHelpers.CalculatePersonJops(
                            PersonHelpers.GetCurrentPerson()),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight / 20),
                  const Divider(thickness: 1, color: Colors.grey),

                  // Posts section
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Posts",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 68, 157, 71),
                        ),
                      ),
                    ),
                  ),

                  // Empty space to represent post section height
                  SizedBox(height: screenHeight / 3 + 50),

                  // Profile Settings button
                  ProfileHelpers().getProfileEndButton(
                    title: "Profile Settings",
                    context: context,
                    page: const HomeScreen(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
