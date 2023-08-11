import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/homepage_banner_movie/banner_movie_model.dart';
import 'package:movie_ticket_app/list_cinema_by_date_page/cinema_model.dart';
import 'package:movie_ticket_app/router/app_router.dart';
import 'package:movie_ticket_app/utils/config.dart';

class PaymentPage extends StatefulWidget {
  MovieModel? itemMovie;
  CinemaModel? itemCinema;
  String? money;
  String? quantity;
  List<String>? nameItem;
  PaymentPage(
      {super.key,
      this.itemCinema,
      this.money,
      this.quantity,
      this.nameItem,
      this.itemMovie});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int currentIndexx = 0;

  ValueNotifier currentIndex = ValueNotifier(0);

  List<BankPayment> listBankPayment = [
    BankPayment(
        image: "assets/image/ATM_Card.jpg",
        paymentMethod: "ATM card",
        isSelection: false),
    BankPayment(
        image: "assets/image/Credit_Card.png",
        paymentMethod: "Credit Card",
        isSelection: false),
    BankPayment(
        image: "assets/image/Momo.jpg",
        paymentMethod: "Momo",
        isSelection: false),
    BankPayment(
        image: "assets/image/Zalo_Pay.jpg",
        paymentMethod: "ZaloPay",
        isSelection: false),
    BankPayment(
        image: "assets/image/Shopee_Pay.png",
        paymentMethod: "ShopeePay",
        isSelection: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorAppbar,
        leading: InkWell(
            onTap: () => Navigator.pop(context), child: Icon(Icons.arrow_back)),
        title: Text(
          "Payment",
          style: AppStyle.textAppar,
        ),
      ),
      body: Column(
        children: [
          buildDetailMovie(),
          SizedBox(
            height: 10,
          ),
          buildTotalMoney(),
          informationAndTypeOfPayment(context)
        ],
      ),
    );
  }

  Widget buildDetailMovie() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CachedNetworkImage(
          imageUrl: widget.itemCinema?.movieSchedules?[0].image ?? "",
          height: 150,
          width: 100,
          fit: BoxFit.fill,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.itemCinema?.movieSchedules?[0].movieName ?? "",
                style: AppStyle.textBodyScaffoldBigType1BlackFat,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                widget.itemCinema?.movieSchedules?[0].rated ?? "",
                style: TextStyle(
                    color: Colors.red,
                    fontStyle: FontStyle.italic,
                    fontSize: 10),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                widget.itemCinema?.movieSchedules?[0].day ?? "",
                style: AppStyle.textBodyScaffoldBigType4BlackSlim,
              ),
              Text(
                widget.itemCinema?.movieSchedules?[0].time ?? "",
                style: AppStyle.textBodyScaffoldBigType4BlackSlim,
              ),
              Text(
                widget.itemCinema?.name ?? "",
                style: AppStyle.textBodyScaffoldBigType3GreyFat,
              ),
              Row(
                children: [
                  Text("Cinema",
                      style: AppStyle.textBodyScaffoldBigType3GreyFat),
                  SizedBox(width: 10),
                  Text(
                    widget.itemCinema?.movieSchedules?[0].roomId.toString() ??
                        "",
                    style: AppStyle.textBodyScaffoldBigType3GreyFat,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.nameItem?.length == 1 ? "Seat" : "Seats",
                    style: AppStyle.textBodyScaffoldBigType3GreyFat,
                  ),
                  SizedBox(width: 10),
                  Text(
                    widget.nameItem?.toString() ?? "",
                    style: AppStyle.textBodyScaffoldBigType3GreyFat,
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildTotalMoney() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Total Payment:",
          style: AppStyle.textBodyScaffoldBigType2RedFat,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          widget.money ?? "",
          style: AppStyle.textBodyScaffoldBigType2RedFat,
        ),
        SizedBox(width: 4),
        Text(
          "đ",
          style: AppStyle.textBodyScaffoldBigType2RedFat,
        ),
      ],
    );
  }

  Widget informationAndTypeOfPayment(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: AppColor.colorOutstanding,
              child: Center(
                  child: Text(
                "TICKET INFORMATION",
                style: AppStyle.textBodyScaffoldBigType1BlackFat,
              )),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 10),
                Text(
                  "Quantity",
                  style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.quantity ?? "",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ],
                )),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            Divider(
              color: AppColor.colorDivider,
            ),
            Row(
              children: [
                SizedBox(width: 10),
                Text(
                  "Subtotal",
                  style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.money ?? "",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "đ",
                      style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                    ),
                  ],
                )),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: AppColor.colorOutstanding,
              child: Center(
                  child: Text(
                "BANK PAYMENT",
                style: AppStyle.textBodyScaffoldBigType1BlackFat,
              )),
            ),
            SizedBox(
              height: 10,
            ),
            ValueListenableBuilder(
              valueListenable: currentIndex,
              builder: (context, value, child) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listBankPayment.length,
                  itemBuilder: (context, index) {
                    var item = listBankPayment[index];
                    return InkWell(
                      onTap: () {
                        currentIndex.value = index;
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.asset(
                                    item.image ?? "",
                                    height: 30,
                                    width: 50,
                                    fit: BoxFit.fill,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                item.paymentMethod ?? "",
                                style:
                                    AppStyle.textBodyScaffoldBigType4BlackSlim,
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Visibility(
                                      visible: index == currentIndex.value,
                                      child: Icon(
                                        Icons.check,
                                        size: 28,
                                        color: Colors.red,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                          Divider(
                            color: AppColor.colorDivider,
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 140,
              color: AppColor.colorOutstanding,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '''I agree to the "Terms of Use" and am purchasing tickets for age appropriate audience.''',
                          style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color: Colors.blue),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            showLoadingIndicator(context);
                            insertTicket();

                            await Future.delayed(Duration(seconds: 1));

                            Navigator.pop(context);
                            Navigator.pushNamed(
                                context, AppRouter.completlyPayment,
                                arguments: {
                                  "item": widget.itemCinema,
                                  "money": widget.money,
                                  "seats": widget.nameItem
                                });
                          },
                          child: Text(
                            "I agree and Continue",
                            style: AppStyle.textElevatedButton,
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                AppColor.colorElevatedButton),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void insertTicket() async {
    Map<String, dynamic> inforTickets = {
      "amountMoney": widget.money ?? "",
      "movieId": widget.itemMovie?.id ?? "",
      "movieName": widget.itemMovie?.name ?? "",
      "movieTime": widget.itemMovie?.time ?? "",
      "seats": widget.nameItem ?? [],
      "theaterId": widget.itemCinema?.id ?? "",
      "theaterName": widget.itemCinema?.name ?? "",
      "userId": Config.user?.uid ?? "",
    };
    await FirebaseFirestore.instance.collection("tickets").add(inforTickets);
  }
}

class BankPayment {
  String? image;
  String? paymentMethod;
  bool? isSelection;
  BankPayment({this.image, this.paymentMethod, this.isSelection});
}

void showLoadingIndicator(context) {
  showDialog(
    context: context,
    builder: (context) {
      return Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: CupertinoActivityIndicator(
            radius: 14,
          ));
    },
  );
}



// tao
// inseart
// xoa
// update