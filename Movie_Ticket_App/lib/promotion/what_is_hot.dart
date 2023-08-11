import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/promotion/promotion_bloc.dart';
import 'package:movie_ticket_app/promotion/promotion_model.dart';
import 'package:movie_ticket_app/promotion/promotion_page.dart';
import 'package:movie_ticket_app/promotion/web_view_page.dart';
import 'package:movie_ticket_app/router/app_router.dart';

class WhatIsHot extends StatefulWidget {
  const WhatIsHot({super.key});

  @override
  State<WhatIsHot> createState() => _WhatIsHotState();
}

class _WhatIsHotState extends State<WhatIsHot> {
  final bloc = PromotionBloc(PromotionStateInit());

  @override
  void initState() {
    super.initState();
    bloc.getListPromotion();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<PromotionBloc, PromotionState>(
        builder: (context, state) {
          if (state is PromotionStateInit || state is PromotionStateLoading) {
            return SizedBox(height: 250, child: CupertinoActivityIndicator());
          }
          if (state is PromotionStateLoaded) {
            return whatIsHot(list: state.datas);
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  Column whatIsHot({required List<PromotionModel> list}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 10),
            Text(
              "What's Hot",
              style: AppStyle.textBodyScaffoldBigType1BlackFat,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.promotionPage);
                    },
                    child: Container(
                      child: Center(
                          child: Text(
                        "All",
                        style: AppStyle.textBodyScaffoldBigType1BlackFat,
                      )),
                      height: 20,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 1.4),
                          borderRadius: BorderRadius.circular(14)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        Container(
          height: 190,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              var item = list[index];
              return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewPage(
                        itemSecond: item,
                      ),
                    )),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(6),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: item.image ?? "",
                          height: 120,
                          width: 200,
                          fit: BoxFit.fill,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        item.description ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.textBodyScaffoldBigType3GreyFat,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
