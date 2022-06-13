import 'package:flutter/material.dart';
import 'package:task_management/model/task.dart';

import '../constants/colors.dart';

class TaskData extends ChangeNotifier {
  Task findById(int id) {
    return _tasks.firstWhere((tasks) => tasks.id == id);
  }

  List tasks() {
    return [..._tasks];
  }

  final List _tasks = [
    Task(
      id: 1,
      icon: Icons.person,
      iconColor: kYellowDark,
      bgColor: kYellow,
      btnColor: kYellowLight,
      left: 3,
      done: 1,
      title: 'Personal',
    ),
    Task(
      id: 2,
      icon: Icons.work,
      iconColor: kRedDark,
      bgColor: kRed,
      btnColor: kRedLight,
      left: 2,
      done: 8,
      title: 'Work',
    ),
    Task(
      id: 3,
      icon: Icons.favorite,
      iconColor: kBlueDark,
      bgColor: kBlue,
      btnColor: kBlueLight,
      left: 1,
      done: 1,
      title: 'Health',
    ),
    Task(isLast: true)
  ];
}
