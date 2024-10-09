import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:freelance_app/services/client_provider.dart';
import 'package:freelance_app/views/chats_inbox_screen.dart';
import 'package:freelance_app/views/client_profile.dart';
import 'package:freelance_app/views/client_wall.dart';
import 'package:freelance_app/views/free_lancer.dart';
import 'package:freelance_app/views/freelancer_wall.dart';
import 'package:freelance_app/views/jobs_screen.dart';
import 'package:freelance_app/views/notfications_screen.dart';
import 'package:freelance_app/widgets/bottom_nav_bar.dart';
import 'package:freelance_app/widgets/filter_drawer.dart';
import 'package:freelance_app/services/array_data_for_test.dart';
import 'package:freelance_app/widgets/menu_drawer_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int _selectedScreenIndex = 0;

  final List<Widget> _freelancerScreens = [
    const FreelancerWall(), // Home page
    const JobsScreen(),
    ChatsInboxScreen(conversations: conversations),
  ];
  final List<Widget> _clientScreens = [
    const ClientWall(), // Home page
    const JobsScreen(),
    ChatsInboxScreen(conversations: conversations),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
      final userProvider = Provider.of<ClientProvider>(context, listen: false);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: Builder(
          builder:(context) => Padding(
            padding: const EdgeInsets.only(left: 12),
            child: GestureDetector(
              onTap: () {
                  Scaffold.of(context).openDrawer();
                
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/profile.jpeg'),
              ),
            ),
          ),
        ),
        // Conditionally show actions based on the selected screen
        actions: _selectedScreenIndex == 0 && userProvider.freelancer != null
            ? [
                Builder(
                  builder: (context) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      child: IconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        icon: const Icon(Icons.filter_list),
                      ),
                    );
                  },
                ),
              ]
            : [], // No actions for other pages
      ),
      drawer: MenuDrawerScreen(),
      endDrawer: _selectedScreenIndex == 0 && userProvider.freelancer != null
          ? const FilterDrawer()
          : null,
      body: userProvider.freelancer != null
          ? _freelancerScreens[_selectedScreenIndex]
          : _clientScreens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavBar(onTabSelected: _onTabSelected),
    );
  }
}
