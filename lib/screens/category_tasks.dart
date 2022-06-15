import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
// import 'package:timelines/timelines.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/task_category.dart';

class CategoryTasks extends StatefulWidget {
  static const routeName = '/category-tasks';
  const CategoryTasks({Key? key}) : super(key: key);

  @override
  State<CategoryTasks> createState() => _CategoryTasksState();
}

class _CategoryTasksState extends State<CategoryTasks> {
  @override
  Widget build(BuildContext context) {
    var data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var id = data['id'] as String;

    var taskCategory = Provider.of<TaskCategoryData>(context).findById(id);

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
          '${taskCategory.title} tasks',
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
            padding: const EdgeInsets.all(13.0),
            child: Center(
              child: Text(
                'You have ${taskCategory.left} tasks for today!',
                style: const TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(116, 255, 255, 255),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
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
                  child: Column(
                    children: [],
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
