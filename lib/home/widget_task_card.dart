import 'package:flutter/material.dart';
import 'package:todoapp/home/task.dart';

class TaskCard extends StatelessWidget {

  final Task task;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onToggle;

  const TaskCard({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onEdit,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      child: ListTile(

        // leading: Checkbox(
        //   value: task.completed,
        //   onChanged: (value){
        //     onToggle();
        //   },
        // ),

        title: Text(task.title),

        subtitle: Text("Estimate: ${task.estimate_time} min"),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
                onPressed: onToggle,
                icon:
                Icon(
                  task.completed
                      ? Icons.check_circle : Icons.radio_button_unchecked),
                color: task.completed ? Colors.green : Colors.grey,
            ),

            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onDelete,
            ),

          ],
        ),
      ),
    );
  }
}