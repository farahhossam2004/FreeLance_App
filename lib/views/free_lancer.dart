import 'package:flutter/material.dart';
import 'package:freelance_app/models/free_lancer.dart';
import 'package:freelance_app/views/home.dart';
import 'package:freelance_app/widgets/profile_helpers.dart';
import 'package:freelance_app/services/client_provider.dart';
import 'package:provider/provider.dart';

class FreeLancerProfile extends StatefulWidget {
  FreeLancerProfile({super.key, required this.email});
  String email;

  @override
  State<FreeLancerProfile> createState() => _FreeLancerProfileState();
}

class _FreeLancerProfileState extends State<FreeLancerProfile> {
  FreeLancer? _freeLancer;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Fetch client data if it's not already fetched
    _fetchClientData();
  }

  Future<void> _fetchClientData() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isLoading = false; // Update loading state
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final clientProvider = Provider.of<ClientProvider>(context);

    // CollectionReference users = FirebaseFirestore.instance.collection('Users');

    if (clientProvider.isLoading) {
      return Scaffold(
        appBar: AppBar(backgroundColor: Colors.green),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (clientProvider.freelancer == null) {
      return Scaffold(
        appBar: AppBar(backgroundColor: Colors.green),
        body: const Center(child: Text("Freelancer doesn't exist")),
      );
    }
    _freeLancer = clientProvider.freelancer!;

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
                    name: _freeLancer!.personName,
                    role: _freeLancer!.role,
                    rate: 0.0,
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
                          title: "Country", item: _freeLancer!.country),
                      ProfileHelpers()
                          .getProfileContainer(title: "Jops", item: '0'),
                      ProfileHelpers().getProfileContainer(
                          title: "Price", item: _freeLancer!.getFreelancerPrice.toString()),
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
                            children: _freeLancer!.getFreelancerskills.map((skill) {
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
                            children:_freeLancer!.getFreelancerskills.map((skill) {
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
                            color: const Color.fromARGB(255, 181, 177, 177)),
                        borderRadius: BorderRadius.circular(40)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        _freeLancer!.getFreelancerAbout,
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
                        children: _freeLancer!.getFreeLancerLanguages.map((language) {
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
}
