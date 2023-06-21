import 'package:flutter/material.dart';
import 'package:movie_ticket_app/authentication.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/create_account.dart';
import 'package:movie_ticket_app/forgot_password.dart';
import 'package:movie_ticket_app/router/app_router.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? erorTextEmail;
  String? erorTextPassword;

  bool _isObcusText = true;

  @override
  void initState() {
    print('===> init Login');
    super.initState();
  }

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
            Container(
              height: 124,
            )
          ],
        ),
      ),
    );
  }

  Widget imageHomepage() {
    return Image.asset(
      "assets/image/image_login.jpg",
      height: 250,
      width: 420,
      fit: BoxFit.cover,
    );
  }

  Widget textField_emailOrPhone() {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: TextField(
          controller: emailController,
          decoration: InputDecoration(
            // errorText: ,
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            hintText: "Email or phone number",
            hintStyle: AppStyle.textTextField,
          ),
        ));
  }

  Widget textFieldPassword() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        controller: passwordController,
        decoration: InputDecoration(
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            hintText: "Password",
            hintStyle: AppStyle.textTextField,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isObcusText = !_isObcusText;
                });
              },
              icon: Icon(
                _isObcusText ? Icons.remove_red_eye : Icons.visibility_off,
                color: Colors.black38,
              ),
            )),
        obscureText: _isObcusText,
      ),
    );
  }

  Widget registration(context) {
    return Column(
      children: [
        SizedBox(height: 40),
        ElevatedButton(
          onPressed: () async {
            await Auth().loginWithEmailPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim());
          },
          child: Text(
            "LOG IN",
            style: AppStyle.textElevatedButton,
          ),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(AppColor.colorElevatedButton),
              fixedSize: MaterialStatePropertyAll(Size(380, 40))),
        ),
        SizedBox(height: 20),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return ForgotPassword();
              },
            ));
          },
          child: Text("Forgot Password",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                  fontSize: 16)),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              width: 170,
              child: Divider(
                color: AppColor.colorDivider,
              ),
            ),
            Text(
              "or",
              style: AppStyle.textBodyScaffoldSmall,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                width: 170,
                child: Divider(
                  color: AppColor.colorDivider,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        InkWell(
          onTap: () async {
            final result =
                await Navigator.pushNamed(context, AppRouter.createAccount);
            // Navigator.push(context, MaterialPageRoute(
            //   builder: (context) {
            //     return CreateAccount();
            //   },
            // ));
            print(' ===> $result');
          },
          child: Container(
            height: 40,
            width: 320,
            child: Center(
                child: Text(
              "Create Membership Account",
              style: AppStyle.textBodyScaffoldBigType1BlackFat,
            )),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(8)),
          ),
        )
      ],
    );
  }
}
