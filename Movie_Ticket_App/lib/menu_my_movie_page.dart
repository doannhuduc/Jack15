import 'package:flutter/material.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/log_in_page/log_in_page.dart';
import 'package:movie_ticket_app/router/app_router.dart';

class MenuMyMovie extends StatefulWidget {
  const MenuMyMovie({super.key});

  @override
  State<MenuMyMovie> createState() => _MenuMyMovieState();
}

class _MenuMyMovieState extends State<MenuMyMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
              onTap: () => Navigator.popUntil(
                  context, ModalRoute.withName(AppRouter.menu)),
              child: Icon(Icons.arrow_back)),
          backgroundColor: AppColor.colorAppbar,
          title: Text(
            "Membership Benefits",
            style: AppStyle.textAppar,
          )),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Image.asset(
                  "assets/image/image_points_reward.jpg",
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 80),
                Text(
                  "POINTS REWARD",
                  style: AppStyle.textBodyScaffoldBigType1BlackFat,
                ),
                SizedBox(height: 20),
                Text(
                  "1 point = 1000 VND",
                  style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                ),
                Text(
                  "usable at all MOVIE in Vietnam",
                  style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                ),
                Container(
                  height: 330,
                )
              ],
            ),
          ),
          Positioned(
              bottom: 40,
              left: 40,
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, AppRouter.logIn),
                child: Container(
                  height: 40,
                  width: 140,
                  child: Center(
                      child: Text(
                    "LOG IN",
                    style: AppStyle.textBodyScaffoldBigType1BlackFat,
                  )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 0.8)),
                ),
              )),
          Positioned(
              bottom: 40,
              right: 40,
              child: InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, AppRouter.createAccount),
                child: Container(
                  height: 40,
                  width: 140,
                  child: Center(
                      child: Text(
                    "Register",
                    style: AppStyle.textBodyScaffoldBigType1BlackFat,
                  )),
                  decoration: BoxDecoration(
                      color: AppColor.colorElevatedButton,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 0.8)),
                ),
              ))
        ],
      ),
    );
  }
}
