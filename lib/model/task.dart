import 'package:flutter/material.dart';

class Task {
  final String id;
  final String taskCategoryId;
  final String title;
  final String description;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final DateTime date;
  final Color bgColor;
  final bool accomplishedStatus;
  Task({
    required this.id,
    required this.taskCategoryId,
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.bgColor,
    this.accomplishedStatus = false,
  });
}
