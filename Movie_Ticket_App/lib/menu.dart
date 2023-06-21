import 'package:flutter/material.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/menu_my_movie.dart';
import 'package:movie_ticket_app/menu_notification.dart';
import 'package:movie_ticket_app/menu_settings.dart';
import 'package:movie_ticket_app/menu_theater.dart';
import 'package:movie_ticket_app/router/app_router.dart';

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
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MenuNotification();
                },
              ));
            },
            child: Icon(Icons.notifications)),
        title: Center(
          child: ClipRRect(
            child: Image.asset(
              "assets/image/image_avatar.jpg",
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return MenuSetting();
                  },
                ));
              },
              child: Icon(Icons.settings))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MenuMyMovie();
                },
              ));
            },
            child: Text(
              "Login/Sign Up",
              style: AppStyle.textBodyScaffoldBigType2RedFat,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Divider(
              color: AppColor.colorDivider,
            ),
          ),

          Text(
            "Booking by Movie",
            style: AppStyle.textBodyScaffoldBigType1BlackFat,
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Divider(
              color: AppColor.colorDivider,
            ),
          ),

          Text(
            "Booking by Theater",
            style: AppStyle.textBodyScaffoldBigType1BlackFat,
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
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
                      Navigator.pop(context);
                      // Navigator.popUntil(
                      //     context, ModalRoute.withName(AppRouter.homepage));
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
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return MenuMyMovie();
                        },
                      ));
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
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return MenuTheater();
                        },
                      ));
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
                  Column(
                    children: [
                      SizedBox(width: 110),
                      Icon(Icons.movie_edit),
                      Text(
                        "My tickets",
                        style: AppStyle.textBodyScaffoldSmall,
                      )
                    ],
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
              )
            ],
          )
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
        ],
      ),
    );
  }
}
