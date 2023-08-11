import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/router/app_router.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorAppbar,
        leading: InkWell(
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName(AppRouter.logIn));
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Forgot Password", style: AppStyle.textAppar),
      ),
      body: forgotPassword(),
    );
  }

  Widget forgotPassword() {
    return Column(
      children: [
        SizedBox(height: 40),
        Center(
            child: Text("Please enter your email or phone number",
                style: AppStyle.textBodyScaffoldSmall)),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              hintText: "Email or phone number",
              hintStyle: AppStyle.textTextField,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    resetPassword();
                  },
                  child: Text(
                    "CONTINUE",
                    style: AppStyle.textElevatedButton,
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColor.colorElevatedButton),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ),
      ],
    );
  }

  void resetPassword() async {
    if (emailController.text.isEmpty) {
      final snackBar = SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          "Vui lòng nhập email của bạn",
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
      final item = await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      final snackBar = SnackBar(
        content: Text(
          "Đã gửi lại mật khẩu mới. Kiểm tra email của bạn",
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
    } catch (e) {
      if (emailController.text.isNotEmpty) {
        final snackBar = SnackBar(
          content: Text(
            "Đăng nhập sai email",
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
