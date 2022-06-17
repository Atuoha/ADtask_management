import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_category.dart';
import '../screens/add_new_task_category.dart';

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
    Widget customContainer(
      Color color,
      String title,
      Color textColor,
    ) {
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
              color: textColor,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  color: iconColor,
                  size: 35,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed(
                        AddNewTaskCategory.routeName,
                        arguments: {
                          'id': id,
                        },
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: btnColor,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () => Provider.of<TaskCategoryData>(
                        context,
                        listen: false,
                      ).deleteTaskCategory(id),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: btnColor,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.delete_forever,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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
                  Colors.white,
                ),
                const SizedBox(width: 5),
                customContainer(
                  Colors.white,
                  '$done done',
                  iconColor,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
