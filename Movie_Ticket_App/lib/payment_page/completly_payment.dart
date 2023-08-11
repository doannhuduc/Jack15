import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/list_cinema_by_date_page/cinema_model.dart';
import 'package:movie_ticket_app/utils/config.dart';
import 'package:movie_ticket_app/utils/utils.dart';

class CompletlyPayment extends StatefulWidget {
  CinemaModel? item;
  String? amountOfMoney;
  List<String>? seats;

  CompletlyPayment({super.key, this.item, this.amountOfMoney, this.seats});

  @override
  State<CompletlyPayment> createState() => _CompletlyPaymentState();
}

class _CompletlyPaymentState extends State<CompletlyPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorAppbar,
        leading: InkWell(
            onTap: () => Navigator.pop(context), child: Icon(Icons.arrow_back)),
        title: Center(
          child: Text(
            "Secure Payment",
            style: AppStyle.textAppar,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 60,
              color: AppColor.colorOutstanding,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                    "FUNDS",
                    style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                  )),
                ],
              ),
            ),
            Container(
              height: 100,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/image/Momo.jpg",
                      height: 60,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "MoMo Wallet",
                        style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [Text(Util.currency(2391242)), Text("đ")],
                      )
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Change",
                          style: AppStyle.textBodyScaffoldBigType5RedSlim,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
            Container(
              height: 60,
              color: AppColor.colorOutstanding,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                    ("transaction details").toUpperCase(),
                    style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 340,
              ////////////////////////////////////////////////////////////////////////
              // color: Colors.purple,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Supplier",
                        style: AppStyle.textBodyScaffoldBigType3GreyFat,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "CGV Cinemas",
                              style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Account",
                        style: AppStyle.textBodyScaffoldBigType3GreyFat,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              Config.user?.userName ??
                                  Config.user?.email ??
                                  "",
                              style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Content",
                        style: AppStyle.textBodyScaffoldBigType3GreyFat,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              widget.item?.movieSchedules?[0].movieName ?? "",
                              style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Divider(
                      color: AppColor.colorDivider,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.seats?.length == 1 ? "Seat" : "Seats",
                        style: AppStyle.textBodyScaffoldBigType3GreyFat,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              widget.seats.toString(),
                              style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Divider(
                      color: AppColor.colorDivider,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Amount of money",
                        style: AppStyle.textBodyScaffoldBigType3GreyFat,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              widget.amountOfMoney ?? "",
                              style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                            ),
                            Text(
                              "đ",
                              style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Divider(
                      color: AppColor.colorDivider,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Transaction fee",
                        style: AppStyle.textBodyScaffoldBigType3GreyFat,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Free of charge",
                              style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Divider(
                      color: AppColor.colorDivider,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Total money",
                        style: AppStyle.textBodyScaffoldBigType3GreyFat,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              widget.amountOfMoney ?? "",
                              style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                            ),
                            Text(
                              "đ",
                              style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Divider(
                      color: AppColor.colorDivider,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: Icon(
                Icons.check,
                size: 60,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Payment success",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Please keep the receipt to present upon arrival at the cinema",
                      style: AppStyle.textBodyScaffoldBigType5RedSlim,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
