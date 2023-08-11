import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/menu_page.dart';
import 'package:movie_ticket_app/router/app_router.dart';

class HomepageMovieStore extends StatefulWidget {
  const HomepageMovieStore({super.key});

  @override
  State<HomepageMovieStore> createState() => _HomepageMovieStoreState();
}

class _HomepageMovieStoreState extends State<HomepageMovieStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorAppbar,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.popUntil(
                context, ModalRoute.withName(AppRouter.homepage));
          },
        ),
        title: Text(
          "Movie Store",
          style: AppStyle.textAppar,
        ),
        actions: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/image/image_homepage_store_action.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Image.asset(
                "assets/image/image_homepage_store_map.png",
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choose a cinema",
                    style: AppStyle.textBodyScaffoldSmall,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Choose a date",
                    style: AppStyle.textBodyScaffoldSmall,
                  )
                ],
              ),
              Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.arrow_drop_up, size: 40))),
              SizedBox(width: 10)
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                "Select Cinema",
                style: AppStyle.textBodyScaffoldBigType1BlackFat,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                "Region",
                style: AppStyle.textBodyScaffoldBigType4BlackSlim,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: DropdownButton(
                    iconSize: 40,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "Hà Nội",
                          style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                        ),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                ),
              ),
              SizedBox(width: 10)
            ],
          ),
          Divider(
            color: AppColor.colorDivider,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                "Select Cinema",
                style: AppStyle.textBodyScaffoldBigType4BlackSlim,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: DropdownButton(
                    iconSize: 40,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "CGV Aeon Hà Đông",
                          style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                        ),
                      )
                    ],
                    onChanged: (value) {},
                  ),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          Divider(
            color: AppColor.colorDivider,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                "Select Date",
                style: AppStyle.textBodyScaffoldBigType4BlackSlim,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 80,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        "Today",
                        style: AppStyle.textBodyScaffoldSmall,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "30",
                        style: AppStyle.textBodyScaffoldSmall,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Center(
            child: Text(
              getDateTime(),
              style: AppStyle.textBodyScaffoldBigType4BlackSlim,
            ),
          ),
          ////////////////////////////////
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "CHOOSE",
                    style: AppStyle.textElevatedButton,
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          AppColor.colorElevatedButton),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              color: AppColor.colorOutstanding,
            ),
          )
        ],
      ),
    );
  }
}

String getDateTime() {
  var dateTime = DateTime.now();
  String formatDate = DateFormat("EEE, dd MMMM, yyyy").format(dateTime);
  return formatDate;
}
