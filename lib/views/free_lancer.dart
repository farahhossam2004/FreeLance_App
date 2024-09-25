import 'package:flutter/material.dart';
import 'package:freelance_app/models/person_helpers.dart';
import 'package:freelance_app/views/home.dart';
import 'package:freelance_app/widgets/profile_helpers.dart';

class FreeLancerProfile extends StatelessWidget {
  FreeLancerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<String> skills =
        PersonHelpers.GetCurrentfreeLancer().getFreelancerskills;
    List<String> languages =
        PersonHelpers.GetCurrentfreeLancer().getFreeLancerLanguages;

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
                    name: PersonHelpers.GetCurrentfreeLancer().getPersonName,
                    role: PersonHelpers.GetCurrentfreeLancer().getPersonrole,
                    rate: PersonHelpers.CalculatePersonRate(PersonHelpers.GetCurrentfreeLancer()),
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
                        title: "Country",
                        item: PersonHelpers.GetCurrentfreeLancer()
                            .getPersonCountry,
                      ),
                      ProfileHelpers().getProfileContainer(
                        title: "Jops",
                        item: PersonHelpers.CalculatePersonJops(
                                PersonHelpers.GetCurrentfreeLancer())
                            .toString(),
                      ),
                      ProfileHelpers().getProfileContainer(
                        title: "Price",
                        item: (PersonHelpers.GetCurrentfreeLancer()
                                .getFreelancerPrice)
                            .toString(),
                      ),
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
                          children: 
                            skills.map((skill) {
                              return ProfileHelpers()
                                  .skillcontainer(title: skill);
                            }).toList()
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
                            }).toList()
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
                            color: const Color.fromARGB(255, 181, 177, 177)),
                        borderRadius: BorderRadius.circular(40)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        PersonHelpers.GetCurrentfreeLancer().getFreelancerAbout,
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
                      children: languages.map((language) {
                              return ProfileHelpers()
                                  .skillcontainer(title: language);
                            }).toList()
                    ),
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
}
