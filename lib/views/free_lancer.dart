import 'package:flutter/material.dart';
import 'package:freelance_app/views/login.dart';
import 'package:freelance_app/widgets/profile_helpers.dart';

class FreeLancer extends StatelessWidget {
  const FreeLancer({super.key});

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                    name: "Name ",
                    role: "Role : FreeLancer",
                    rate: 4.2,
                  ),
                  //=========================================
                  SizedBox(height: screenHeight / 20),

                  const Divider(thickness: 1, color: Colors.grey,),
                  SizedBox(height: screenHeight / 20),
                  
                  //====================================================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProfileHelpers().getProfileContainer(
                          title: "Country",
                          item: "Egypt",
                          ),
                      ProfileHelpers().getProfileContainer(
                          title: "Jops",
                          item: "14",
                          ),
                      ProfileHelpers().getProfileContainer(
                          title: "Price",
                          item: "30 \$/h",
                          ),
                    ],
                  ),
                  //==============================================
                  SizedBox(height: screenHeight / 20),
                  const Divider(thickness: 1, color: Colors.grey,),
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
                          children: [
                            ProfileHelpers().skillcontainer(title: "UI/UX"),
                            ProfileHelpers().skillcontainer(title: "Dart"),
                            ProfileHelpers().skillcontainer(title: "Java "),
                            ProfileHelpers().skillcontainer(title: "MobileApp"),
                          ],
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
                          children: [
                            ProfileHelpers().skillcontainer(title: "Kotlin"),
                            ProfileHelpers().skillcontainer(title: "C++"),
                            ProfileHelpers().skillcontainer(title: "Android"),
                            ProfileHelpers().skillcontainer(title: "Flutter"),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight / 20),
                  const Divider(thickness: 1, color: Colors.grey,),
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
                      border: Border.all(color: const Color.fromARGB(255, 181, 177, 177)),
                      borderRadius: BorderRadius.circular(40)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text("sdjijhbidsjfbkdjhhkfdsjfkjsdhkjhkdsjhk iwughfwigiwugh iqiejfhiehjgfi ieuufhiwefuh ddjhfbksjbhfkjfebekej kjdbfkdsbj fbksdjbgksjbdk dkjglsjknksj nljknwl jkhngklkrjgnlrjkhrglsfjkhlgjkhn l kghjolgkhlerk l" , 
                      style:  TextStyle(fontSize: 18 , ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight / 20),
                  const Divider(thickness: 1, color: Colors.grey,),

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
                        height: screenHeight / 8, // Adjust based on the height of your skill container
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ProfileHelpers().skillcontainer(title: "Englisch"),
                            ProfileHelpers().skillcontainer(title: "Germany"),
                            ProfileHelpers().skillcontainer(title: "Arabic"),
                          ],
                        ),
                      ),
                      
                      SizedBox(
                    height: screenHeight / 30,
                  ),

                      ProfileHelpers().getProfileEndButton(title: "Contact", context: context, page: Login())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
