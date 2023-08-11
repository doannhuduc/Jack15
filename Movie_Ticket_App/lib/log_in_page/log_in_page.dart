import 'dart:collection';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/register_page/create_account_page.dart';
import 'package:movie_ticket_app/router/app_router.dart';
import 'package:movie_ticket_app/utils/user_infor_model.dart';
import 'package:movie_ticket_app/utils/config.dart';
import 'package:movie_ticket_app/utils/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  ValueNotifier isObscureText = ValueNotifier(true);

  ValueNotifier errorEmail = ValueNotifier("");

  ValueNotifier errorPassword = ValueNotifier("");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorAppbar,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Log In", style: AppStyle.textAppar),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            imageHomepage(),
            textField_emailOrPhone(),
            textFieldPassword(),
            registration(context),
          ],
        ),
      ),
    );
  }

  Widget imageHomepage() {
    return Image.asset(
      "assets/image/image_login.jpg",
      height: 200,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fitWidth,
    );
  }

  Widget textField_emailOrPhone() {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: ValueListenableBuilder(
          valueListenable: errorEmail,
          builder: (context, value, child) {
            return TextField(
              onChanged: (value) {
                if (value.isEmpty) {
                  errorEmail.value = "Email không được để trống";
                } else if (value.isNotEmpty) {
                  errorEmail.value = "";
                }
              },
              controller: emailController,
              decoration: InputDecoration(
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                errorText: errorEmail.value,
                hintText: "Email or phone number",
                hintStyle: AppStyle.textTextField,
              ),
            );
          },
        ));
  }
/////////////////////////////////////////////////////////////////////////////////////////////

  Widget textFieldPassword() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ValueListenableBuilder(
        valueListenable: isObscureText,
        builder: (context, value, child) {
          return ValueListenableBuilder(
            valueListenable: errorPassword,
            builder: (context, value, child) {
              return TextField(
                onChanged: (value) {
                  if (value.contains(" ") || value.length < 6) {
                    errorPassword.value =
                        "Password không chứa dấu cách và có ít nhất 6 ký tự";
                  } else if (value.isNotEmpty) {
                    errorPassword.value = "";
                  }
                },
                controller: passwordController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        isObscureText.value = !isObscureText.value;
                      },
                      icon: Icon(
                        isObscureText.value
                            ? Icons.visibility_off
                            : Icons.remove_red_eye,
                        color: Colors.black38,
                      )),
                  errorMaxLines: 3,
                  focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  errorText: errorPassword.value,
                  hintText: "Password",
                  hintStyle: AppStyle.textTextField,
                ),
                obscureText: isObscureText.value,
              );
            },
          );
        },
      ),
    );
  }

  Widget registration(context) {
    return Column(
      children: [
        SizedBox(height: 40),
        Row(
          children: [
            SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  _onClickLogIn();
                },
                child: Text(
                  "LOG IN",
                  style: AppStyle.textElevatedButton,
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(AppColor.colorElevatedButton),
                ),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        SizedBox(height: 20),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRouter.forgotPassword);
          },
          child: const Text("Forgot Password",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                  fontSize: 16)),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            Expanded(
              flex: 5,
              child: Divider(
                color: AppColor.colorDivider,
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "or",
                  style: AppStyle.textBodyScaffoldSmall,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Divider(
                color: AppColor.colorDivider,
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        SizedBox(height: 20),
        InkWell(
          onTap: () async {
            final result = await Navigator.pushNamed(
                context, AppRouter.createAccount,
                arguments: emailController.text);
          },
          child: Row(
            children: [
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: 40,
                  child: Center(
                      child: Text(
                    "Create Membership Account",
                    style: AppStyle.textBodyScaffoldBigType1BlackFat,
                  )),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              SizedBox(width: 10)
            ],
          ),
        )
      ],
    );
  }

  void _onClickLogIn() async {
    if (emailController.text == "" || passwordController.text == "") {
      final snackBar = SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          "Vui lòng nhập email và password",
          style: AppStyle.textBodyScaffoldBigType4BlackSlim,
        ),
        action: SnackBarAction(
          label: "Exit",
          textColor: AppColor.colorElevatedButton,
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    try {
      UserCredential item = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      Config.isGuestMode = false;

      Config.user = UserInfoModel(
          uid: item.user?.uid,
          email: item.user?.email,
          userName: item.user?.displayName);

      StorageData.setData(key: "email", value: emailController.text);
      StorageData.setData(
          key: 'user', value: jsonEncode(Config.user?.toJson()));

      Navigator.popUntil(context, ModalRoute.withName(AppRouter.homepage));
    } catch (e) {
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        final snackBar = SnackBar(
          content: Text(
            "Đăng nhập sai tài khoản hoặc mật khẩu",
            style: AppStyle.textBodyScaffoldBigType4BlackSlim,
          ),
          backgroundColor: Colors.green,
          action: SnackBarAction(
            label: "Exit",
            textColor: AppColor.colorElevatedButton,
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}
