import 'package:flutter/material.dart';
import 'package:freelance_app/views/bookmarked.dart';
import 'package:freelance_app/views/chat_screen.dart';
import 'package:freelance_app/views/jobs_screen.dart';
import 'package:freelance_app/views/notfications_screen.dart';
import 'package:freelance_app/views/profile.dart';
import 'package:freelance_app/views/wall.dart';
import 'package:freelance_app/widgets/bottom_nav_bar.dart';
import 'package:freelance_app/widgets/filter_drawer.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreenIndex = 0;

  final List<Widget> _screens = [
    WallPage(),
    ChatScreen(),
    JobsScreen(),
    BookmarkedJobsPage(),
    NotficationsScreen(),
    Profile(),
  ];
  
  void _onTabSelected(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 24, 45, 51),
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 12),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/profile.jpeg'),
          ),
        ),
        actions: [
          Builder(
            builder: (context) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: const Icon(Icons.filter_list),
                ),
              );
            },
          ),
        ],
      ),
      endDrawer: FilterDrawer(),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavBar(onTabSelected: _onTabSelected)

  );
  }
}
