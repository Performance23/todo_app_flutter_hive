import 'package:hive_flutter/hive_flutter.dart';

class TaskActions {
  final todoBox = Hive.box('todoBox');

  List getTasks() {
    return todoBox.get('tasks') ?? [];
  }

  void saveTask(String content) {
    var tasks = getTasks();
    tasks.add({'content': content, 'status': false});
    todoBox.put('tasks', tasks);
  }

  void toogleTaskStatus(int index) {
    var tasks = getTasks();
    tasks[index]['status'] = !tasks[index]['status'];
    todoBox.put('tasks', tasks);
  }

  void destroyTask(int index) {
    var tasks = getTasks();
    tasks.removeAt(index);
    todoBox.put('tasks', tasks);
  }
}
