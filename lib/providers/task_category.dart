import 'package:flutter/material.dart';
import 'package:task_management/model/task_category.dart';

class TaskCategoryData extends ChangeNotifier {
  TaskCategory findById(String id) {
    return _taskCategories.firstWhere((tasks) => tasks.id == id);
  }

  List taskCategories() {
    return [..._taskCategories];
  }

  void addTask(String taskId, String taskCategoryId) {
    var taskCategory =
        _taskCategories.firstWhere((category) => category.id == taskCategoryId);
    taskCategory.tasks.add(taskId);
    taskCategory.left = taskCategory.left + 1;
    notifyListeners();
  }

  void removeTask(String taskId, String taskCategoryId) {
    var taskCategory =
        _taskCategories.firstWhere((category) => category.id == taskCategoryId);
    taskCategory.tasks.remove(taskId);
    notifyListeners();
  }

  String returnTitle(String id) {
    var taskCategory =
        _taskCategories.firstWhere((tasksCat) => tasksCat.id == id);
    return taskCategory.title;
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
    TaskCategory(isLast: true),
  ];
}
