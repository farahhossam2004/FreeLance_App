import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/helpers/helpers.dart';
import 'package:freelance_app/models/client.dart';
import 'package:freelance_app/models/free_lancer.dart';
import 'package:freelance_app/services/client_provider.dart';
import 'package:freelance_app/views/client_profile.dart';
import 'package:freelance_app/views/free_lancer.dart';
import 'package:freelance_app/views/start.dart';
import 'package:provider/provider.dart';

class MenuDrawerScreen extends StatelessWidget {
  const MenuDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final clientProvider = Provider.of<ClientProvider>(context);
    Client? clientData = clientProvider.client;
    final freelancerProvider = Provider.of<ClientProvider>(context);
    FreeLancer? freeLancerData = freelancerProvider.freelancer;

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.green),
            accountName: Text(
              clientData != null
                  ? clientData!.personName
                  : freeLancerData!.personName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            accountEmail: null,
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpeg'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => clientData != null
                          ? ClientProfile(
                              email: clientData!.Email,
                            )
                          : FreeLancerProfile(
                              email: freeLancerData!.Email,
                            )));
            },
          ),
          const SizedBox(
            height: 5,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              //Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Start()));
            },
          )
        ],
      ),
    );
  }
}
