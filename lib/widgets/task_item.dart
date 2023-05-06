import 'package:flutter/material.dart';
import 'package:my_todo_list/models/task.dart';

class TaskItem extends StatefulWidget {
  final Task task;
  final Function(Task)? onRemove;
  const TaskItem({required this.task, super.key, this.onRemove });

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
            setState(() {
              widget.task.isDone = value ?? false;
            });
          },
        ),
        title: Text(widget.task.title),
        subtitle: Text(
          widget.task.date,
          style: TextStyle(
            decoration: widget.task.isDone
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            decorationColor: Colors.red,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            final removeAction = widget.onRemove;
            if (removeAction != null) {
              removeAction(widget.task);
            }
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
