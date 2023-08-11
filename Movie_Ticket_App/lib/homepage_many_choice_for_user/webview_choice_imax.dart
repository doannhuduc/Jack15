import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/homepage_many_choice_for_user/choice_bloc.dart';
import 'package:movie_ticket_app/homepage_many_choice_for_user/choice_model.dart';

class WebViewChoiceImax extends StatefulWidget {
  const WebViewChoiceImax({super.key});

  @override
  State<WebViewChoiceImax> createState() => _WebViewChoiceImaxState();
}

class _WebViewChoiceImaxState extends State<WebViewChoiceImax> {
  final bloc = HomepageChoiceBloc(HomepageChoiceStateInit());
  @override
  void initState() {
    super.initState();
    bloc.getChoiceHomepage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorAppbar,
        leading: InkWell(
            onTap: () => Navigator.pop(context), child: Icon(Icons.arrow_back)),
        title: Text(
          "IMAX",
          style: AppStyle.textAppar,
        ),
      ),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder<HomepageChoiceBloc, HomepageChoiceState>(
          builder: (context, state) {
            if (state is HomepageChoiceStateInit ||
                state is HomepageChoiceStateLoading) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: CupertinoActivityIndicator());
            }
            if (state is HomepageChoiceStateLoaded) {
              return inAppWebView(item: state.datas[4]);
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget inAppWebView({required ChoiceModel item}) {
    return InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(item.url ?? "")),
    );
  }
}
