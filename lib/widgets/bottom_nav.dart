import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../screens/home.dart';
import '../screens/profile.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  var pageIndex = 0;
  final List _pages = const [
    HomeScreen(),
    '',
    ProfileScreen(),
  ];
  void selectPage(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: selectPage,
          elevation: 2,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.shifting,
          showSelectedLabels: false,
          selectedItemColor: kBlueDarker,
          unselectedItemColor: kGrey,
          items: const [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Text(''),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        child: const FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 2,
          onPressed: null,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      backgroundColor: kBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/images/avatar.png'),
              ),
            ),
          ),
        ),
        title: const Text(
          'Hi, Dr Ernest!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 28,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Entypo.dots_two_vertical,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: 
       Padding(
            padding: const EdgeInsets.all(8.0),
            child:
      _pages[pageIndex == 1 ? 2 : pageIndex],

          )
      
    );
  }
}
