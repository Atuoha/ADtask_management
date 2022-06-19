import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_management/providers/task_category.dart';
import 'package:task_management/screens/add_new_task.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../model/task.dart';
import '../providers/task.dart';

class TaskTimeLine extends StatefulWidget {
  final Task task;
  final Color? categoryColor;

  const TaskTimeLine({
    Key? key,
    required this.task,
    required this.categoryColor,
  }) : super(key: key);

  @override
  State<TaskTimeLine> createState() => _TaskTimeLineState();
}

class _TaskTimeLineState extends State<TaskTimeLine> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 95,
          width: 20,
          child: TimelineTile(
            alignment: TimelineAlign.manual,
            isFirst: true,
            lineXY: 0,
            indicatorStyle: IndicatorStyle(
              indicatorXY: 0,
              width: 15,
              indicator: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    width: 5,
                    color: widget.task.bgColor,
                  ),
                ),
              ),
            ),
            afterLineStyle: LineStyle(
              color: widget.categoryColor!,
              thickness: 2,
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const SizedBox(height: 15),
                  Text(widget.task.startTime),
                  const Icon(
                    Icons.arrow_downward,
                    size: 15,
                  ),
                  Text(widget.task.endTime)
                ],
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.task.bgColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(
                        10,
                      ),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  height: 84,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.task.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                DateFormat('dd-M-yyyy').format(
                                  widget.task.date,
                                ),
                                style: const TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            widget.task.description,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Checkbox(
                                splashRadius: 150,
                                checkColor: Colors.white,
                                activeColor: Colors.black,
                                value: widget.task.accomplishedStatus,
                                onChanged: (value) => {
                                  // making the accomplishmentstatus true or false
                                  Provider.of<TaskData>(
                                    context,
                                    listen: false,
                                  ).toggleAccomplishmentStatus(
                                    widget.task.id,
                                  ),

                                  // work on taskcategory making it increment or decrement left or done
                                  Provider.of<TaskCategoryData>(context,
                                          listen: false)
                                      .toggleTaskAccomplishment(
                                    widget.task.taskCategoryId,
                                    value,
                                  )
                                },
                              ),
                              GestureDetector(
                                onTap: () => Navigator.of(context).pushNamed(
                                  AddNewTask.routeName,
                                  arguments: {
                                    'id': widget.task.id,
                                  },
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  size: 18,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // remove task from category
                                  Provider.of<TaskCategoryData>(
                                    context,
                                    listen: false,
                                  ).removeTask(
                                    widget.task.taskCategoryId,
                                    widget.task.accomplishedStatus,
                                  );

                                  // delete task
                                  Provider.of<TaskData>(
                                    context,
                                    listen: false,
                                  ).deleteTask(
                                    widget.task.id,
                                  );
                                },
                                child: const Icon(
                                  Icons.delete_forever,
                                  size: 18,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
