import 'package:flutter/material.dart';
import 'package:passing_data_between_screens/screen_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String? value10;

  MyHomePage({super.key, this.value10});

  @override
  State<MyHomePage> createState() => Screen_1();
}

class Screen_1 extends State<MyHomePage> {
  TextEditingController dataScreenName = TextEditingController();
  TextEditingController dataScreenEmail = TextEditingController();
  TextEditingController dataScreenPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Passing Data Between Screens"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Data of screen 1",
              style: TextStyle(fontSize: 26),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "name", labelStyle: TextStyle(fontSize: 16)),
              controller: dataScreenName,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "mail", labelStyle: TextStyle(fontSize: 16)),
              controller: dataScreenEmail,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "phone", labelStyle: TextStyle(fontSize: 16)),
              controller: dataScreenPhone,
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Screen_2(
                        value2: dataScreenName.text,
                        value3: dataScreenEmail.text,
                        value4: dataScreenPhone.text,
                      );
                    },
                  ));
                  setState(() {});
                },
                child: Text(
                  "Next Screen 2",
                  style: TextStyle(fontSize: 26),
                )),
            Center(
              child: Text(
                "Data is returned to the screen 2",
                style: TextStyle(fontSize: 26),
              ),
            ),
            Container(
              height: 50,
              width: 420,
              color: Colors.green,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
