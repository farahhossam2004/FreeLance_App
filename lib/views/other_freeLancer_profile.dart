// ignore_for_file: must_be_immutable, file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/models/person_helpers.dart';
import 'package:freelance_app/services/user_provider.dart';
import 'package:freelance_app/views/chats_inbox_screen.dart';
import 'package:freelance_app/views/home.dart';
import 'package:freelance_app/views/payment_view.dart';
import 'package:freelance_app/views/rate.dart';
import 'package:freelance_app/widgets/profile_helpers.dart';
import 'package:provider/provider.dart';
class OtherFreelancerProfile extends StatelessWidget {
  OtherFreelancerProfile({super.key, required this.email});
  String? email;
  @override
  Widget build(BuildContext context) {
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
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          //==========================================
                          ProfileHelpers().getTopProfile(
                            profileImageURL: data['image_url'],
                            name: data['full_name'],
                            role: data['jop_title'][0],
                            rate:  PersonHelpers.CalculatePersonRate(data['rate'] ),
                          ),
                          //=========================================
                          SizedBox(height: screenHeight / 20),

                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          SizedBox(height: screenHeight / 20),

                          //====================================================
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ProfileHelpers().getProfileContainer(
                                  title: "Country", item: data['Country']),
                              ProfileHelpers().getProfileContainer(
                                  title: "Reviews", item: array.length.toString() ),
                              ProfileHelpers().getProfileContainer(
                                  title: "Price",
                                  item: data['Price'].toString()),
                            ],
                          ),
                          //==============================================
                          SizedBox(height: screenHeight / 20),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          SizedBox(height: screenHeight / 25),
                          //=============================================
                          const Center(
                            child: Text(
                              "Skills",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                          ),
                          //===============================================
                          // ============================= SKILLS ============================
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                height: screenHeight /
                                    8, // Adjust based on the height of your skill container
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: (data['Skills'] as List<dynamic>)
                                      .map((skill) {
                                    return ProfileHelpers()
                                        .skillcontainer(title: skill);
                                  }).toList(),
                                ),
                              ),
                              //==================================================
                              SizedBox(height: screenHeight / 200),
                              //==================================================
                              SizedBox(
                                height: screenHeight /
                                    13, // Adjust based on the height of your skill container
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: (data['Skills'] as List<dynamic>)
                                      .map((skill) {
                                    return ProfileHelpers()
                                        .skillcontainer(title: skill);
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: screenHeight / 20),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          SizedBox(height: screenHeight / 25),

                          const Text(
                            "About ",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),

                          SizedBox(
                            height: screenHeight / 80,
                          ),

                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 181, 177, 177)),
                                borderRadius: BorderRadius.circular(40)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                data['About me'],
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: screenHeight / 20),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),

                          SizedBox(
                            height: screenHeight / 30,
                          ),

                          const Text(
                            "Language",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),

                          SizedBox(
                            height: screenHeight /
                                8, // Adjust based on the height of your skill container
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: (data['Languages'] as List<dynamic>)
                                    .map((language) {
                                  return ProfileHelpers()
                                      .skillcontainer(title: language);
                                }).toList()),
                          ),

                          SizedBox(height: screenHeight / 20),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),

                          SizedBox(
                            height: screenHeight / 50,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ProfileHelpers().getProfileEndButton(
                                  title: "Contact",
                                  context: context,
                                  color: 'green',
                                  onTap: () async{
                                    final currentUserEmail = Provider.of<UserProvider>(context, listen: false).email;
                                    await ChatsInboxScreen.navigateToChatScreen(
                                      imageURL: data['image_url'],
                                    context,
                                    currentUserEmail!, 
                                    data['email'], 
                                    data[
                                        'full_name'] 
                                    );
                                  },
                                  page: const HomeScreen()),

                                  ProfileHelpers().getProfileEndButton(
                                  title: "Rate",
                                  context: context,
                                  color: 'yellow',
                                  page: Rate(email: data['email'])),
                              
                              ProfileHelpers().getProfileEndButton(
                                  title: "Send Money",
                                  context: context,
                                  color: 'red',
                                  page:  PaymentView(Personname: data['full_name'])),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Text("Loading");
        });
  }
}
