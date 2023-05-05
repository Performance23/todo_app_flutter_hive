import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:list/pages/stater.dart';
import 'package:list/pages/todos.dart';

void main(List<String> args) async {
  await Hive.initFlutter();

  var box = await Hive.openBox('todoBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'EduTASBeginner'),
      home: const StarterPage(),
    );
  }
}
