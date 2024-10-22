// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/models/client.dart';
import 'package:freelance_app/models/free_lancer.dart';
import 'package:freelance_app/services/user_provider.dart';
import 'package:freelance_app/views/client_profile.dart';
import 'package:freelance_app/views/free_lancer.dart';
import 'package:freelance_app/views/start.dart';
import 'package:provider/provider.dart';
class MenuDrawerScreen extends StatelessWidget {
  const MenuDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    Client? clientData = userProvider.client;
    FreeLancer? freeLancerData = userProvider.freelancer;
    final profileImageURL = userProvider.client != null
    ? userProvider.client!.imageURL.toString()
    : userProvider.freelancer != null
        ? userProvider.freelancer!.imageURL.toString()
        : ' ';
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.green),
            accountName: Text(
              clientData?.personName ?? freeLancerData?.personName ?? 'User', // Safely access personName
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 25,
                backgroundImage: profileImageURL != null
                    ? NetworkImage(profileImageURL)
                    : null,
                child: profileImageURL == null
                    ? const Icon(Icons.person, color: Colors.white)
                    : null,
              ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              if (clientData != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClientProfile(email: clientData.Email),
                  ),
                );
              } else if (freeLancerData != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FreeLancerProfile(email: freeLancerData.Email),
                  ),
                );
              } else {
                // Handle case when both are null
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('User profile not found.')),
                );
              }
            },
          ),
          const SizedBox(height: 5),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              userProvider.signOut(); // Clear the user data
              // Redirect to Start screen after signing out
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Start()),
                (route) => false, // Remove all previous routes
              );
            },
          ),
        ],
      ),
    );
  }
}

