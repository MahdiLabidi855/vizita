import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../Var/variable.dart';
import 'List/doctor_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<HomeScreen> {
  bool startAnimation = false;
  final _drawerController = ZoomDrawerController();

  List pages = [
    Container(
      child: SingleChildScrollView(child: CalendarLikeInterface()),
    ),
    Container(
      child: Text("User"),
    ),
    Container(
      child: Text("Static"),
    ),
    Container(
      child: Text("Profile"),
    )
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 600), () {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 100,
        title: Text(
          "Home",
          style: TextStyle(color: blue,fontSize: 70),
        ),
        backgroundColor: greenO1OOP,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: blue,
        unselectedItemColor: white,
        currentIndex: homeScreenIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: greenO1OOP,
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: greenO1OOP,
            icon: Icon(
              Icons.my_library_books_outlined,
            ),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            backgroundColor: greenO1OOP,
            icon: Icon(
              Icons.supervised_user_circle_outlined,
            ),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            backgroundColor: greenO1OOP,
            icon: Icon(
              Icons.person_pin_outlined,
            ),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            homeScreenIndex = index;
          });
        },
      ),
      body: Container(
          height: screenHeight, child: Center(child: pages[homeScreenIndex])),
    );
  }
}
