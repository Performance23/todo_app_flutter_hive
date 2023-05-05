import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:list/components/add_task_dialog.dart';
import '../actions/task_actions.dart';
import '../components/task_card.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _contentController = TextEditingController();
  final taskActions = TaskActions();
  List tasks = [];
  var todoBox = Hive.box('todoBox');

  addTodo() {
    setState(() {
      taskActions.saveTask(_contentController.text);
      tasks = taskActions.getTasks();
    });
    _contentController.clear();
    Navigator.of(context).pop();
  }

  newTodoModal() {
    showDialog(
        context: context,
        builder: (context) {
          return AddTaskDialog(
            contentController: _contentController,
            addTodo: addTodo,
          );
        });
  }

  void toggleStatus(bool? value, int index) {
    setState(() {
      taskActions.toogleTaskStatus(index);
    });
  }

  deleteTask(BuildContext? value, index) {
    setState(() {
      taskActions.destroyTask(index);
    });
  }

  @override
  void initState() {
    setState(() {
      tasks = taskActions.getTasks();
      print(tasks);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'TO DO',
          style: TextStyle(letterSpacing: 1.0, color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: newTodoModal,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: tasks.isEmpty
          ? const Center(
              child: Text(
                'No tasks',
                style: TextStyle(fontSize: 30.0),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskCard(
                  content: tasks[index]['content'],
                  status: tasks[index]['status'],
                  toggleStatus: (value) =>
                      toggleStatus(!tasks[index]['status'], index),
                  deleteTask: (value) => deleteTask(value, index),
                );
              }),
    );
  }
}
