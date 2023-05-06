import 'package:flutter/material.dart';
import 'package:my_todo_list/models/task.dart';
import 'package:my_todo_list/widgets/add_task_form.dart';
import 'package:my_todo_list/widgets/task_item.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas'),
      ),
      body: Column(
        children: [
          AddTaskForm(
            alDarClick: (taskTitle) {
              const uuid = Uuid();
              final id = uuid.v1();
              final task = Task(id: id, title: taskTitle, date: '29-04-2023');
              setState(() {
                tasks.add(task);
              });
            },
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: tasks.map((e) {
                return TaskItem(
                  task: e,
                  onRemove: (task){
                    setState(() {
                      tasks.removeWhere((element) {
                        return element.id == task.id;
                      });
                    });
                  },
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
