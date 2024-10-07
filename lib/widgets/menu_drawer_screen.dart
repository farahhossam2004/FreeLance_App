import 'package:flutter/material.dart';
import 'package:freelance_app/services/array_data_for_test.dart';
import 'package:freelance_app/views/client_profile.dart';
import 'package:freelance_app/views/free_lancer.dart';

class MenuDrawerScreen extends StatelessWidget {
  const MenuDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green
            ),
            accountName: Text('John Peter', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpeg'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            // onTap: () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => mainRole == 'Client' ? ClientProfile() : FreeLancerProfile() ));
            // },
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
