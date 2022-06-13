import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:provider/provider.dart';
import 'package:task_management/widgets/single_category_task.dart';
import '../providers/tasks.dart';
import '../widgets/add_category_task.dart';
import '../widgets/go_premium.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GoPremium(),
        const SizedBox(height: 10),
        const Text(
          'Tasks',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        SizedBox(
          height: size.height / 1.8,
          child: GridView.count(
            padding: const EdgeInsets.only(top:20),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: Provider.of<TaskData>(context)
                .tasks()
                .map(
                  (task) => task.isLast
                      ?  const EmptyAddTask():  SingleCategoryTask(
                          id: task.id,
                          icon: task.icon,
                          title: task.title,
                          iconColor: task.iconColor,
                          btnColor: task.btnColor,
                          bgColor: task.bgColor,
                          left: task.left,
                          done: task.done,
                          isLast: task.isLast,
                        )
                      ,
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
