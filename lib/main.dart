import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/task.dart';
import 'providers/task_category.dart';
import 'screens/add_new_task_category.dart';
import 'screens/add_new_task.dart';
import 'screens/category_tasks.dart';
import 'widgets/bottom_nav.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  static const routeName = '/';
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TaskCategoryData(),
        ),
        ChangeNotifierProvider(
          create: (context) => TaskData(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(fontFamily: 'Joan'),
        home: const BottomNav(),
        routes: {
          CategoryTasks.routeName: (context) => const CategoryTasks(),
          AddNewTask.routeName: (context) => const AddNewTask(),
          AddNewTaskCategory.routeName: (context) => const AddNewTaskCategory(),
        },
      ),
    );
  }
}
