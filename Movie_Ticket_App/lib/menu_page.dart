import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/menu_my_movie_page.dart';
import 'package:movie_ticket_app/menu_notification_page.dart';
import 'package:movie_ticket_app/menu_settings_page.dart';
import 'package:movie_ticket_app/menu_theaters_page.dart';
import 'package:movie_ticket_app/router/app_router.dart';
import 'package:movie_ticket_app/utils/config.dart';
import 'package:movie_ticket_app/utils/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuApp extends StatefulWidget {
  const MenuApp({super.key});

  @override
  State<MenuApp> createState() => _MenuAppState();
}

class _MenuAppState extends State<MenuApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorAppbar,
        leading: InkWell(
            onTap: () => Navigator.pop(context), child: Icon(Icons.arrow_back)),
        title: Center(
          child: ClipRRect(
            child: Image.asset(
              "assets/image/image_avatar.jpg",
              height: 50,
              width: 50,
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRouter.menuNotification);
              },
              child: Icon(Icons.notifications)),
          SizedBox(
            width: 20,
          ),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRouter.menuSetting);
              },
              child: Icon(Icons.settings))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
////////////////////////////////////////////////////////////////////////////////////////////////
          InkWell(
            onTap: () {
              if (Config.isGuestMode == true) {
                Navigator.pushNamed(context, AppRouter.menuMyMovie);
              }
            },
            child: Text(
              Config.isGuestMode == true
                  ? "Log In / Sign Up"
                  : Config.user?.email ?? "",
              style: AppStyle.textBodyScaffoldBigType2RedFat,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Divider(
              color: AppColor.colorDivider,
            ),
          ),
          Text(
            "Booking by Movie",
            style: AppStyle.textBodyScaffoldBigType1BlackFat,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Divider(
              color: AppColor.colorDivider,
            ),
          ),
          Text(
            "Booking by Theater",
            style: AppStyle.textBodyScaffoldBigType1BlackFat,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Divider(
              color: AppColor.colorDivider,
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.popUntil(
                          context, ModalRoute.withName(AppRouter.homepage));
                    },
                    child: Column(
                      children: [
                        SizedBox(width: 160),
                        Icon(Icons.home),
                        Text(
                          "Home",
                          style: AppStyle.textBodyScaffoldSmall,
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.menuMyMovie);
                    },
                    child: Column(
                      children: [
                        SizedBox(width: 110),
                        Icon(Icons.personal_video),
                        Text(
                          "My Movie",
                          style: AppStyle.textBodyScaffoldSmall,
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.menuTheater);
                    },
                    child: Column(
                      children: [
                        SizedBox(width: 110),
                        Icon(Icons.theaters),
                        Text(
                          "Theater",
                          style: AppStyle.textBodyScaffoldSmall,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Column(
                    children: [
                      SizedBox(width: 160),
                      Icon(Icons.star),
                      Text(
                        "Special Theater",
                        style: AppStyle.textBodyScaffoldSmall,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(width: 110),
                      Icon(Icons.card_giftcard_sharp),
                      Text(
                        "New & Offers",
                        style: AppStyle.textBodyScaffoldSmall,
                      )
                    ],
                  ),
                  //////////////////////////////////////////////////////////////
                  InkWell(
                    onTap: () {
                      if (Config.isGuestMode == false) {
                        Navigator.pushNamed(context, AppRouter.menuMyTicket);
                      } else if (Config.isGuestMode == true) {
                        myTicketNoLogIn(context);
                      }
                    },
                    child: Column(
                      children: [
                        SizedBox(width: 110),
                        Icon(Icons.movie),
                        Text(
                          "My Tickets",
                          style: AppStyle.textBodyScaffoldSmall,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Column(
                    children: [
                      SizedBox(width: 160),
                      Icon(Icons.reviews),
                      Text(
                        "Rewards",
                        style: AppStyle.textBodyScaffoldSmall,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
/////////////////////////////////////////////////////////////////////////////////////////////////////

          Visibility(
            visible: Config.isGuestMode == false,
            child: ElevatedButton.icon(
                onPressed: () async {
                  final item = FirebaseAuth.instance.signOut();
                  //remove share referencer
                  StorageData.removeData(key: 'email');
                  StorageData.removeData(key: 'user');
                  Config.isGuestMode = true;

                  Navigator.popUntil(
                      context, ModalRoute.withName(AppRouter.homepage));
                },
                icon: Icon(Icons.logout),
                label: Text("Log Out")),
          )
        ],
      ),
    );
  }
}

void myTicketNoLogIn(context) {
  showDialog(
    context: context,
    builder: (context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.colorAppbar,
        ),
        body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              "Please Log In To View Your Ticket",
              style: AppStyle.textBodyScaffoldBigType2RedFat,
            ),
          ),
        ),
      );
    },
  );
}


  // Container(
          //     height: 420,
          //     child: GridView.count(
          //       shrinkWrap: true,
          //       scrollDirection: Axis.vertical,
          //       crossAxisCount: 3,
          //       children: [
          //         Column(
          //           children: [Icon(Icons.home), Text("Home")],
          //         ),
          //         Column(
          //           children: [Icon(Icons.home), Text("Home")],
          //         ),
          //         Column(
          //           children: [Icon(Icons.home), Text("Home")],
          //         ),
          //         Column(
          //           children: [Icon(Icons.home), Text("Home")],
          //         ),
          //         Column(
          //           children: [Icon(Icons.home), Text("Home")],
          //         ),
          //         Column(
          //           children: [Icon(Icons.home), Text("Home")],
          //         ),
          //         Column(
          //           children: [Icon(Icons.home), Text("Home")],
          //         )
          //       ],
          //     ))
