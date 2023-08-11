import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/menu_my_tickets/my_ticket_bloc.dart';
import 'package:movie_ticket_app/menu_my_tickets/ticket_model.dart';
import 'package:movie_ticket_app/router/app_router.dart';

class MyTicket extends StatefulWidget {
  const MyTicket({super.key});

  @override
  State<MyTicket> createState() => _MyTicketState();
}

class _MyTicketState extends State<MyTicket> {
  final bloc = MyTicketBloc(MyTicketStateInit());
  @override
  void initState() {
    super.initState();
    bloc.getMyTicket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorAppbar,
        leading: InkWell(
            onTap: () => Navigator.popUntil(
                context, ModalRoute.withName(AppRouter.homepage)),
            child: Icon(Icons.arrow_back)),
        title: Center(
          child: Text(
            "My Ticket",
            style: AppStyle.textAppar,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder<MyTicketBloc, MyTicketState>(
          builder: (context, state) {
            if (state is MyTicketStateInit || state is MyTicketStateLoading) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Text(
                    "There is no data",
                    style: AppStyle.textBodyScaffoldBigType2RedFat,
                  )));
            }

            if (state is MyTicketStateLoaded) {
              return informationOfTicket(list: state.data);
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget informationOfTicket({required List<TicketModel> list}) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        itemCount: list.length,
        separatorBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.red,
                thickness: 6,
              ),
            ],
          );
        },
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                  color: AppColor.colorOutstanding,
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          "CGV Cinemas : Successfully booked tickets",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Image.network(
                "https://tuvanluat.vn/maytech_data/uploads/2020/04/C%C3%A1ch-ki%E1%BB%83m-tra-xu%E1%BA%A5t-x%E1%BB%A9-h%C3%A0ng-h%C3%B3a.png",
                height: 160,
                width: MediaQuery.of(context).size.width - 60,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      "Please show this code to the CGV ticket counter to collect your ticket",
                      style: AppStyle.textBodyScaffoldSmall,
                    ),
                  ),
                  SizedBox(
                    width: 20,
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
                  Expanded(
                    child: Text(
                      "Ticket information",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "User ID",
                    style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(list[index].userId ?? ""),
                    ],
                  )),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Amount Money",
                    style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text(list[index].amountMoney ?? ""), Text("đ")],
                  )),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Movie ID",
                    style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(list[index].movieId ?? ""),
                    ],
                  )),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Name Of Movie",
                    style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                        Expanded(
                          child: Text(
                            list[index].movieName ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ])),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Time",
                    style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(list[index].movieTime ?? ""),
                    ],
                  )),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    list[index].seats == 1 ? "Seat" : "Seats",
                    style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(list[index].seats.toString()),
                    ],
                  )),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Theater ID",
                    style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(list[index].theaterId ?? ""),
                    ],
                  )),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Name Of Theater",
                    style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(list[index].theaterName ?? ""),
                    ],
                  )),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
