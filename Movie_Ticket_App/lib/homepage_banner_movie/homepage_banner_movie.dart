import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/detail_cinema_page/detail_cinema_page.dart';
import 'package:movie_ticket_app/homepage_banner_movie/banner_movie_bloc.dart';
import 'package:movie_ticket_app/homepage_banner_movie/banner_movie_model.dart';
import 'package:movie_ticket_app/movie_detail_page/movie_detail_page.dart';
import 'package:movie_ticket_app/router/app_router.dart';

class BannerMovie extends StatefulWidget {
  const BannerMovie({super.key});

  @override
  State<BannerMovie> createState() => _BannerMovieState();
}

class _BannerMovieState extends State<BannerMovie> {
  final bloc = BannerMovieBloc(BannerMovieStateInit());
  @override
  void initState() {
    super.initState();
    bloc.getListMovieModel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<BannerMovieBloc, BannerMovieState>(
        builder: (context, state) {
          if (state is BannerMovieStateInit || state is BannerMovieStateInit) {
            return SizedBox(
              height: 250,
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is BannerMovieStateLoaded) {
            return bannerMovie(context: context, list: state.datas);
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}

Widget bannerMovie(
    {required BuildContext context, required List<MovieModel> list}) {
  return Stack(
    children: [
      Positioned(
        child: Container(
          height: 370,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
            color: Color.fromARGB(255, 185, 221, 253),
          ),
        ),
      ),
      Positioned(
        child: Container(
          // color: Colors.red,
          height: 360,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var item = list[index];
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.movieDetailPage,
                      arguments: item);
                },
                child: Stack(
                  children: [
                    Container(
                      height: 400,
                      margin: EdgeInsets.only(top: 10, bottom: 70, left: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(
                          imageUrl: item.banner ?? "",
                          height: 300,
                          width: 390,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                        left: 10,
                        bottom: 30,
                        child: Text(
                          item.name ?? "",
                          style: AppStyle.textBodyScaffoldBigType1BlackFat,
                        )),
                    Positioned(
                        left: 10,
                        bottom: 10,
                        child: Row(
                          children: [
                            Text(
                              item.time ?? "",
                              style: AppStyle.textBodyScaffoldSmall,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              item.dayStart ?? "",
                              style: AppStyle.textBodyScaffoldSmall,
                            ),
                          ],
                        )),
                    Positioned(
                        right: 0,
                        bottom: 10,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                                backgroundColor: MaterialStatePropertyAll(
                                    AppColor.colorElevatedButton)),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 190,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          item.name ?? "",
                                          style: AppStyle
                                              .textBodyScaffoldBigType4BlackSlim,
                                        ),
                                        Divider(
                                          color: AppColor.colorDivider,
                                        ),
                                        Text(
                                          "Book this Movie",
                                          style: AppStyle
                                              .textBodyScaffoldBigType5RedSlim,
                                        ),
                                        Divider(
                                          color: AppColor.colorDivider,
                                        ),
                                        Text(
                                          "Booking by Theater",
                                          style: AppStyle.textBodyScaffoldSmall,
                                        ),
                                        Divider(
                                          color: AppColor.colorDivider,
                                        ),
                                        Text(
                                          "Booking by Movie",
                                          style: AppStyle.textBodyScaffoldSmall,
                                        ),
                                        Divider(
                                          color: AppColor.colorDivider,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: 420,
                                            height: 20,
                                            child: Center(
                                              child: Text(
                                                "Cancel",
                                                style: AppStyle
                                                    .textBodyScaffoldSmall,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(
                              "Book Now",
                              style: AppStyle.textBodyScaffoldBigType1BlackFat,
                            )))
                  ],
                ),
              );
            },
          ),
        ),
      ),
    ],
  );
}
