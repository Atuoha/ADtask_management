import 'package:flutter/material.dart';
import '../widgets/go_premium.dart';
import 'gridview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoPremium(),
          const SizedBox(height: 10),
          const Text(
            'Task Categories',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: size.height / 1.8,
            child: const TaskCategoryGrid()
          ),
        ],
      ),
    );
  }
}
