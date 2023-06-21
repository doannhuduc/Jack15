import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageWhatHotAll extends StatefulWidget {
  const HomePageWhatHotAll({super.key});

  @override
  State<HomePageWhatHotAll> createState() => _HomePageWhatHotAllState();
}

class _HomePageWhatHotAllState extends State<HomePageWhatHotAll> {
  ScrollController scrollControllerUpTop = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorAppbar,
        title: Text("News & Offers", style: AppStyle.textAppar),
        actions: [Icon(Icons.menu)],
      ),
      body: SingleChildScrollView(
        controller: scrollControllerUpTop,
        physics: BouncingScrollPhysics(),
        child: Container(
          height: 1250,
          color: AppColor.colorOutstanding,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    "assets/image/image_homepage_carousel_slider_5.png",
                    height: 220,
                    width: 400,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    "assets/image/image_homepage_whathot_all_1.jpg",
                    height: 220,
                    width: 400,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    "assets/image/image_homepage_whathot_all_2.jpg",
                    height: 220,
                    width: 400,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    "assets/image/image_homepage_whathot_all_3.jpg",
                    height: 220,
                    width: 400,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    "assets/image/image_homepage_whathot_all_4.jpg",
                    height: 220,
                    width: 400,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  scrollControllerUpTop.animateTo(
                    0.0,
                    curve: Curves.easeOut,
                    duration: Duration(milliseconds: 300),
                  );
                },
                child: Icon(
                  Icons.arrow_upward,
                  size: 50,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
