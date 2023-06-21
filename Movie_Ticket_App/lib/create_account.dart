import 'package:flutter/material.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/router/app_router.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              // Navigator.pop(context, 'create account screen');
              // Navigator.ph(context, AppRouter.logIn,
              //     result: 'passs data from singup');
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
              height: 180,
              width: 420,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    hintText: "Name",
                    hintStyle: AppStyle.textTextField,
                    prefixIcon: Icon(
                      Icons.star_border,
                      color: Colors.red,
                      size: 16,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    hintText: "Phone number",
                    hintStyle: AppStyle.textTextField,
                    prefixIcon: Icon(
                      Icons.star_border,
                      color: Colors.red,
                      size: 16,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    hintText: "Email",
                    hintStyle: AppStyle.textTextField,
                    prefixIcon: Icon(
                      Icons.star_border,
                      color: Colors.red,
                      size: 16,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: "Password",
                  hintStyle: AppStyle.textTextField,
                  suffixIcon: Icon(Icons.remove_red_eye),
                  prefixIcon: Icon(
                    Icons.star_border,
                    color: Colors.red,
                    size: 16,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 180,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: "Date of Birth",
                        hintStyle: AppStyle.textTextField,
                        prefixIcon: Icon(
                          Icons.star_border,
                          color: Colors.red,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                DropdownButton(
                  items: [DropdownMenuItem(child: Text(""))],
                  onChanged: (value) {},
                ),
                Container(
                  width: 180,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: "Gender",
                        hintStyle: AppStyle.textTextField,
                        prefixIcon: Icon(
                          Icons.star_border,
                          color: Colors.red,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: DropdownButton(
                    items: [DropdownMenuItem(child: Text(""))],
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 380,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: "Region",
                        hintStyle: AppStyle.textTextField,
                        prefixIcon: Icon(
                          Icons.star_border,
                          color: Colors.red,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                DropdownButton(
                  items: [DropdownMenuItem(child: Text(""))],
                  onChanged: (value) {},
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 380,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: "Prefer Theater",
                        hintStyle: AppStyle.textTextField,
                        prefixIcon: Icon(
                          Icons.star_border,
                          color: Colors.red,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                DropdownButton(
                  items: [DropdownMenuItem(child: Text(""))],
                  onChanged: (value) {},
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.star_border,
                  color: Colors.red,
                  size: 16,
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
              height: 26,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "REGISTER",
                  style: AppStyle.textElevatedButton,
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColor.colorElevatedButton),
                    fixedSize: MaterialStatePropertyAll(Size(380, 40))),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                '''I agree to the "Terms of Use" and am purchasing
tickets for age appropriate audience.''',
                style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.blue),
              ),
            ),
            Container(
              height: 28,
            )
          ],
        ),
      ),
    );
  }
}
