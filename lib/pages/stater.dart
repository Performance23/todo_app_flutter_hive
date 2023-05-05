import 'package:flutter/material.dart';
import 'package:list/pages/todos.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({super.key});

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => TodoList()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              decoration: const BoxDecoration(
                  color: Colors.black, shape: BoxShape.circle),
              child: Icon(
                Icons.checklist_rounded,
                color: Colors.orange,
                size: 50.0,
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            const Text('TODO',
                style: TextStyle(fontSize: 20.0, letterSpacing: 1.0))
          ],
        )));
  }
}
