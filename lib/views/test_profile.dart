// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:freelance_app/views/home.dart';
import 'package:freelance_app/views/payment_view.dart';
import 'package:freelance_app/views/rate.dart';
import 'package:freelance_app/widgets/profile_helpers.dart';

class TestProfile extends StatefulWidget {
  const TestProfile({super.key});

  @override
  State<TestProfile> createState() => _TestProfileState();
}

class _TestProfileState extends State<TestProfile> {
  bool isselected = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    List<dynamic> skills = ["Java", "kotlin", 'c++', 'c'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  //==========================================
                  ProfileHelpers().getTopProfile(
                    name: "Ziad Yasser",
                    role: "UI/UX",
                    rate: 5,
                  ),
                  //=========================================
                  SizedBox(height: screenHeight / 20),

                  const Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  SizedBox(height: screenHeight / 20),

                  //====================================================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProfileHelpers().getProfileContainer(
                        title: "Country",
                        item: "Egypt",
                      ),
                      ProfileHelpers()
                          .getProfileContainer(title: "Jobs", item: '0'),
                      ProfileHelpers()
                          .getProfileContainer(title: "Price", item: "150"),
                    ],
                  ),
                  //==============================================
                  SizedBox(height: screenHeight / 20),
                  const Divider(
                    thickness: 2,
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
                          children: skills.map((skill) {
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
                          children: skills.map((skill) {
                            return ProfileHelpers()
                                .skillcontainer(title: skill);
                          }).toList(),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight / 20),
                  const Divider(
                    thickness: 2,
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
                            color: const Color.fromARGB(255, 181, 177, 177)),
                        borderRadius: BorderRadius.circular(40)),
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "about meeeeeeeeeeeeeee heheeeeeeee",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight / 20),
                  const Divider(
                    thickness: 2,
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
                        children: skills.map((language) {
                          return ProfileHelpers()
                              .skillcontainer(title: language);
                        }).toList()),
                  ),

                  SizedBox(height: screenHeight / 20),
                  const Divider(
                    thickness: 2,
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
                          page: const HomeScreen()),
                          ProfileHelpers().getProfileEndButton(
                                  title: "Rate",
                                  context: context,
                                  color: 'yellow',
                                  page: Rate(email: "memes2@gmail.com")),
                      ProfileHelpers().getProfileEndButton(
                          title: "Send Money",
                          context: context,
                          color: 'red',
                          page: PaymentView(Personname: "Ziad Yasser")),
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
}
