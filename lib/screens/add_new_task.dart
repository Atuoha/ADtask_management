import 'package:color_picker_field/color_picker_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:task_management/providers/task_category.dart';
import '../constants/colors.dart';
import '../model/task.dart';
import '../providers/task.dart';
import 'package:intl/intl.dart';
import 'package:textfield_datepicker/textfield_timePicker.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';

class AddNewTask extends StatefulWidget {
  static const routeName = '/newtask';
  const AddNewTask({Key? key}) : super(key: key);

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  var form = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();

  

  var _taskData = Task(
    id: '',
    title: '',
    description: '',
    bgColor: Colors.red,
    startTime: '',
    endTime: '',
    date: DateTime.now(),
    taskCategoryId: '',
  );



  var isInit = true;
  var createState = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      var taskId =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      // ignore: unnecessary_null_comparison
      if (taskId != null) {
        _taskData = Provider.of<TaskData>(
          context,
          listen: false,
        ).findById(taskId['id']);

        setState(() {
          createState = !createState;
        });
      }
    }
    super.didChangeDependencies();
    isInit = false;
  }

  void _saveData() {
    var valid = form.currentState!.validate();
    if (!valid) {
      return;
    }
    form.currentState!.save();
    if (createState) {
      // Adding
      Provider.of<TaskData>(
        context,
        listen: false,
      ).addTask(_taskData);

      // Adding Task under a category
      Provider.of<TaskCategoryData>(
        context,
        listen: false,
      ).addTask(
        _taskData.id,
        _taskData.taskCategoryId,
      );
    } else {
      // Updating
      Provider.of<TaskData>(
        context,
        listen: false,
      ).updateTask(_taskData);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var taskCategories = Provider.of<TaskCategoryData>(
      context,
      listen: false,
    ).taskCategories();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
        title: Text(
          createState ? 'Add New Task ' : '${_taskData.title} Task',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Entypo.dots_two_vertical,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              createState ? 'Add New Task ' : 'Editing ${_taskData.title} Task',
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(116, 255, 255, 255),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(
                width: double.infinity,
                height: double.infinity,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Form(
                    key: form,
                    autovalidateMode: AutovalidateMode.always,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                            initialValue: createState ? '' : _taskData.title,
                            textCapitalization: TextCapitalization.sentences,
                            onSaved: (value) {
                              _taskData = Task(
                                id: _taskData.id,
                                title: value!,
                                description: _taskData.description,
                                bgColor: _taskData.bgColor,
                                taskCategoryId: _taskData.taskCategoryId,
                                startTime: _taskData.startTime,
                                endTime: _taskData.endTime,
                                date: _taskData.date,
                              );
                            },
                            textInputAction: TextInputAction.next,
                            autofocus: true,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.title),
                              hintText: 'Task Title',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'A title is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            initialValue:
                                createState ? '' : _taskData.description,
                            textCapitalization: TextCapitalization.sentences,
                            maxLines: 3,
                            minLines: 3,
                            onSaved: (value) {
                              _taskData = Task(
                                id: _taskData.id,
                                title: _taskData.title,
                                description: value!,
                                bgColor: _taskData.bgColor,
                                taskCategoryId: _taskData.taskCategoryId,
                                startTime: _taskData.startTime,
                                endTime: _taskData.endTime,
                                date: _taskData.date,
                              );
                            },
                            textInputAction: TextInputAction.next,
                            autofocus: true,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.title),
                              hintText: 'Task Description',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'A description is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          ColorPickerFormField(
                            initialValue: [],
                            defaultColor: Colors.blue,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            maxColors: 10,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.color_lens),
                              hintText: 'Color Picker',
                            ),
                            validator: createState
                                ? (List<Color>? value) {
                                    if (value!.isEmpty) {
                                      return 'a color is required';
                                    }
                                    return null;
                                  }
                                : null,
                            onSaved: (value) {
                              if (!createState) {
                                value!.isEmpty
                                    ? value = [_taskData.bgColor]
                                    : value;
                              }
                              _taskData = Task(
                                id: _taskData.id,
                                title: _taskData.title,
                                description: _taskData.description,
                                taskCategoryId: _taskData.taskCategoryId,
                                startTime: _taskData.startTime,
                                endTime: _taskData.endTime,
                                date: _taskData.date,
                                bgColor: value!.last.withOpacity(0.6),
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              if (!createState) ...[
                                const SizedBox(width: 10),
                                const Text(
                                  'Prior Selected Color',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: _taskData.bgColor,
                                  ),
                                ),
                              ]
                            ],
                          ),
                          const SizedBox(height: 10),
                          TextfieldTimePicker(
                            textfieldTimePickerWidth: 100,
                            cupertinoDatePickerBackgroundColor: Colors.white,
                            cupertinoDateInitialDateTime: DateTime.now(),
                            textfieldDateAndTimePickerController: _controller2,
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.alarm_add),
                              hintText: 'Select Start Time',
                            ),
                            materialInitialTime: TimeOfDay.now(),
                            onSaved: (value) {
                              // ignore: prefer_typing_uninitialized_variables
                              if (!createState) {
                                value!.isEmpty
                                    ? value = _taskData.startTime
                                    : value;
                              }
                              _taskData = Task(
                                id: _taskData.id,
                                title: _taskData.title,
                                description: _taskData.description,
                                bgColor: _taskData.bgColor,
                                taskCategoryId: _taskData.taskCategoryId,
                                startTime: value!,
                                endTime: _taskData.endTime,
                                date: _taskData.date,
                              );
                            },
                            validator: createState
                                ? (value) {
                                    if (value!.isEmpty) {
                                      return 'Start time is required';
                                    }
                                    return null;
                                  }
                                : null,
                          ),
                          const SizedBox(height: 10),
                          TextfieldTimePicker(
                            textfieldTimePickerWidth: 100,
                            cupertinoDatePickerBackgroundColor: Colors.white,
                            cupertinoDateInitialDateTime: DateTime.now(),
                            textfieldDateAndTimePickerController: _controller,
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.access_time),
                              hintText: 'Select End Time',
                            ),
                            materialInitialTime: TimeOfDay.now(),
                            onSaved: (value) {
                              // ignore: prefer_typing_uninitialized_variables
                              if (!createState) {
                                value!.isEmpty
                                    ? value = _taskData.endTime
                                    : value;
                              }
                              _taskData = Task(
                                id: _taskData.id,
                                title: _taskData.title,
                                description: _taskData.description,
                                bgColor: _taskData.bgColor,
                                taskCategoryId: _taskData.taskCategoryId,
                                startTime: _taskData.startTime,
                                endTime: value!,
                                date: _taskData.date,
                              );
                            },
                            validator: createState
                                ? (value) {
                                    if (value!.isEmpty) {
                                      return 'End time is required';
                                    }
                                    return null;
                                  }
                                : null,
                          ),
                          const SizedBox(height: 10),
                          TextfieldDatePicker(
                            textfieldDatePickerWidth: 100,
                            cupertinoDatePickerBackgroundColor: Colors.white,
                            cupertinoDatePickerMaximumDate: DateTime(2099),
                            cupertinoDatePickerMaximumYear: 2099,
                            cupertinoDatePickerMinimumYear: DateTime.now().year,
                            cupertinoDatePickerMinimumDate: DateTime.now(),
                            cupertinoDateInitialDateTime: DateTime.now(),
                            materialDatePickerFirstDate: DateTime.now(),
                            materialDatePickerInitialDate: DateTime.now(),
                            materialDatePickerLastDate: DateTime(2099),
                            preferredDateFormat: DateFormat('dd-MMMM-' 'yyyy'),
                            textfieldDatePickerController: _controller3,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.calendar_month),
                              hintText: 'Select Date',
                            ),
                            onSaved: (value) {
                              // ignore: prefer_typing_uninitialized_variables
                              var date;
                              if (!createState) {
                                if (value!.isEmpty) {
                                  date = _taskData.date;
                                } else {
                                  date =
                                      DateFormat('dd-MMMM-yyyy').parse(value);
                                }
                              } else {
                                date = DateFormat('dd-MMMM-yyyy').parse(value!);
                              }

                              _taskData = Task(
                                id: _taskData.id,
                                title: _taskData.title,
                                description: _taskData.description,
                                bgColor: _taskData.bgColor,
                                taskCategoryId: _taskData.taskCategoryId,
                                startTime: _taskData.startTime,
                                endTime: _taskData.endTime,
                                date: date,
                              );
                            },
                            validator: createState
                                ? (value) {
                                    if (value!.isEmpty) {
                                      return 'Date is required';
                                    }
                                    return null;
                                  }
                                : null,
                          ),
                          const SizedBox(height: 10),
                          DropdownButtonFormField(
                            value:
                                !createState ? _taskData.taskCategoryId : null,
                            items: taskCategories
                                .map(
                                  (category) => DropdownMenuItem(
                                    enabled: category.title.toString() == 'null'
                                        ? false
                                        : true,
                                    value: category.id.toString(),
                                    child: Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Icon(
                                          category.title.toString() == 'null'
                                              ? Icons.wysiwyg
                                              : category.icon,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          category.title.toString() == 'null'
                                              ? 'Select A Category'
                                              : category.title.toString(),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              _taskData = Task(
                                id: _taskData.id,
                                title: _taskData.title,
                                description: _taskData.description,
                                bgColor: _taskData.bgColor,
                                taskCategoryId: value.toString(),
                                startTime: _taskData.startTime,
                                endTime: _taskData.endTime,
                                date: _taskData.date,
                              );
                            },
                            validator: createState
                                ? (value) {
                                    if (value == '') {
                                      return 'Task category must be selected';
                                    }
                                    return null;
                                  }
                                : null,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.wysiwyg),
                              hintText: 'Select Task Category',
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () => _saveData(),
                            style: ElevatedButton.styleFrom(
                              primary: kBlueDarker,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              createState
                                  ? 'Submit A New Task'
                                  : 'Submit Edited Information',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


  // startTime = TimeOfDay(
  //       hour: int.parse(value.split(":")[0]),
  //       minute: int.parse(value.split(":")[1]),
  //     );