import 'package:flutter/material.dart';

class AddTaskForm extends StatefulWidget {
  final Function(String) alDarClick;
  const AddTaskForm({required this.alDarClick, super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  var countCharacters = 0;
  var taskTitle = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Escribe la tarea que quieras',
              counterText: '$countCharacters letra(s)',
              labelText: 'Tarea',
            ),
            onChanged: (value) {
              setState(() {
                taskTitle = value;
                countCharacters = value.length;
              });
            },
          ),
          ElevatedButton.icon(
            onPressed: taskTitle.isEmpty
                ? null
                : () {
                    widget.alDarClick(taskTitle);
                  },
            icon: const Icon(Icons.add),
            label: const Text('Agregar'),
          ),
        ],
      ),
    );
  }
}
