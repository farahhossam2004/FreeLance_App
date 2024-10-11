// ignore_for_file: must_be_immutable, unused_field

import 'package:flutter/material.dart';
import 'package:freelance_app/models/client.dart';
import 'package:freelance_app/services/client_provider.dart';
//import 'package:freelance_app/services/users_data.dart';
import 'package:freelance_app/views/home.dart';
import 'package:freelance_app/widgets/profile_helpers.dart';
import 'package:provider/provider.dart';

class ClientProfile extends StatefulWidget {
  ClientProfile({super.key, required this.email});
  String email;

  @override
  State<ClientProfile> createState() => _ClientProfileState();
}

class _ClientProfileState extends State<ClientProfile> {
  Client? _client;
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
    double screenHeight = MediaQuery.of(context).size.height;
    final clientProvider = Provider.of<ClientProvider>(context);
    if (clientProvider.isLoading) {
      return Scaffold(
        appBar: AppBar(backgroundColor: Colors.green),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (clientProvider.client == null) {
      return Scaffold(
        appBar: AppBar(backgroundColor: Colors.green),
        body: const Center(child: Text("Client doesn't exist")),
      );
    }

    _client = clientProvider.client!;

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
                    name: _client!.personName,
                    role: _client!.role,
                    rate: 0.0,
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
                        item: _client!.country,
                      ),
                      ProfileHelpers().getProfileContainer(
                        title: "Jobs",
                        item: '0',
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
                    color: 'green'
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
