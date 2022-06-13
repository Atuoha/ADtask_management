import 'package:flutter/cupertino.dart';

class Task {
  int? id;
  IconData? icon;
  String? title;
  Color? iconColor;
  Color? bgColor;
  Color? btnColor;
  num? left;
  num? done;
  bool isLast;

  Task({
    this.id,
    this.icon,
    this.title,
    this.iconColor,
    this.bgColor,
    this.btnColor,
    this.left,
    this.done,
    this.isLast = false,
  });
}
