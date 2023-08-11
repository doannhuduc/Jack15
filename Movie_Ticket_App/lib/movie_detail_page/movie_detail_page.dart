import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/homepage_banner_movie/banner_movie_model.dart';
import 'package:movie_ticket_app/movie_detail_page/youtube_player_page.dart';
import 'package:movie_ticket_app/router/app_router.dart';
import 'package:movie_ticket_app/utils/config.dart';
import 'package:movie_ticket_app/utils/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailPage extends StatefulWidget {
  MovieModel? itemMovie;

  MovieDetailPage({super.key, this.itemMovie});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  ValueNotifier lines = ValueNotifier(3);
  ValueNotifier favourite = ValueNotifier(100);
  ValueNotifier colorFavourite = ValueNotifier(Colors.black);
  @override
  void initState() {
    // TODO: lay data ve tu api, firebase
    // call api
    initData();

    super.initState();
  }

  void initData() async {
    await Future.delayed(
        Duration(seconds: 2)); // goi va lay data ve "movieId" --> json
    //json ---> MovieModel
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: ElevatedButton(
                  onPressed: () {
                    if (Config.isGuestMode == true) {
                      Navigator.pushReplacementNamed(context, AppRouter.logIn);
                    } else {
                      StorageData.getData(key: "email");
                      Navigator.pushNamed(
                        context,
                        AppRouter.listCinemaByDatePage,
                        arguments: widget.itemMovie,
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColor.colorElevatedButton),
                  ),
                  child: Text(
                    "BOOK NOW",
                    style: AppStyle.textElevatedButton,
                  )),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
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
              Stack(alignment: Alignment.bottomCenter, children: [
                Container(
                  // color: Colors.red,
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  top: 0,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.youtubePlayerPage,
                          arguments: widget.itemMovie?.trailer ?? "");
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: widget.itemMovie?.banner ?? "",
                          height: 280,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                        Icon(
                          Icons.play_circle,
                          size: 60,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    left: 10,
                    child: SizedBox(
                      height: 130,
                      width: MediaQuery.of(context).size.width - 10,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(
                              imageUrl: widget.itemMovie?.image ?? "",
                              height: 130,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  widget.itemMovie?.name ?? "",
                                  maxLines: 2,
                                  style:
                                      AppStyle.textBodyScaffoldBigType3GreyFat,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      child: Row(
                                        children: [
                                          Icon(Icons.calendar_month),
                                          Text(
                                            widget.itemMovie?.dayStart ?? "",
                                            style: AppStyle
                                                .textBodyScaffoldBigType4BlackSlim,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      child: Row(
                                        children: [
                                          Icon(Icons.lock_clock),
                                          Text(
                                            widget.itemMovie?.time ?? "",
                                            style: AppStyle
                                                .textBodyScaffoldBigType4BlackSlim,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                ////////////////////////////////////////////////////////////////////////////////////////////////
                                ValueListenableBuilder(
                                  valueListenable: favourite,
                                  builder: (context, value, child) {
                                    return Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            if (Config.isGuestMode == false &&
                                                favourite.value == 100) {
                                              favourite.value++;
                                              colorFavourite.value = Colors.red;
                                            } else if (Config.isGuestMode ==
                                                    false &&
                                                favourite.value == 101) {
                                              favourite.value--;
                                              colorFavourite.value =
                                                  Colors.black;
                                            } else {
                                              Navigator.pushReplacementNamed(
                                                  context, AppRouter.logIn);
                                            }
                                          },
                                          icon: ValueListenableBuilder(
                                            valueListenable: colorFavourite,
                                            builder: (context, value, child) {
                                              return Icon(
                                                Icons.favorite,
                                                color: colorFavourite.value,
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          favourite.value.toString(),
                                          style: AppStyle
                                              .textBodyScaffoldBigType4BlackSlim,
                                        ),
                                        SizedBox(
                                          width: 60,
                                        ),
                                        Icon(Icons.share),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ]),
              InkWell(
                onTap: () {
                  if (lines.value < 4) {
                    lines.value = 100;
                  } else if (lines.value > 4) {
                    lines.value = 3;
                  }
////////////////////////////////////////////////////////////////////////////////////////////
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ValueListenableBuilder(
                    valueListenable: lines,
                    builder: (context, value, child) {
                      return Text(
                        widget.itemMovie?.description ?? "",
                        style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                        maxLines: lines.value,
                        overflow: TextOverflow.ellipsis,
                      );
                    },
                  ),
                ),
              ),
              Divider(
                color: AppColor.colorDivider,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Rated",
                      style: AppStyle.textBodyScaffoldBigType1BlackFat,
                    ),
                  ),
                  Expanded(
                      flex: 8,
                      child: Text(
                        widget.itemMovie?.rated ?? "",
                        style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Genre",
                      style: AppStyle.textBodyScaffoldBigType1BlackFat,
                    ),
                  ),
                  Expanded(
                      flex: 8,
                      child: Text(
                        widget.itemMovie?.categoty ?? "",
                        style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Director",
                      style: AppStyle.textBodyScaffoldBigType1BlackFat,
                    ),
                  ),
                  Expanded(
                      flex: 8,
                      child: Text(
                        widget.itemMovie?.director ?? "",
                        style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Cast",
                      style: AppStyle.textBodyScaffoldBigType1BlackFat,
                    ),
                  ),
                  Expanded(
                      flex: 8,
                      child: Text(
                        widget.itemMovie?.actor ?? "",
                        style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Language",
                      style: AppStyle.textBodyScaffoldBigType1BlackFat,
                    ),
                  ),
                  Expanded(
                      flex: 8,
                      child: Text(
                        widget.itemMovie?.language ?? "",
                        style: AppStyle.textBodyScaffoldBigType4BlackSlim,
                      ))
                ],
              ),
              Divider(
                color: AppColor.colorDivider,
              ),
            ],
          ),
        ));
  }
}
