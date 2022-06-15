import 'dart:ui';

class Task {
  final String id;
  final String taskCategoryId;
  final String title;
  final DateTime startTime;
  final DateTime endTime;
  final DateTime date;
  final Color bgColor;
  Task({
    required this.id,
    required this.taskCategoryId,
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.bgColor,
 });
}
