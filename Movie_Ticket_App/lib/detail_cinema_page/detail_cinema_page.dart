import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/homepage_banner_movie/banner_movie_model.dart';
import 'package:movie_ticket_app/list_cinema_by_date_page/cinema_model.dart';
import 'package:movie_ticket_app/log_in_page/log_in_page.dart';
import 'package:movie_ticket_app/payment_page/payment_page.dart';
import 'package:movie_ticket_app/router/app_router.dart';
import 'package:movie_ticket_app/utils/utils.dart';

class DetailCinemaPage extends StatefulWidget {
  CinemaModel? itemCinema;
  MovieModel? itemMovie;
  DetailCinemaPage({super.key, this.itemCinema, this.itemMovie});

  @override
  State<DetailCinemaPage> createState() => _DetailCinemaPageState();
}

class _DetailCinemaPageState extends State<DetailCinemaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 72, 71, 71),
      appBar: _buildAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/image/screen_movie.jpg",
            width: MediaQuery.of(context).size.width - 40,
            height: 200,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 20,
          ),
          _buildSeatsWidget(),
          SizedBox(height: 40),
          _buildTypeSeat(),
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          Expanded(flex: 5, child: _buildBottomWidget()),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColor.colorAppbar,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(Icons.arrow_back),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.itemCinema?.name ?? "",
            style: AppStyle.textAppar,
          ),
          Row(
            children: [
              Text(
                "Cinema",
                style: AppStyle.textBodyScaffoldSmall,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                widget.itemCinema?.movieSchedules?[0].roomId.toString() ?? "",
                style: AppStyle.textBodyScaffoldSmall,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.itemCinema?.movieSchedules?[0].day ?? "",
                style: AppStyle.textBodyScaffoldSmall,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.itemCinema?.movieSchedules?[0].time ?? "",
                style: AppStyle.textBodyScaffoldSmall,
              ),
            ],
          )
        ],
      ),
      actions: [
        InkWell(
            onTap: () => Navigator.pushNamed(context, AppRouter.menu),
            child: Icon(Icons.menu))
      ],
    );
  }

  List<String> listSeat = [
    "A10",
    "A9",
    "A8",
    "A7",
    "A6",
    "A5",
    "A4",
    "A3",
    "A2",
    "A1",
    "B10",
    "B9",
    "B8",
    "B7",
    "B6",
    "B5",
    "B4",
    "B3",
    "B2",
    "B1",
    "C10",
    "C9",
    "C8",
    "C7",
    "C6",
    "C5",
    "C4",
    "C3",
    "C2",
    "C1",
    "D10",
    "D9",
    "D8",
    "D7",
    "D6",
    "D5",
    "D4",
    "D3",
    "D2",
    "D1"
  ];

  ValueNotifier seatsSelected = ValueNotifier(<String>[]);

  Widget _buildSeatsWidget() {
    return ValueListenableBuilder(
      valueListenable: seatsSelected,
      builder: (context, value, child) {
        return GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 10, crossAxisSpacing: 6, mainAxisSpacing: 6),
            itemCount: listSeat.length,
            itemBuilder: (context, index) {
              final nameOfSeat = listSeat[index];

              bool isExist = seatsSelected.value.contains(nameOfSeat);

              return InkWell(
                onTap: () {
                  if (isExist == false) {
                    seatsSelected.value.add(nameOfSeat);
                  } else {
                    seatsSelected.value.remove(nameOfSeat);
                  }
                  setState(() {});
                },
                child: Container(
                  color: isExist == true
                      ? AppColor.colorElevatedButton
                      : AppColor.colorOutstanding,
                  child: Center(child: Text("$nameOfSeat")),
                ),
              );
            });
      },
    );
  }

  Widget _buildTypeSeat() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(
        width: 30,
      ),
      Expanded(
        flex: 2,
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              color: AppColor.colorOutstanding,
            ),
            SizedBox(width: 4),
            Text(
              "Standard",
              style: AppStyle.textBodyScaffoldBigType3GreyFat,
            ),
          ],
        ),
      ),
      Expanded(
        flex: 4,
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              color: AppColor.colorElevatedButton,
            ),
            SizedBox(width: 4),
            Text(
              "Selected",
              style: AppStyle.textBodyScaffoldBigType3GreyFat,
            ),
          ],
        ),
      ),
    ]);
  }

  int priceOfTicket = 100000;

  Widget _buildBottomWidget() {
    return ValueListenableBuilder(
      valueListenable: seatsSelected,
      builder: (context, value, child) {
        return Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.itemMovie?.name ?? "",
                      style: AppStyle.textBodyScaffoldBigType1BlackFat,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "2D Phụ Đề Việt",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.textBodyScaffoldSmall,
                    ),
                    Row(
                      children: [
                        Text(
                          Util.currency(
                              seatsSelected.value.length * priceOfTicket),
                          style: AppStyle.textBodyScaffoldBigType3GreyFat,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "đ",
                          style: AppStyle.textBodyScaffoldBigType3GreyFat,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(width: 20),
                        Text(
                          (seatsSelected.value.length).toString(),
                          style: AppStyle.textBodyScaffoldSmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(seatsSelected.value.length > 1 ? "seats" : "seat")
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (seatsSelected.value.length >= 1 &&
                          seatsSelected.value.length < 7) {
                        Navigator.pushNamed(context, AppRouter.paymentPage,
                            arguments: {
                              "itemMovie": widget.itemMovie,
                              "itemCinema": widget.itemCinema,
                              "money": Util.currency(
                                  seatsSelected.value.length * priceOfTicket),
                              "quantity":
                                  (seatsSelected.value.length).toString(),
                              "seatsSelect": seatsSelected.value,
                            });
                      } else if (seatsSelected.value.length > 6) {
                        final snackBar = SnackBar(
                          content: Text(
                            "Vui lòng chọn ít hơn 7 chỗ ngồi",
                            style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                          ),
                          action: SnackBarAction(
                            label: "Exit",
                            textColor: AppColor.colorElevatedButton,
                            onPressed: () {},
                          ),
                          backgroundColor: Colors.green,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        final snackBar = SnackBar(
                          content: Text(
                            "Vui lòng chọn ít nhất 1 chỗ ngồi",
                            style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                          ),
                          backgroundColor: Colors.green,
                          action: SnackBarAction(
                            label: "Exit",
                            textColor: AppColor.colorElevatedButton,
                            onPressed: () {
                              // todo
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          "Payment",
                          style: AppStyle.textElevatedButton,
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: AppColor.colorElevatedButton,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20)),
                      height: 30,
                      width: 120,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
