import 'package:flutter/cupertino.dart';

class TaskCategory {
  String? id;
  IconData? icon;
  String? title;
  Color? iconColor;
  Color? bgColor;
  Color? btnColor;
  num left;
  num done;
  bool isLast;

  TaskCategory({
    this.id,
    this.icon,
    this.title,
    this.iconColor,
    this.bgColor,
    this.btnColor,
    this.left = 0,
    this.done = 0,
    this.isLast = false,
  });
}
