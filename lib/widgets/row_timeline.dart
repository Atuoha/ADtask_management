import 'package:flutter/material.dart';

import '../constants/colors.dart';

class RowTimeline extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Tasks',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: kGreyOpaque.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: const [
                Text(
                  'Timeline',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.expand_more,
                  size: 14,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
