import 'package:flutter/material.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';

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
        leading: Icon(Icons.arrow_back),
        title: Text("Notice", style: AppStyle.textAppar),
        actions: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.menu))
        ],
      ),
      body: Container(
        height: 1000,
        width: 420,
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
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "There is no data",
              style: AppStyle.textBodyScaffoldSmall,
            )
          ],
        ),
      ),
    );
  }
}
