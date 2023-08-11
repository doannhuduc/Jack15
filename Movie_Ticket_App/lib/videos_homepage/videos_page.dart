import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket_app/const/app_color.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/promotion/web_view_page.dart';
import 'package:movie_ticket_app/router/app_router.dart';
import 'package:movie_ticket_app/videos_homepage/videos_bloc.dart';
import 'package:movie_ticket_app/videos_homepage/videos_model.dart';
import 'package:movie_ticket_app/videos_homepage/youtube_player_homepage.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({super.key});

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  ScrollController scrollControllerUpTop = ScrollController();
  final bloc = VideoBloc(VideoStateInit());
  @override
  void initState() {
    super.initState();
    bloc.getListVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorAppbar,
        leading: InkWell(
            onTap: () => Navigator.popUntil(
                context, ModalRoute.withName(AppRouter.homepage)),
            child: Icon(Icons.arrow_back)),
        title: Text("Videos", style: AppStyle.textAppar),
        actions: [
          InkWell(
              onTap: () => Navigator.pushNamed(context, AppRouter.menu),
              child: Icon(Icons.menu))
        ],
      ),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder<VideoBloc, VideoState>(
          builder: (context, state) {
            if (state is VideoStateInit || state is VideoStateLoading) {
              return SizedBox(height: 250, child: CupertinoActivityIndicator());
            }
            if (state is VideoStateLoaded) {
              return videos(list: state.datas);
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget videos({required List<VideosModel> list}) {
    return SingleChildScrollView(
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
                    Navigator.pushNamed(context, AppRouter.youtubeHomePage,
                        arguments: item.url);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.center,
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
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.play_circle,
                            size: 60,
                            color: Colors.white,
                          )
                        ],
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
                            style: AppStyle.textBodyScaffoldBigType1BlackFat,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )),
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
    );
  }
}
