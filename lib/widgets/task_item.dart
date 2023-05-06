import 'package:flutter/material.dart';
import 'package:my_todo_list/models/task.dart';

class TaskItem extends StatefulWidget {
  final Task task;
  const TaskItem({required this.task, super.key});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: widget.task.isDone,
          onChanged: (value) {
            print(value);
          },
        ),
        title: Text(widget.task.titleInCaps),
        subtitle: Text(widget.task.date),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
