import 'package:flutter/material.dart';
import 'package:task_management/model/task_category.dart';

class TaskCategoryData extends ChangeNotifier {
  TaskCategory findById(String id) {
    return _taskCategories.firstWhere((tasks) => tasks.id == id);
  }

  List tasks() {
    return [..._taskCategories];
  }

  void addTaskCategory(TaskCategory taskcategory) {
    var newTaskCategory = TaskCategory(
      id: DateTime.now().toString(),
      title: taskcategory.title,
      icon: taskcategory.icon,
      bgColor: taskcategory.bgColor,
      btnColor: taskcategory.btnColor,
      iconColor: taskcategory.iconColor,
    );

    _taskCategories.insert(0, newTaskCategory);
    notifyListeners();
  }

  void updateTaskCategory(TaskCategory updatedCategoryDetails) {
    var taskIndex = _taskCategories
        .indexWhere((category) => category.id == updatedCategoryDetails.id);
    if (taskIndex >= 0) {
      _taskCategories[taskIndex] = updatedCategoryDetails;
    }
    notifyListeners();
  }

  void deleteTaskCategory(String id) {
    _taskCategories.removeWhere((category) => category.id == id);
    notifyListeners();
  }

  final List _taskCategories = [
    // TaskCategory(
    //   id: '1',
    //   icon: Icons.person,
    //   iconColor: kYellowDark,
    //   bgColor: kYellow,
    //   btnColor: kYellowLight,
    //   left: 3,
    //   done: 1,
    //   title: 'Personal',
    // ),
    // TaskCategory(
    //   id: '2',
    //   icon: Icons.work,
    //   iconColor: kRedDark,
    //   bgColor: kRed,
    //   btnColor: kRedLight,
    //   left: 2,
    //   done: 8,
    //   title: 'Work',
    // ),
    // TaskCategory(
    //   id: '3',
    //   icon: Icons.favorite,
    //   iconColor: kBlueDark,
    //   bgColor: kBlue,
    //   btnColor: kBlueLight,
    //   left: 1,
    //   done: 1,
    //   title: 'Health',
    // ),
    TaskCategory(isLast: true)
  ];
}
