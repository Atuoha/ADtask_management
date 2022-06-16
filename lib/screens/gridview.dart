import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/widgets/single_category_task.dart';
import '../providers/task_category.dart';
import '../widgets/add_category_task.dart';
import 'add_new_task_category.dart';
import 'category_tasks.dart';

// ignore: use_key_in_widget_constructors
class TaskCategoryGrid extends StatelessWidget {
  const TaskCategoryGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.only(top: 20),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: Provider.of<TaskCategoryData>(context)
          .taskCategories()
          .map(
            (task) => task.isLast
                ? GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                      AddNewTaskCategory.routeName,
                    ),
                    child: const EmptyAddTask(),
                  )
                : GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                      CategoryTasks.routeName,
                      arguments: {
                        'id': task.id,
                      },
                    ),
                    child: SingleCategoryTask(
                      id: task.id,
                      icon: task.icon,
                      title: task.title,
                      iconColor: task.iconColor,
                      btnColor: task.btnColor,
                      bgColor: task.bgColor,
                      left: task.left,
                      done: task.done,
                      isLast: task.isLast,
                    ),
                  ),
          )
          .toList(),
    );
  }
}
