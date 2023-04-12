import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:tach_man_hinh_messenger/list_chat.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            title: Center(
          child: Text(
            "LogIn",
            style: TextStyle(fontSize: 26),
          ),
        )),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              TextField(
                controller: controllerUsername,
                decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(
                      fontSize: 18,
                    )),
              ),
              TextField(
                controller: controllerPassword,
                decoration: InputDecoration(
                    labelText: "Password", labelStyle: TextStyle(fontSize: 18)),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Container(
                  color: Colors.blue,
                  width: 140,
                  height: 30,
                  child: Center(
                    child: Text(
                      "LogIn",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                onPressed: () {
                  if (controllerUsername.text == "quang" &&
                      controllerPassword.text == "quangdeptrai") {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ListChatPage(
                              userName: controllerUsername.text,
                            )));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Center(
                            child: Text("Nhập lại Username hoặc Password"))));
                  }
                },
              )
            ],
          ),
        )));
  }
}
