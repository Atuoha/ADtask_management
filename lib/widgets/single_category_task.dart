import 'package:flutter/material.dart';

class SingleCategoryTask extends StatelessWidget {
  final String id;
  final IconData icon;
  final String title;
  final Color iconColor;
  final Color bgColor;
  final Color btnColor;
  final num left;
  final num done;
  final bool isLast;

  // ignore: use_key_in_widget_constructors
  const SingleCategoryTask({
    required this.id,
    required this.icon,
    required this.title,
    required this.iconColor,
    required this.btnColor,
    required this.bgColor,
    required this.left,
    required this.done,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    Widget customContainer(Color color, String title) {
      return Container(
        height: 40,
        width: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: iconColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: bgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 35,
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                customContainer(
                  btnColor,
                  '$left left',
                ),
                const SizedBox(width: 5),
                customContainer(
                  Colors.white,
                  '$done done',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
