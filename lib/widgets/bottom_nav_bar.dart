import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

class BottomNavBar extends StatefulWidget {
  final ValueChanged<int> onTabSelected;

  const BottomNavBar({super.key, required this.onTabSelected});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController; // Use MotionTabBarController

  @override
  void initState() {
    super.initState();

    // Initialize MotionTabBarController, similar to how TabController would be initialized.
    _motionTabBarController = MotionTabBarController(
      initialIndex: 1, // Set the initial tab index (default is the second tab)
      length:
          3, // Set the total number of tabs (must match the number of tabs in your TabBar)
      vsync: this, // 'vsync' is necessary for controlling animations
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _motionTabBarController
        ?.dispose(); // Dispose the MotionTabBarController if it's not null
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MotionTabBar(
      controller:
          _motionTabBarController, // Use MotionTabBarController instead of TabController
      initialSelectedTab: "Home",
      labels: const [
        "Home",
        
        "Jobs",
        "Chat",

      ], // Tabs labels
      icons: const [
        Icons.home,
        
        Icons.task_outlined,
        Icons.chat_bubble,

      ], // Icons for the tabs
      tabSize: 50,
      tabBarHeight: 55,
      textStyle: const TextStyle(
        fontSize: 12,
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
      tabIconColor: Colors.green,
      tabIconSize: 28.0,
      tabIconSelectedSize: 26.0,
      tabSelectedColor: const Color.fromARGB(255, 18, 107, 13),
      tabIconSelectedColor: Colors.white,
      tabBarColor: Colors.white,
      onTabItemSelected: (int index) {
        setState(() {
          _motionTabBarController!.index =
              index; // Update the tab index programmatically
        });
        widget.onTabSelected(index); // Call the callback function
      },
    );
  }
}
