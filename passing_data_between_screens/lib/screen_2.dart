import 'package:flutter/material.dart';
import 'package:passing_data_between_screens/main.dart';

class Screen_2 extends StatefulWidget {
  String? value2;
  String? value3;
  String? value4;
  Screen_2({this.value2, this.value3, this.value4});

  @override
  State<Screen_2> createState() =>
      _Screen_2State(value5: value2, value6: value3, value7: value4);
}

class _Screen_2State extends State<Screen_2> {
  TextEditingController content = TextEditingController();
  String? value5;
  String? value6;
  String? value7;
  _Screen_2State({this.value5, this.value6, this.value7});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Passing Data Between Screens"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Data is taken from screen 1",
              style: TextStyle(fontSize: 26),
            ),
          ),
          Container(
            height: 100,
            width: 420,
            color: Colors.green,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "name is $value5",
                    style: TextStyle(fontSize: 26),
                  ),
                  Text(
                    "email is $value6",
                    style: TextStyle(fontSize: 26),
                  ),
                  Text(
                    "phone is $value7",
                    style: TextStyle(fontSize: 26),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Text(
              "Data is returned to the screen 1",
              style: TextStyle(fontSize: 26),
            ),
          ),
          TextField(
            controller: content,
            decoration: InputDecoration(
                labelText: "content", labelStyle: TextStyle(fontSize: 16)),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Back Screen 1",
                style: TextStyle(fontSize: 26),
              ))
        ],
      ),
    );
  }
}
