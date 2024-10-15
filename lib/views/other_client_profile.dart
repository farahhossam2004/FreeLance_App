// ignore_for_file: must_be_immutable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/models/person_helpers.dart';
import 'package:freelance_app/services/user_provider.dart';
import 'package:freelance_app/views/chats_inbox_screen.dart';
import 'package:freelance_app/views/rate.dart';
import 'package:freelance_app/widgets/profile_helpers.dart';
import 'package:provider/provider.dart';

class OtherClientProfile extends StatelessWidget {
  //=======================================================
  OtherClientProfile({super.key, required this.email});
  String email;
  //=======================================================
  @override
  Widget build(BuildContext context) {
    final currentUserEmail = Provider.of<UserProvider>(context).email;

    CollectionReference clients =
        FirebaseFirestore.instance.collection('Users');

    double screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder<DocumentSnapshot>(
        future: clients.doc(email).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("client doesn't exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            List<dynamic> array = data['rate'];
            
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.green,
              ),
              body: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          // Top Profile section
                          ProfileHelpers().getTopProfile(
                              profileImageURL: data['image_url'],
                              name: data['full_name'],
                              role: data['role'],
                              rate: PersonHelpers.CalculatePersonRate(array)
                              // data['rate']
                              ),
                          SizedBox(height: screenHeight / 20),
                          const Divider(thickness: 1, color: Colors.grey),
                          SizedBox(height: screenHeight / 20),

                          // Profile containers (Country, Jobs)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ProfileHelpers().getProfileContainer(
                                title: 'Country',
                                item: data['Country'],
                              ),
                              ProfileHelpers().getProfileContainer(
                                title: "Reviews",
                                item: array.length.toString(),
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
                              title: "Contact",
                              context: context,
                              onTap: () async {
                                await ChatsInboxScreen.navigateToChatScreen(
                                    imageURL: data['image_url'],
                                    context,
                                    currentUserEmail!, 
                                    data['email'], 
                                    data['full_name'] 
                                    );
                              },

                              color: 'green'),

                          ProfileHelpers().getProfileEndButton(
                              title: "Rate",
                              context: context,
                              color: 'yellow',
                              page: Rate(email: data['email'])),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return const Text(
            "loading",
          );
        });
  }
}
