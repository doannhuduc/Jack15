import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket_app/const/app_style.dart';
import 'package:movie_ticket_app/router/app_router.dart';
import 'package:movie_ticket_app/videos_homepage/videos_bloc.dart';
import 'package:movie_ticket_app/videos_homepage/videos_model.dart';

class VideosHomepage extends StatefulWidget {
  const VideosHomepage({super.key});

  @override
  State<VideosHomepage> createState() => _VideosHomepageState();
}

class _VideosHomepageState extends State<VideosHomepage> {
  final bloc = VideoBloc(VideoStateInit());
  @override
  void initState() {
    super.initState();
    bloc.getListVideos();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<VideoBloc, VideoState>(
        builder: (context, state) {
          if (state is VideoStateInit || state is VideoStateLoading) {
            return Center(
                child:
                    SizedBox(height: 250, child: CupertinoActivityIndicator()));
          }
          if (state is VideoStateLoaded) {
            return videos(list: state.datas);
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  Widget videos({required List<VideosModel> list}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 10),
            Text(
              "Videos",
              style: AppStyle.textBodyScaffoldBigType1BlackFat,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, AppRouter.videosPage),
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
          height: 200,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              var item = list[index];
              return InkWell(
                onTap: () => Navigator.pushNamed(
                    context, AppRouter.youtubeHomePage,
                    arguments: item.url),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(6),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CachedNetworkImage(
                              imageUrl: item.image ?? "",
                              height: 120,
                              width: 200,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              fit: BoxFit.fill,
                            ),
                            Icon(
                              Icons.play_circle,
                              size: 40,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            item.description ?? "",
                            style: AppStyle.textBodyScaffoldBigType3GreyFat,
                            maxLines: 2,
                          ),
                        ),
                      ],
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
