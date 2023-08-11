import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/homepage_many_choice_for_user/choice_bloc.dart';
import 'package:movie_ticket_app/homepage_many_choice_for_user/choice_model.dart';
import 'package:movie_ticket_app/router/app_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomepageManyChoiceForUser extends StatefulWidget {
  const HomepageManyChoiceForUser({super.key});

  @override
  State<HomepageManyChoiceForUser> createState() =>
      _HomepageManyChoiceForUserState();
}

class _HomepageManyChoiceForUserState extends State<HomepageManyChoiceForUser> {
  ValueNotifier notifier = ValueNotifier(0);
  final bloc = HomepageChoiceBloc(HomepageChoiceStateInit());
  @override
  void initState() {
    super.initState();
    bloc.getChoiceHomepage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<HomepageChoiceBloc, HomepageChoiceState>(
        builder: (context, state) {
          if (state is HomepageChoiceStateInit ||
              state is HomepageChoiceStateLoading) {
            return CupertinoActivityIndicator();
          }
          if (state is HomepageChoiceStateLoaded) {
            return homepageChoice(list: state.datas);
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  Widget homepageChoice({required List<ChoiceModel> list}) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            color: Color.fromARGB(255, 138, 117, 81),
            height: 200,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Positioned(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CarouselSlider(
                  items: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRouter.webViewChoiceHallRental,
                                  arguments: list[1]);
                            },
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(200),
                                    child: CachedNetworkImage(
                                      errorWidget: (context, url, error) =>
                                          Icon((Icons.error)),
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      imageUrl: list[1].image ?? "",
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  list[1].title ?? "",
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style:
                                      AppStyle.textBodyScaffoldBigType3GreyFat,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, AppRouter.webViewChoiceCgvStore),
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(200),
                                    child: CachedNetworkImage(
                                      errorWidget: (context, url, error) =>
                                          Icon((Icons.error)),
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      imageUrl: list[2].image ?? "",
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  list[2].title ?? "",
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style:
                                      AppStyle.textBodyScaffoldBigType3GreyFat,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, AppRouter.webViewChoiceSweetbox),
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(200),
                                    child: CachedNetworkImage(
                                      errorWidget: (context, url, error) =>
                                          Icon((Icons.error)),
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      imageUrl: list[3].image ?? "",
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  list[3].title ?? "",
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style:
                                      AppStyle.textBodyScaffoldBigType3GreyFat,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, AppRouter.webViewChoiceImax),
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(200),
                                    child: CachedNetworkImage(
                                      errorWidget: (context, url, error) =>
                                          Icon((Icons.error)),
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      imageUrl: list[4].image ?? "",
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  list[4].title ?? "",
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style:
                                      AppStyle.textBodyScaffoldBigType3GreyFat,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, AppRouter.webViewChoice4dx),
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(200),
                                    child: CachedNetworkImage(
                                      errorWidget: (context, url, error) =>
                                          Icon((Icons.error)),
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      imageUrl: list[5].image ?? "",
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  list[5].title ?? "",
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style:
                                      AppStyle.textBodyScaffoldBigType3GreyFat,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, AppRouter.webViewChoiceEntertaiment),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(200),
                                    child: CachedNetworkImage(
                                      errorWidget: (context, url, error) =>
                                          Icon((Icons.error)),
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      imageUrl: list[0].image ?? "",
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  list[0].title ?? "",
                                  maxLines: 2,
                                  style:
                                      AppStyle.textBodyScaffoldBigType3GreyFat,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  options: CarouselOptions(
                      height: 150,
                      onPageChanged: (index, reason) {
                        notifier.value = index;
                      },
                      // autoPlay: true,
                      autoPlayCurve: Curves.ease,
                      autoPlayAnimationDuration: Duration(microseconds: 2000),
                      viewportFraction: 1,
                      initialPage: 0,
                      reverse: false,
                      scrollDirection: Axis.horizontal,
                      scrollPhysics: BouncingScrollPhysics())),
              const SizedBox(
                height: 20,
              ),
              ValueListenableBuilder(
                  valueListenable: notifier,
                  builder: (context, value, child) {
                    return DotsIndicator(
                      dotsCount: 2,
                      position: notifier.value,
                      decorator: DotsDecorator(
                        spacing: EdgeInsets.symmetric(horizontal: 10),
                        color: const Color.fromARGB(255, 11, 134, 234),
                        size: const Size(14, 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        activeColor: Colors.deepOrange,
                        activeSize: const Size(14.0, 14.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0)),
                      ),
                      axis: Axis.horizontal,
                      reversed: false,
                      mainAxisAlignment: MainAxisAlignment.center,
                    );
                  })
            ],
          ),
        )
      ],
    );
  }
}
