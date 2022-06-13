import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/providers/tasks.dart';
import 'widgets/bottom_nav.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(fontFamily: 'Joan'),
        home: BottomNav(),
        routes: {},
      ),
    );
  }
}
