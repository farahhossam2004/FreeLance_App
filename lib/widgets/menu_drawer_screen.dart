import 'package:flutter/material.dart';
import 'package:freelance_app/helpers/helpers.dart';
import 'package:freelance_app/services/client_provider.dart';
import 'package:freelance_app/views/client_profile.dart';
import 'package:freelance_app/views/free_lancer.dart';
import 'package:provider/provider.dart';

class MenuDrawerScreen extends StatelessWidget {
  const MenuDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final clientProvider = Provider.of<ClientProvider>(context);
    final clientData = clientProvider.client!;
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.green
            ),
            accountName: Text(isClient == true  ? clientData!.personName : 'freelancer', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            accountEmail: null,
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpeg'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title:const Text('Profile'),
            onTap: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => isClient == true ? ClientProfile(email: clientData.Email,) : FreeLancerProfile() ));
            },
          ),
          SizedBox(height: 5,),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
