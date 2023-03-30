import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../nav_screens/home_screen.dart';
import '../nav_screens/profile_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var pagedata = [
    const HomeScreen(),
    const ProfileScreen(),
  ];
  int selectedicon = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.lightBlueAccent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            padding: const EdgeInsets.all(12),
            gap: 0,
            backgroundColor: Colors.lightBlueAccent,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.white54,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                textStyle: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              GButton(
                icon: Icons.account_circle,
                text: 'Profile',
                textStyle: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
            onTabChange: (index) {
              setState(() {
                selectedicon = index;
              });
            },
          ),
        ),
      ),
      body: Center(
        child: pagedata[selectedicon],
      ),
    );
  }
}

