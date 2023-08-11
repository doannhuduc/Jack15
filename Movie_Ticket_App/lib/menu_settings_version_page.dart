import 'package:flutter/material.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';

class MenuSettingVersion extends StatefulWidget {
  const MenuSettingVersion({super.key});

  @override
  State<MenuSettingVersion> createState() => _MenuSettingVersionState();
}

class _MenuSettingVersionState extends State<MenuSettingVersion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorAppbar,
        title: Text(
          "Version Infor",
          style: AppStyle.textAppar,
        ),
        actions: [Icon(Icons.menu)],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 40,
              color: AppColor.colorOutstanding,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 26,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "Current Version",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                  Positioned(
                      right: 10,
                      child: Text(
                        "2.6.0",
                        style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                      ))
                ],
              ),
            ),
            Container(
              height: 40,
              color: AppColor.colorOutstanding,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 26,
              child: Center(
                child: Text(
                  "This is the lastest version",
                  style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                ),
              ),
            ),
            Container(
              width: 420,
              height: 100,
              color: AppColor.colorOutstanding,
              child: Center(
                child: Text(
                  "Support iOS 9.0 or later",
                  style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                ),
              ),
            ),
            Container(
              height: 500,
              width: 420,
              color: AppColor.colorOutstanding,
            )
          ],
        ),
      ),
    );
  }
}
