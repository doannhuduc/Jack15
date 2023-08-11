import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket_app/banner/banner_bloc.dart';
import 'package:movie_ticket_app/banner/banner_model.dart';
import 'package:movie_ticket_app/banner/web_view_banner_page.dart';
import 'package:movie_ticket_app/promotion/promotion_model.dart';
import 'package:movie_ticket_app/router/app_router.dart';

class MyWidgetBanner extends StatefulWidget {
  const MyWidgetBanner({super.key});

  @override
  State<MyWidgetBanner> createState() => _MyWidgetBannerState();
}

class _MyWidgetBannerState extends State<MyWidgetBanner> {
  ValueNotifier _dotNotifier = ValueNotifier(0);

  final bloc = BannerBloc(BannerStateInit());

  @override
  void initState() {
    super.initState();

    bloc.getListBanner();
  }

  @override
  Widget build(context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<BannerBloc, BannerState>(
        builder: (context, state) {
          if (state is BannerStateInit || state is BannerStateLoading) {
            return Center(
              child: SizedBox(
                height: 250,
                child: CupertinoActivityIndicator(),
              ),
            );
          }
          if (state is BannerStateLoaded) {
            return Column(
              children: [carouselSlider(list: state.datas)],
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  Widget carouselSlider({required List<BannerModel> list}) {
    return Stack(children: [
      Positioned(
        child: Image.asset(
          "assets/image/image_background_for_carousel_slider.png",
          height: 250,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
      ),
      Positioned(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                autoPlayCurve: Curves.ease,
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                viewportFraction: 1,
                initialPage: 0,
                reverse: false,
                scrollDirection: Axis.horizontal,
                scrollPhysics: BouncingScrollPhysics(),
                onPageChanged: (index, reason) {
                  _dotNotifier.value = index;
                },
              ),
              items: list.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebViewBannerPage(
                              itemHere: i,
                            ),
                          )),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl: i.image ?? "",
                          width: 330,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            ValueListenableBuilder(
                valueListenable: _dotNotifier,
                builder: (context, value, child) {
                  return DotsIndicator(
                    dotsCount: list.length,
                    position: _dotNotifier.value,
                    decorator: DotsDecorator(
                      color: Color.fromARGB(255, 11, 134, 234),
                      size: const Size.square(16.0),
                      activeSize: const Size(24.0, 14.0),
                      activeColor: Colors.deepOrange,
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  );
                }),
          ],
        ),
      ),
    ]);
  }
}
