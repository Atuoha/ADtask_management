import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class EmptyAddTask extends StatelessWidget {
  const EmptyAddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: const Color.fromARGB(255, 194, 190, 190),
      dashPattern: const [8, 4],
      strokeWidth: 2,
      borderType: BorderType.RRect,
      radius: const Radius.circular(20),
      padding: const EdgeInsets.all(6),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        child: Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: const [
              Icon(
                Icons.add,
                color: Colors.black,
              ),
              Text(
                ' Add',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
