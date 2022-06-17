import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/providers/task_category.dart';
import '../constants/colors.dart';
import '../screens/add_new_task.dart';
import '../screens/add_new_task_category.dart';
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
    Future showDialogOptions() {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: const [
                Icon(
                  Icons.color_lens,
                  size: 45,
                  color: kBlueDarker,
                ),
                SizedBox(width: 5),
                Text(
                  'Select Action',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kBlueDarker,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: Colors.black,
              ),
              onPressed: () => Navigator.of(context)
                  .pushNamed(
                AddNewTaskCategory.routeName,
              )
                  .then(
                (value) {
                  Navigator.of(context).pop();
                },
              ),
              child: const Text(
                'Create a new task category',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Provider.of<TaskCategoryData>(
                context,
                listen: false,
              ).taskCategories().length > 1
                  ?ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: Colors.black,
              ),
              onPressed: () =>  Navigator.of(context)
                      .pushNamed(
                      AddNewTask.routeName,
                    )
                      .then((value) {
                      Navigator.of(context).pop();
                    },)
                  ,
              child: const Text(
                'Create a new task',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ): const Text(''),
          ],
        ),
      );
    }

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
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 2,
          onPressed: () => showDialogOptions(),
          child: const Icon(
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _pages[pageIndex == 1 ? 2 : pageIndex],
      ),
    );
  }
}
