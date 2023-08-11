import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/homepage.dart';
import 'package:movie_ticket_app/promotion/promotion_bloc.dart';
import 'package:movie_ticket_app/promotion/promotion_model.dart';
import 'package:movie_ticket_app/promotion/web_view_page.dart';
import 'package:movie_ticket_app/router/app_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PromotionPage extends StatefulWidget {
  const PromotionPage({super.key});

  @override
  State<PromotionPage> createState() => _PromotionPageState();
}

class _PromotionPageState extends State<PromotionPage> {
  final bloc = PromotionBloc(PromotionStateInit());
  @override
  void initState() {
    super.initState();
    bloc.getListPromotion();
  }

  ScrollController scrollControllerUpTop = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder<PromotionBloc, PromotionState>(
          builder: (context, state) {
            if (state is PromotionStateInit || state is PromotionStateLoading) {
              return SizedBox(
                height: 250,
                child: Material(child: CupertinoActivityIndicator()),
              );
            }
            if (state is PromotionStateLoaded) {
              return promotion(list: state.datas);
            }
            return SizedBox.shrink();
          },
        ));
  }

  Widget promotion({required List<PromotionModel> list}) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorAppbar,
        leading: InkWell(
            onTap: () => Navigator.pop(context), child: Icon(Icons.arrow_back)),
        title: Text("News & Offers", style: AppStyle.textAppar),
        actions: [
          InkWell(
              onTap: () => Navigator.pushNamed(context, AppRouter.menu),
              child: Icon(Icons.menu))
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollControllerUpTop,
        physics: BouncingScrollPhysics(),
        child: Container(
          color: AppColor.colorOutstanding,
          child: Column(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  var item = list[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return WebViewPage(itemSecond: item);
                        },
                      ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: CachedNetworkImage(
                              imageUrl: item.image ?? "",
                              height: 280,
                              width: 400,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                item.description ?? "",
                                style:
                                    AppStyle.textBodyScaffoldBigType1BlackFat,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  scrollControllerUpTop.animateTo(
                    0.0,
                    curve: Curves.easeOut,
                    duration: Duration(milliseconds: 300),
                  );
                },
                child: Icon(
                  Icons.arrow_upward,
                  size: 50,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
