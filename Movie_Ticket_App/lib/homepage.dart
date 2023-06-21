import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/banner.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/homepage_movie_store.dart';
import 'package:movie_ticket_app/homepage_whathot_all.dart';
import 'package:movie_ticket_app/log_in.dart';
import 'package:movie_ticket_app/menu.dart';
import 'package:movie_ticket_app/router/app_router.dart';
import 'package:movie_ticket_app/widget_tree.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorAppbar,
        leading: InkWell(
          child: Icon(Icons.person),
          onTap: () {
            Navigator.pushNamed(context, AppRouter.logIn);
            // Navigator.push(context, MaterialPageRoute(
            //   builder: (context) {
            //     return LogIn();
            //   },
            // ));
          },
        ),
        title: Center(
            child: Text(
          "Movie",
          style: AppStyle.textAppar,
        )),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return LogIn();
                  },
                ));
              },
              child: Icon(Icons.login)),
          SizedBox(
            width: 20,
          ),
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return MenuApp();
                  },
                ));
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
            choiceOfUser(),
            SizedBox(
              height: 10,
            ),
            featuredMovie(),
            SizedBox(
              height: 10,
            ),
            cinemaLocation(),
            SizedBox(height: 10),
            movieStore(),
            SizedBox(height: 10),
            manyChoiceOfUser(),
            SizedBox(
              height: 10,
            ),
            listViewWhatHot(),
            listViewVideos(),
          ],
        ),
      ),
    );
  }

  Widget choiceOfUser() {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Text(
          "Now Showing",
          style: AppStyle.textBodyScaffoldBigType1BlackFat,
        ),
        SizedBox(
          width: 80,
        ),
        Text(
          "Special",
          style: AppStyle.textBodyScaffoldBigType1BlackFat,
        ),
        SizedBox(
          width: 70,
        ),
        Text(
          "Coming Soon",
          style: AppStyle.textBodyScaffoldBigType1BlackFat,
        ),
      ],
    );
  }

  Widget featuredMovie() {
    return Stack(
      children: [
        Positioned(
          child: Container(
            height: 410,
            width: 420,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
              color: Color.fromARGB(255, 185, 221, 253),
            ),
          ),
        ),
        Positioned(
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, AppRouter.bookTickets),
            child: Container(
              height: 360,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(14),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        "assets/image/image_listview_homepage.jpg",
                        height: 360,
                        width: 260,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Positioned(
            left: 10,
            top: 360,
            child: Text(
              "THE FLASH",
              style: AppStyle.textBodyScaffoldBigType1BlackFat,
            )),
        Positioned(
            left: 10,
            top: 382,
            child: Row(
              children: [
                Text(
                  "2hrs 24mins 16 Jun, 2023",
                  style: AppStyle.textBodyScaffoldSmall,
                ),
              ],
            )),
        Positioned(
            left: 300,
            top: 350,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18))),
                    backgroundColor:
                        MaterialStatePropertyAll(AppColor.colorElevatedButton)),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 190,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "FAST AND FURIOUS X",
                              style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                            ),
                            Divider(
                              color: AppColor.colorDivider,
                            ),
                            Text(
                              "Book this Movie",
                              style: AppStyle.textBodyScaffoldBigType5RedSlim,
                            ),
                            Divider(
                              color: AppColor.colorDivider,
                            ),
                            Text(
                              "Booking by Theater",
                              style: AppStyle.textBodyScaffoldSmall,
                            ),
                            Divider(
                              color: AppColor.colorDivider,
                            ),
                            Text(
                              "Booking by Movie",
                              style: AppStyle.textBodyScaffoldSmall,
                            ),
                            Divider(
                              color: AppColor.colorDivider,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 420,
                                height: 20,
                                child: Center(
                                  child: Text(
                                    "Cancel",
                                    style: AppStyle.textBodyScaffoldSmall,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  "Book Now",
                  style: AppStyle.textBodyScaffoldBigType1BlackFat,
                )))
      ],
    );
  }

  Widget cinemaLocation() {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Text(
          "CGV Rice City",
          style: AppStyle.textBodyScaffoldBigType3GreyFat,
        ),
        SizedBox(
          width: 200,
        ),
        Text(
          "1.7km",
          style: AppStyle.textBodyScaffoldSmall,
        ),
        SizedBox(
          width: 30,
        ),
        Icon(
          Icons.gps_fixed_outlined,
          size: 26,
        )
      ],
    );
  }

  Widget movieStore() {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return HomepageMovieStore();
          },
        ));
      },
      child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(
            "assets/image/image_homepage_store.png",
            height: 220,
            width: 400,
            fit: BoxFit.cover,
          )),
    );
  }

  Widget manyChoiceOfUser() {
    return Stack(
      children: [
        Container(
            color: Color.fromARGB(255, 138, 117, 81),
            height: 180,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/image/image_homepage_gridview_1.jpg",
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "CGV STORE",
                      style: AppStyle.textBodyScaffoldBigType3GreyFat,
                    ),
                  ],
                );
              },
            )),
        Positioned(
            top: 150,
            left: 190,
            child: SmoothPageIndicator(
              axisDirection: Axis.horizontal,
              controller: controller,
              count: 2,
            ))
      ],
    );
  }

  Widget listViewWhatHot() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 10),
            Text(
              "What's Hot",
              style: AppStyle.textBodyScaffoldBigType1BlackFat,
            ),
            SizedBox(width: 240),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return HomePageWhatHotAll();
                  },
                ));
              },
              child: Container(
                child: Center(
                    child: Text(
                  "All",
                  style: AppStyle.textBodyScaffoldBigType1BlackFat,
                )),
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.4),
                    borderRadius: BorderRadius.circular(14)),
              ),
            )
          ],
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/image/image_listview_what_hot.jpg",
                        height: 120,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    '''PHIM TƯƠNG TÁC
 PHI VỤ NỬA ĐÊM''',
                    style: AppStyle.textBodyScaffoldBigType3GreyFat,
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }

  Widget listViewVideos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 10),
            Text(
              "Videos",
              style: AppStyle.textBodyScaffoldBigType1BlackFat,
            ),
            SizedBox(width: 268),
            Container(
              child: Center(
                  child: Text(
                "All",
                style: AppStyle.textBodyScaffoldBigType1BlackFat,
              )),
              height: 30,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1.4),
                  borderRadius: BorderRadius.circular(14)),
            )
          ],
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/image/image_listview_videos.jpg",
                        height: 120,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    "THIỆN ÁC ĐỐI ĐẦU 3",
                    style: AppStyle.textBodyScaffoldBigType3GreyFat,
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
