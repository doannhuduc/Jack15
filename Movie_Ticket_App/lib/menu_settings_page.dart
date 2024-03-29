import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/menu_settings_version_page.dart';
import 'package:movie_ticket_app/router/app_router.dart';

class MenuSetting extends StatefulWidget {
  const MenuSetting({super.key});

  @override
  State<MenuSetting> createState() => _MenuSettingState();
}

class _MenuSettingState extends State<MenuSetting> {
  ValueNotifier faceId = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.colorAppbar,
          leading: InkWell(
              onTap: () => Navigator.popUntil(
                  context, ModalRoute.withName(AppRouter.homepage)),
              child: Icon(Icons.arrow_back)),
          title: Text(
            "Settings",
            style: AppStyle.textAppar,
          ),
          actions: [
            InkWell(
                onTap: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName(AppRouter.menu));
                },
                child: Icon(Icons.menu))
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            InkWell(
              onTap: () => Navigator.pushNamed(context, AppRouter.logIn),
              child: Container(
                margin: EdgeInsets.only(top: 20),
                height: 30,
                child: Stack(
                  children: [
                    Positioned(
                      left: 10,
                      child: Text(
                        "Account",
                        style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    color: AppColor.colorOutstanding,
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: Text(
                    "LANGUAGE:",
                    style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 30,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "English",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: AppColor.colorDivider,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 30,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "Tiếng Việt",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                ],
              ),
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
                    "SYSTEM",
                    style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 30,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "Clear Cached",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                ],
              ),
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
                    "SECURITY & AUTHENTICATION",
                    style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                  ),
                )
              ],
            ),
            Stack(children: [
              Positioned(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 30,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 10,
                        child: Text(
                          "Login by FACE ID",
                          style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: ValueListenableBuilder(
                    valueListenable: faceId,
                    builder: (context, value, child) {
                      return CupertinoSwitch(
                        value: faceId.value,
                        onChanged: (value) {
                          faceId.value = value;
                        },
                      );
                    },
                  ))
            ]),
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
                    "OTHERS...",
                    style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 30,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "FAQ",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: AppColor.colorDivider,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRouter.menuSettingVersion);
              },
              child: Container(
                margin: EdgeInsets.only(top: 20),
                height: 30,
                child: Stack(
                  children: [
                    Positioned(
                      left: 10,
                      child: Text(
                        "Version",
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
            ),
            Divider(
              color: AppColor.colorDivider,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 30,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "Term Of Use",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: AppColor.colorDivider,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 30,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "Payment Policy",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: AppColor.colorDivider,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 30,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "Privacy Policy",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: AppColor.colorDivider,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 30,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "Movie Rule",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: AppColor.colorDivider,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 30,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      "Company Profile",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: AppColor.colorDivider,
            ),
          ]),
        ));
  }
}
