import 'package:flutter/material.dart';
import 'package:lession_1/to_do_app.dart';

class AddToDo extends StatefulWidget {
  const AddToDo({super.key});

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  TextEditingController _controller = TextEditingController();
  String dropDownValue = "Finance";
  var items = ["Finance", "Wedding", "Freelance", "Shopping List"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Add To Do",
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Title",
                ),
              ),
            ),
            DropdownButton(
                value: dropDownValue,
                icon: Icon(Icons.keyboard_arrow_down),
                items: items.map(
                  (String i) {
                    return DropdownMenuItem(
                      value: i,
                      child: Text(i),
                    );
                  },
                ).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue = newValue!;
                  });
                }),
            ElevatedButton(
                onPressed: () {
                  var item = TodoModel(
                      isChecked: false,
                      subTitle: dropDownValue,
                      title: _controller.text);

                  Navigator.pop(context, item);
                },
                child: Container(
                  child: Center(child: Text("Add")),
                  height: 40,
                  width: 60,
                  color: Colors.blue,
                ))
          ],
        ),
      ),
    );
  }
}
