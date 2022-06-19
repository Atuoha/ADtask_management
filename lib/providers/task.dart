import 'dart:math';

import 'package:flutter/material.dart';
import '../model/task.dart';

class TaskData extends ChangeNotifier {
  void toggleAccomplishmentStatus(String id) {
    var task = _tasks.firstWhere(
      (task) => task.id == id,
    );
    _tasks.forEach((task) {
      print('Title:${task.title}  ID: ${task.id}');
    });
    task.toggleAccomplishment();
    notifyListeners();
  }

  // bool checkAccomplishmentStatus(String id) {
  //   var task = _tasks.firstWhere(
  //     (task) => task.id == id,
  //   );
  //   return task.accomplishedStatus;
  // }

  List taskUnderACategory(String categoryId) {
    return _tasks
        .where(
          (task) => task.taskCategoryId == categoryId,
        )
        .toList();
  }

  void updateTask(Task updatedTask) {
    var taskId = _tasks.indexWhere(
      (task) => task.id == updatedTask.id,
    );
    if (taskId >= 0) {
      _tasks[taskId] = updatedTask;
    }
    notifyListeners();
  }

  void deleteTask(String id) {
    return _tasks.removeWhere(
      (task) => task.id == id,
    );
  }

  void addTask(Task task) {
     var idRand = Random().nextInt(1000) + 003;
    var newTask = Task(
      id: idRand.toString(),
      title: task.title,
      description: task.description,
      bgColor: task.bgColor,
      taskCategoryId: task.taskCategoryId,
      startTime: task.startTime,
      endTime: task.endTime,
      date: task.date,
    );
    _tasks.insert(0, newTask);
    notifyListeners();
  }

  Task findById(String id) {
    return _tasks.firstWhere(
      (task) => task.id == id,
    );
  }

  List tasks() {
    return [..._tasks];
  }

  List _tasks = [];
}
