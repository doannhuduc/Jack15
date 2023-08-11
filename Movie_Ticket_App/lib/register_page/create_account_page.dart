import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/router/app_router.dart';

class CreateAccount extends StatefulWidget {
  CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  ValueNotifier isObScureText = ValueNotifier(true);

  ValueNotifier errorTextEmail = ValueNotifier("");
  ValueNotifier errorTextPassword = ValueNotifier("");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Register", style: AppStyle.textAppar),
        backgroundColor: AppColor.colorAppbar,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/image/image_register.jpg",
              height: 240,
              width: 420,
              fit: BoxFit.fill,
            ),
            textFieldEmail(),
            textFieldPassword(),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 34,
                ),
                Icon(
                  Icons.star_border,
                  color: Colors.red,
                  size: 14,
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  "Required field",
                  style: AppStyle.textBodyScaffoldSmall,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _onClickRegister();
                    },
                    child: Center(
                      child: Text(
                        "REGISTER",
                        style: AppStyle.textElevatedButton,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          AppColor.colorElevatedButton),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '''I agree to the "Terms of Use" and am purchasing tickets for age appropriate audience.''',
                    style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.blue),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget textFieldEmail() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ValueListenableBuilder(
        valueListenable: errorTextEmail,
        builder: (context, value, child) {
          return TextField(
            onChanged: (value) {
              if (value.isEmpty) {
                errorTextEmail.value = "Email không được để trống";
              } else if (value.isNotEmpty) {
                errorTextEmail.value = "";
              }
            },
            controller: emailController,
            decoration: InputDecoration(
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                errorMaxLines: 3,
                errorText: errorTextEmail.value,
                hintText: "Email",
                hintStyle: AppStyle.textTextField,
                prefixIcon: Icon(
                  Icons.star_border,
                  color: Colors.red,
                  size: 14,
                )),
          );
        },
      ),
    );
  }

  Widget textFieldPassword() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ValueListenableBuilder(
        valueListenable: isObScureText,
        builder: (context, value, child) {
          return ValueListenableBuilder(
            valueListenable: errorTextPassword,
            builder: (context, value, child) {
              return TextField(
                onChanged: (value) {
                  if (value.contains(" ") || value.length < 6) {
                    errorTextPassword.value =
                        "Password không chứa dấu cách và có ít nhất 6 ký tự";
                  } else if (value.isNotEmpty) {
                    errorTextPassword.value = "";
                  }
                },
                controller: passController,
                decoration: InputDecoration(
                  errorMaxLines: 3,
                  errorText: errorTextPassword.value,
                  focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: "Password",
                  hintStyle: AppStyle.textTextField,
                  prefixIcon: Icon(
                    Icons.star_border,
                    color: Colors.red,
                    size: 14,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        isObScureText.value = !isObScureText.value;
                      },
                      icon: Icon(
                        isObScureText.value
                            ? Icons.visibility_off
                            : Icons.remove_red_eye,
                        color: Colors.black38,
                      )),
                ),
                obscureText: isObScureText.value,
              );
            },
          );
        },
      ),
    );
  }

  void _onClickRegister() async {
    if (emailController.text.isEmpty || passController.text.isEmpty) {
      final snackBar = SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          "Vui lòng nhập Email và Password",
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
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passController.text);
      Navigator.popUntil(context, ModalRoute.withName(AppRouter.logIn));
      final snackBar = SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          "Bạn đã tạo tài khoản thành công",
          style: AppStyle.textBodyScaffoldBigType4BlackSlim,
        ),
        action: SnackBarAction(
          label: "Exit",
          textColor: AppColor.colorElevatedButton,
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      if (emailController.text.isNotEmpty && passController.text.isNotEmpty) {
        final snackBar = SnackBar(
          content: Text(
            "Tài khoản đã được đăng ký",
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





// Sau đoạn code : obscureText: _isObscureText,
            // Row(
            //   children: [
            //     Container(
            //       width: 180,
            //       child: Padding(
            //         padding: const EdgeInsets.all(4.0),
            //         child: TextField(
            //           decoration: InputDecoration(
            //             focusedBorder: UnderlineInputBorder(
            //                 borderSide: BorderSide(color: Colors.black)),
            //             hintText: "Date of Birth",
            //             hintStyle: AppStyle.textTextField,
            //             prefixIcon: Icon(
            //               Icons.star_border,
            //               color: Colors.red,
            //               size: 16,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     DropdownButton(
            //       items: [DropdownMenuItem(child: Text(""))],
            //       onChanged: (value) {},
            //     ),
            //     Container(
            //       width: 180,
            //       child: Padding(
            //         padding: const EdgeInsets.all(4.0),
            //         child: TextField(
            //           decoration: InputDecoration(
            //             focusedBorder: UnderlineInputBorder(
            //                 borderSide: BorderSide(color: Colors.black)),
            //             hintText: "Gender",
            //             hintStyle: AppStyle.textTextField,
            //             prefixIcon: Icon(
            //               Icons.star_border,
            //               color: Colors.red,
            //               size: 16,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: DropdownButton(
            //         items: [DropdownMenuItem(child: Text(""))],
            //         onChanged: (value) {},
            //       ),
            //     ),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Container(
            //       width: 380,
            //       child: Padding(
            //         padding: const EdgeInsets.all(4.0),
            //         child: TextField(
            //           decoration: InputDecoration(
            //             focusedBorder: UnderlineInputBorder(
            //                 borderSide: BorderSide(color: Colors.black)),
            //             hintText: "Region",
            //             hintStyle: AppStyle.textTextField,
            //             prefixIcon: Icon(
            //               Icons.star_border,
            //               color: Colors.red,
            //               size: 16,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     DropdownButton(
            //       items: [DropdownMenuItem(child: Text(""))],
            //       onChanged: (value) {},
            //     ),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Container(
            //       width: 380,
            //       child: Padding(
            //         padding: const EdgeInsets.all(4.0),
            //         child: TextField(
            //           decoration: InputDecoration(
            //             focusedBorder: UnderlineInputBorder(
            //                 borderSide: BorderSide(color: Colors.black)),
            //             hintText: "Prefer Theater",
            //             hintStyle: AppStyle.textTextField,
            //             prefixIcon: Icon(
            //               Icons.star_border,
            //               color: Colors.red,
            //               size: 16,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     DropdownButton(
            //       items: [DropdownMenuItem(child: Text(""))],
            //       onChanged: (value) {},
            //     ),
            //   ],
            // ),


// Sau đoạn code : fit: BoxFit.fill
            // Padding(
            //   padding: const EdgeInsets.all(4.0),
            //   child: TextField(
            //     decoration: InputDecoration(
            //         focusedBorder: UnderlineInputBorder(
            //             borderSide: BorderSide(color: Colors.black)),
            //         hintText: "Name",
            //         hintStyle: AppStyle.textTextField,
            //         prefixIcon: Icon(
            //           Icons.star_border,
            //           color: Colors.red,
            //           size: 16,
            //         )),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(4.0),
            //   child: TextField(
            //     decoration: InputDecoration(
            //         focusedBorder: UnderlineInputBorder(
            //             borderSide: BorderSide(color: Colors.black)),
            //         hintText: "Phone number",
            //         hintStyle: AppStyle.textTextField,
            //         prefixIcon: Icon(
            //           Icons.star_border,
            //           color: Colors.red,
            //           size: 16,
            //         )),
            //   ),
            // ),