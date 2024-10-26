import 'package:carinfo/pages/camera.dart';
import 'package:carinfo/pages/dashboard.dart';
import 'package:carinfo/pages/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedindex = 0;

  // Explicitly define List<Widget> to avoid potential type errors
  List<Widget> _screens = [
    DashboardPage(),
    Cameras(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Checking if _selectedindex is within the range of the screens list
      body: _screens[_selectedindex],
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xFF071B50),
        buttonBackgroundColor: Color.fromARGB(255, 59, 77, 126),
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
        // color: Color.fromARGB(0, 48, 134, 149),
        height: 50,
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.camera,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
        ],
        animationDuration: const Duration(milliseconds: 200),
        onTap: (index) {
          setState(() {
            _selectedindex = index;
          });
        },
      ),
    );
  }
}
