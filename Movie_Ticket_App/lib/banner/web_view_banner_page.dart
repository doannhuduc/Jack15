import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:movie_ticket_app/banner/banner_bloc.dart';
import 'package:movie_ticket_app/banner/banner_model.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/promotion/promotion_bloc.dart';
import 'package:movie_ticket_app/router/app_router.dart';

class WebViewBannerPage extends StatefulWidget {
  BannerModel? itemHere;
  WebViewBannerPage({super.key, this.itemHere});

  @override
  State<WebViewBannerPage> createState() => _WebViewBannerPageState();
}

class _WebViewBannerPageState extends State<WebViewBannerPage> {
  final bloc = BannerBloc(BannerStateInit());
  @override
  void initState() {
    super.initState();
    bloc.getListBanner();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorAppbar,
        leading: InkWell(
            onTap: () => Navigator.pop(context), child: Icon(Icons.arrow_back)),
        title: Text(
          "News & Offers",
          style: AppStyle.textAppar,
        ),
        actions: [
          Icon(Icons.share),
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
        child: BlocBuilder<BannerBloc, BannerState>(
          builder: (context, state) {
            if (state is BannerStateInit || state is BannerStateLoading) {
              return Center(
                  child: SizedBox(
                      height: 250, child: CupertinoActivityIndicator()));
            }
            if (state is BannerStateLoaded) {
              return InAppWebView(
                  initialUrlRequest:
                      URLRequest(url: Uri.parse(widget.itemHere?.url ?? "")));
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
