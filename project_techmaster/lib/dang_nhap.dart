import 'package:flutter/material.dart';
import 'package:project_techmaster/danh_sach_the.dart';

class Techmaster extends StatefulWidget {
  const Techmaster({super.key});

  @override
  State<Techmaster> createState() => _TechmasterState();
}

class _TechmasterState extends State<Techmaster> {
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ListCard(
              userName: userName ?? "",
            ))); //////////////////////////////////
  }

  String? userName; ////////////////////////////////////////////////////////////
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? userNameTextError;
  String? passwordTextError;
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Đăng nhập")),
      ),
      body: SingleChildScrollView(
        child: Form(
          onChanged: () {
            if (userNameController.text.isEmpty ||
                userNameController.text.contains(" ") ||
                passwordController.text.isEmpty) {
              setState(() {
                userNameTextError =
                    "Username không được để trống và không chứa dấu cách";
                passwordTextError = "Password không được để trống";
              });
            }
          },
          child: Column(
            children: [
              Image.asset("assets/images/techmaster_black.png"),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: userNameController,
                  onChanged: (value) {
                    userName = value; //////////////////////////////////////////
                    if (value.length < 1 || value.contains(" ")) {
                      setState(() {
                        userNameTextError =
                            "Username không được để trống và không chứa dấu cách";
                      });
                    } else if ((value.isNotEmpty)) {
                      setState(() {
                        userNameTextError = null;
                      });
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Username", errorText: userNameTextError),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: passwordController,
                  onChanged: (value) {
                    if (value.length < 1) {
                      setState(() {
                        passwordTextError = "Username không được để trống";
                      });
                    } else if (value.isNotEmpty) {
                      setState(() {
                        passwordTextError = null;
                      });
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Password", errorText: passwordTextError),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (userNameController.text.toLowerCase() == "doannhuduc" &&
                      passwordController.text == "123456") {
                    setState(() {
                      _navigateToNextScreen(context);
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Center(
                            child: Text("Nhập lại Username hoặc Password"))));
                  }
                },
                child: Text(
                  "Đăng nhập",
                  style: TextStyle(fontSize: 18),
                ),
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    fixedSize: MaterialStatePropertyAll(Size(380, 50))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
