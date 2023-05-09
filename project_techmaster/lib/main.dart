import 'package:flutter/material.dart';
import 'package:project_techmaster/dang_nhap.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Techmaster(),
    );
  }
}
