import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/models/person_helpers.dart';
import 'package:freelance_app/views/home.dart';
import 'package:freelance_app/widgets/profile_helpers.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class FreeLancerProfile extends StatelessWidget {
  FreeLancerProfile({super.key, required this.email});
  String? email;

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    CollectionReference users = FirebaseFirestore.instance.collection('Users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(email).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
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
                          name: data['full_name'],
                          role: data['role'],
                          rate: data['rate'],
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
                            ProfileHelpers()
                                .getProfileContainer(title: "Jops", item: '0'),
                            ProfileHelpers().getProfileContainer(
                                title: "Price", item: data['Price']),
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
                                  children: data['Skills'].map((skill) {
                                    return ProfileHelpers()
                                        .skillcontainer(title: skill);
                                  }).toList()),
                            ),
                            //==================================================
                            SizedBox(height: screenHeight / 200),
                            //==================================================
                            SizedBox(
                              height: screenHeight /
                                  13, // Adjust based on the height of your skill container
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: data['Skills'].map((skill) {
                                    return ProfileHelpers()
                                        .skillcontainer(title: skill);
                                  }).toList()),
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
                                  color:
                                      const Color.fromARGB(255, 181, 177, 177)),
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
                              children: data['Languages'].map((language) {
                                return ProfileHelpers()
                                    .skillcontainer(title: language);
                              }).toList()),
                        ),

                        SizedBox(
                          height: screenHeight / 30,
                        ),

                        ProfileHelpers().getProfileEndButton(
                            title: "Contact",
                            context: context,
                            page: const HomeScreen())
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return ModalProgressHUD(inAsyncCall: true, child: Scaffold());
      },
    );
  }
}
