import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/router/app_router.dart';

class BookTickets extends StatefulWidget {
  const BookTickets({super.key});

  @override
  State<BookTickets> createState() => _BookTicketsState();
}

class _BookTicketsState extends State<BookTickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.colorAppbar,
          leading: InkWell(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
              // Navigator.popUntil(
              //     context, ModalRoute.withName(AppRouter.homepage));
            },
          ),
          title: Text(
            "Book Tickets",
            style: AppStyle.textAppar,
          ),
          actions: [
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
              Stack(children: [
                Container(
                  height: 420,
                ),
                Positioned(
                  child: Image.asset(
                    "assets/image/image_book_tickets.jpg",
                  ),
                ),
                Positioned(
                    left: 10,
                    top: 160,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/image/image_listview_homepage.jpg",
                        height: 200,
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                    )),
                Positioned(
                    left: 170,
                    top: 160,
                    child: Text(
                      "THE FLASH",
                      style: AppStyle.textBodyScaffoldBigType3GreyFat,
                    )),
                Positioned(
                    left: 170,
                    top: 210,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(6)),
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_month),
                          Text(
                            "16/6/2023",
                            style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                          )
                        ],
                      ),
                    )),
                Positioned(
                    left: 286,
                    top: 210,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(6)),
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        children: [
                          Icon(Icons.lock_clock),
                          Text(
                            "2hrs 24mins",
                            style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                          )
                        ],
                      ),
                    )),
                Positioned(
                    left: 170,
                    top: 250,
                    child: Row(
                      children: [
                        Icon(Icons.heart_broken),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "968",
                          style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Icon(Icons.share),
                      ],
                    )),
                Positioned(
                    left: 10,
                    bottom: 10,
                    child: Text(
                      '''The plot is unknown. Feature film based on the comic
book superhero, The Flash.''',
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ))
              ]),
              Divider(
                color: AppColor.colorDivider,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          AppColor.colorElevatedButton),
                      fixedSize: MaterialStatePropertyAll(Size(380, 40))),
                  child: Text(
                    "BOOK NOW",
                    style: AppStyle.textElevatedButton,
                  ))
            ],
          ),
        ));
  }
}
