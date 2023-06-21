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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorAppbar,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
              // Navigator.popUntil(context, ModalRoute.withName(AppRouter.logIn));
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
                style: AppStyle.textBodyScaffoldBigType4BlackSlim)),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
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
        ElevatedButton(
          onPressed: () {},
          child: Text(
            "CONTINUE",
            style: AppStyle.textElevatedButton,
          ),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(AppColor.colorElevatedButton),
              fixedSize: MaterialStatePropertyAll(Size(380, 40))),
        ),
      ],
    );
  }
}
