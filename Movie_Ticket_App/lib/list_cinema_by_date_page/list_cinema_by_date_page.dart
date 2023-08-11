import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/homepage_banner_movie/banner_movie_model.dart';
import 'package:movie_ticket_app/list_cinema_by_date_page/cinema_model.dart';
import 'package:movie_ticket_app/list_cinema_by_date_page/list_cinema_by_date_bloc.dart';
import 'package:movie_ticket_app/router/app_router.dart';
import 'package:table_calendar/table_calendar.dart';

class CinemaListByDatePage extends StatefulWidget {
  MovieModel? movieModel;
  CinemaListByDatePage({super.key, this.movieModel});

  @override
  State<CinemaListByDatePage> createState() => _CinemaListByDatePageState();
}

class _CinemaListByDatePageState extends State<CinemaListByDatePage> {
////////////////////////////////////////////////////////////////////////////////////

  DateTime today = DateTime.now();

  ValueNotifier daySelected = ValueNotifier<DateTime>(DateTime.now());

  final bloc = ListCinemaBloc(ListCinemaStateInit());

  @override
  void initState() {
    bloc.getListCinema(widget.movieModel?.theaters ?? []);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorAppbar,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text(
          widget.movieModel?.name ?? "",
          style: AppStyle.textAppar,
        ),
        actions: [
          Icon(Icons.gps_fixed),
          SizedBox(
            width: 20,
          ),
          InkWell(
              onTap: () => Navigator.pushNamed(context, AppRouter.menu),
              child: Icon(Icons.menu))
        ],
      ),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder<ListCinemaBloc, ListCinemaState>(
          builder: (context, state) {
            if (state is ListCinemaStateInit ||
                state is ListCinemaStateLoading) {
              return Center(
                child: SizedBox(
                  child: CupertinoActivityIndicator(),
                  height: 250,
                ),
              );
            }
            if (state is ListCinemaStateLoaded) {
              return listCinemaByDate(list: state.datas);
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget listCinemaByDate({required List<CinemaModel> list}) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: ValueListenableBuilder(
        valueListenable: daySelected,
        builder: (context, value, child) {
          return Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      "Movie Format",
                      style: AppStyle.textBodyScaffoldSmall,
                    ),
                  ),
                  Text(
                    "ALL",
                    style: AppStyle.textBodyScaffoldBigType5RedSlim,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              /////////////////////////////////////////////////////////////////////////////////////

              TableCalendar(
                  focusedDay: daySelected.value,
                  firstDay: DateTime.utc(2023, 07, 01),
                  lastDay: DateTime.utc(2023, 08, 31),
                  locale: "en_US",
                  availableGestures: AvailableGestures.all,
                  rowHeight: 40,
                  headerStyle: HeaderStyle(
                      formatButtonVisible: false, titleCentered: true),
                  onDaySelected: (selectedDay, focusedDay) {
                    daySelected.value = selectedDay;
                  },
                  selectedDayPredicate: (day) =>
                      isSameDay(day, daySelected.value)),

              SizedBox(
                height: 10,
              ),
              Text(
                getDateTime(),
                style: AppStyle.textBodyScaffoldBigType4BlackSlim,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  var item = list[index];
                  return ExpansionTile(
                    title: Row(
                      children: [
                        Text(item.name ?? ""),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text(item.location?.cityName ?? "")],
                          ),
                        )
                      ],
                    ),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 10),
                              Icon(
                                Icons.circle,
                                size: 10,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("2D Phụ Đề Việt")
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  height: 40,
                                  child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: item.movieSchedules?.length,
                                    itemBuilder: (context, index) {
                                      var itemSchedule =
                                          item.movieSchedules?[index];
                                      var dayString = DateFormat("dd/MM/yyyy")
                                          .format(daySelected.value);
                                      if (itemSchedule?.day != dayString) {
                                        return SizedBox.shrink();
                                      }
                                      return InkWell(
                                        onTap: () {
                                          // if (daySelected.value
                                          //         .millisecondsSinceEpoch <
                                          //     today.millisecondsSinceEpoch)

                                          //     {
                                          //   showDialog(
                                          //       context: context,
                                          //       builder: (context) =>
                                          //           AlertDialog(
                                          //             content: Text('abc'),
                                          //             actions: [
                                          //               TextButton(
                                          //                   onPressed: () =>
                                          //                       Navigator.of(
                                          //                           context),
                                          //                   child:
                                          //                       Text('Da hieu'))
                                          //             ],
                                          //           ));
                                          //   return;
                                          // }
                                          Navigator.pushNamed(context,
                                              AppRouter.detailCinemaPage,
                                              arguments: {
                                                "itemCinema": item,
                                                "itemMovie": widget.movieModel
                                              });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(4),
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width: 120,
                                          color: Color.fromARGB(
                                              255, 223, 219, 219),
                                          child: Center(
                                              child: Text(
                                            itemSchedule?.time ?? '',
                                            style:
                                                AppStyle.textBodyScaffoldSmall,
                                          )),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

String getDateTime() {
  var dateTime = DateTime.now();
  String formatDate = DateFormat("EEE, dd MMMM, yyyy").format(dateTime);
  return formatDate;
}

String formatDate() {
  var dateTime = DateTime.now();
  String dayString = DateFormat("dd/MM/yyyy").format(dateTime);
  return dayString;
}
