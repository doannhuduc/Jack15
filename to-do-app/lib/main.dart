import 'package:flutter/material.dart';
import 'package:lession_1/to_do_app.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoApp(),
    );
  }
}
