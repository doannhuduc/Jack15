import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/router/app_router.dart';

class MenuNotification extends StatefulWidget {
  const MenuNotification({super.key});

  @override
  State<MenuNotification> createState() => _MenuNotificationState();
}

class _MenuNotificationState extends State<MenuNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorAppbar,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () => Navigator.popUntil(
              context, ModalRoute.withName(AppRouter.homepage)),
        ),
        title: Text("Notice", style: AppStyle.textAppar),
        actions: [
          InkWell(
              onTap: () {
                Navigator.popUntil(
                    context, ModalRoute.withName(AppRouter.menu));
              },
              child: Icon(Icons.menu))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 235, 229, 211),
        child: Column(
          children: [
            SizedBox(height: 200),
            ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.asset(
                "assets/image/image_notice_log_out.jpg",
                height: 200,
                width: 200,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Text(
                "There is no data",
                style: AppStyle.textBodyScaffoldSmall,
              ),
            )
          ],
        ),
      ),
    );
  }
}
