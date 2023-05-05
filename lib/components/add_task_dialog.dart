import 'package:flutter/material.dart';

class AddTaskDialog extends StatelessWidget {
  AddTaskDialog(
      {super.key, required this.contentController, required this.addTodo});

  TextEditingController contentController;
  VoidCallback addTodo;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0.0,
      backgroundColor: Colors.orange,
      title: const Text('New Task'),
      content: TextField(
        controller: contentController,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange.shade200))),
      ),
      actions: [
        TextButton(
          onPressed: addTodo,
          style: TextButton.styleFrom(backgroundColor: Colors.black),
          child: Text(
            'Save',
            style: TextStyle(color: Colors.orange.shade100),
          ),
        ),
        TextButton(
            onPressed: () {
              contentController.clear();
              Navigator.of(context).pop();
            },
            style:
                TextButton.styleFrom(backgroundColor: Colors.orange.shade100),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            )),
      ],
    );
  }
}
