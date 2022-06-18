import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/colors.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({Key? key}) : super(key: key);

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  // static var date = DateTime.now();
  // static var day = DateFormat('yyyy-MM-dd').format(date);
  List weekList = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  List dayList = [12, 13, 14, 15, 16, 17, 18];
  var position = 6;

  Widget buildDateContainer(String week, int day, int index) {
    return GestureDetector(
      onTap: () => setState(() {
        position = index;
      }),
      child: Container(
        margin: const EdgeInsets.only(right: 6, left: 5),
        decoration: index == position
            ? BoxDecoration(
                color: kGreyOpaque.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              )
            : null,
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            children: [
              Text(
                week,
                style: TextStyle(
                  color: index == position ? Colors.black : Colors.grey,
                  fontWeight:
                      index == position ? FontWeight.w400 : FontWeight.normal,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                day.toString(),
                style: TextStyle(
                  color: index == position ? Colors.black : Colors.grey,
                  fontWeight:
                      index == position ? FontWeight.bold : FontWeight.normal,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 55,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weekList.length,
        itemBuilder: (context, index) => buildDateContainer(
          weekList[index],
          dayList[index],
          index,
        ),
      ),
    );
  }
}
