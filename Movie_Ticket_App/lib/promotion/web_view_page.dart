import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/promotion/promotion_bloc.dart';
import 'package:movie_ticket_app/promotion/promotion_model.dart';
import 'package:movie_ticket_app/router/app_router.dart';

class WebViewPage extends StatefulWidget {
  PromotionModel? itemSecond;
  WebViewPage({super.key, this.itemSecond});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final bloc = PromotionBloc(PromotionStateInit());
  @override
  void initState() {
    super.initState();
    bloc.getListPromotion();
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
        child: BlocBuilder<PromotionBloc, PromotionState>(
          builder: (context, state) {
            if (state is PromotionStateInit || state is PromotionStateLoading) {
              return Center(
                  child: SizedBox(
                      height: 250, child: CupertinoActivityIndicator()));
            }
            if (state is PromotionStateLoaded) {
              return webView();
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget webView() {
    return InAppWebView(
        initialUrlRequest:
            URLRequest(url: Uri.parse(widget.itemSecond?.url ?? "")));
  }
}
