import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/banner/banner.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/homepage_banner_movie/homepage_banner_movie.dart';
import 'package:movie_ticket_app/homepage_many_choice_for_user/homepage_many_choice_for_user.dart';
import 'package:movie_ticket_app/list_cinema_by_date_page/list_cinema_by_date_page.dart';
import 'package:movie_ticket_app/log_in_page/log_in_page.dart';
import 'package:movie_ticket_app/menu_page.dart';
import 'package:movie_ticket_app/router/app_router.dart';
import 'package:movie_ticket_app/utils/config.dart';
import 'package:movie_ticket_app/utils/shared_preferences.dart';
import 'package:movie_ticket_app/videos_homepage/videos_homepage.dart';
import 'package:movie_ticket_app/promotion/what_is_hot.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorAppbar,
        ////////////////////////////////////////////////

        leading: InkWell(
          onTap: () {
            if (Config.isGuestMode == true) {
              Navigator.pushNamed(context, AppRouter.logIn);
            } else if (Config.isGuestMode == false) {
              StorageData.getData(key: "email");
            }
          },
          child: Icon(Icons.person),
        ),

        title: Center(
            child: Text(
          "Movie",
          style: AppStyle.textAppar,
        )),
        actions: [
          InkWell(
              onTap: () {
                if (Config.isGuestMode == false) {
                  StorageData.getData(key: "email");
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            alignment: Alignment.center,
                            content: Text(
                              "Bạn có muốn đăng xuất không?",
                              style: AppStyle.textBodyScaffoldBigType2RedFat,
                            ),
                            actionsAlignment: MainAxisAlignment.center,
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.popUntil(
                                        context,
                                        ModalRoute.withName(
                                            AppRouter.homepage));
                                  },
                                  child: Text(
                                    "Hủy",
                                    style: AppStyle
                                        .textBodyScaffoldBigType1BlackFat,
                                  )),
                              TextButton(
                                  onPressed: () {
                                    StorageData.removeData(key: 'email');
                                    StorageData.removeData(key: 'user');
                                    Config.isGuestMode = true;
                                    Navigator.popUntil(
                                        context,
                                        ModalRoute.withName(
                                            AppRouter.homepage));
                                  },
                                  child: Text("Đồng ý",
                                      style: AppStyle
                                          .textBodyScaffoldBigType1BlackFat)),
                            ],
                          ));
                }
              },
              child: Icon(Icons.logout)),
          SizedBox(
            width: 20,
          ),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRouter.menu);
              },
              child: Icon(Icons.menu))
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            MyWidgetBanner(),
            SizedBox(
              height: 10,
            ),
            BannerMovie(),
            SizedBox(
              height: 10,
            ),
            cinemaLocation(),
            SizedBox(height: 10),
            movieStore(),
            SizedBox(height: 10),
            HomepageManyChoiceForUser(),
            SizedBox(
              height: 20,
            ),
            WhatIsHot(),
            VideosHomepage(),
          ],
        ),
      ),
    );
  }

  Widget cinemaLocation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 10,
        ),
        Text(
          "CGV Rice City",
          style: AppStyle.textBodyScaffoldBigType3GreyFat,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "1.7km",
                style: AppStyle.textBodyScaffoldSmall,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.place,
                size: 26,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Widget movieStore() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.homepageMovieStore);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              "assets/image/image_homepage_store.png",
              height: 220,
              width: 400,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
