import 'package:flutter/material.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/homepage.dart';

class MenuTheater extends StatefulWidget {
  const MenuTheater({super.key});

  @override
  State<MenuTheater> createState() => _MenuTheaterState();
}

class _MenuTheaterState extends State<MenuTheater> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorAppbar,
        leading: Icon(Icons.arrow_back),
        title: Text(
          "Select Cinema",
          style: AppStyle.textAppar,
        ),
        actions: [
          Icon(Icons.gps_fixed_outlined),
          SizedBox(width: 20),
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.menu))
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 70,
                    width: 420,
                    color: AppColor.colorOutstanding,
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: Text(
                    "RECOMMENDATION",
                    style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 26,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "CGV Rice City",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: Text(
                      "1,7km",
                      style: AppStyle.textBodyScaffoldBigType5RedSlim,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: AppColor.colorDivider,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 26,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "CGV Vincom Royal City",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: Text(
                      "2,8km",
                      style: AppStyle.textBodyScaffoldBigType5RedSlim,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: AppColor.colorDivider,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 26,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "Trương Định Plaza",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: Text(
                      "2,8km",
                      style: AppStyle.textBodyScaffoldBigType5RedSlim,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: AppColor.colorDivider,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 26,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "CGV Micpec Tower",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: Text(
                      "3km",
                      style: AppStyle.textBodyScaffoldBigType5RedSlim,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: AppColor.colorDivider,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 26,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "CGV Mac Plaza (Machinco)",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: Text(
                      "3,3km",
                      style: AppStyle.textBodyScaffoldBigType5RedSlim,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: AppColor.colorDivider,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 26,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "CGV Hà Nội Centerpoint",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: Text(
                      "3,3km",
                      style: AppStyle.textBodyScaffoldBigType5RedSlim,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 70,
                    width: 420,
                    color: AppColor.colorOutstanding,
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: Text(
                    "SELECT REGION",
                    style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 26,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "Hà Nội",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: Text(
                      "23",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: AppColor.colorDivider,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 26,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "Hưng Yên",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: Text(
                      "1",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: AppColor.colorDivider,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 26,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "Phú Thọ",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: Text(
                      "1",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: AppColor.colorDivider,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 26,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "Thái Nguyên",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: Text(
                      "1",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: AppColor.colorDivider,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 26,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "Hải Phòng",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: Text(
                      "2",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: AppColor.colorDivider,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 26,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "Yên Bái",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: Text(
                      "1",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: AppColor.colorDivider,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 26,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "Quảng Ninh",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: Text(
                      "3",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: AppColor.colorDivider,
            )
          ],
        ),
      ),
    );
  }
}
