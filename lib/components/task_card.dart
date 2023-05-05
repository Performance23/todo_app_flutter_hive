import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskCard extends StatelessWidget {
  TaskCard(
      {super.key,
      required this.content,
      required this.status,
      required this.toggleStatus,
      required this.deleteTask});

  String content;
  bool status;
  void Function(bool?)? toggleStatus;
  void Function(BuildContext?)? deleteTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(10.0),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            onPressed: deleteTask,
            icon: Icons.delete,
          )
        ]),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.orange, borderRadius: BorderRadius.circular(10.0)),
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
          child: Row(
            children: [
              Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.all(Colors.black),
                  value: status,
                  onChanged: toggleStatus),
              Text(
                  content.length >= 40
                      ? '${content.substring(0, 41)}...'
                      : content,
                  style: TextStyle(
                    fontSize: 18.0,
                    decoration: status
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ))
            ],
          ),
        ),
      ),
    );
    ;
  }
}
