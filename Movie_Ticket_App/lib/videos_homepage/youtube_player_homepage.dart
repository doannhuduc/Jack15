import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeHomePage extends StatefulWidget {
  String? url;
  YoutubeHomePage({super.key, this.url});

  @override
  State<YoutubeHomePage> createState() => _YoutubeHomePageState();
}

class _YoutubeHomePageState extends State<YoutubeHomePage> {
  YoutubePlayerController? _playerController;
  @override
  void initState() {
    super.initState();
    _playerController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url ?? "") ?? "",
        flags: YoutubePlayerFlags(autoPlay: true, mute: false));
  }

  @override
  void dispose() {
    super.dispose();
    _playerController?.pause();
  }

  @override
  Widget build(BuildContext context) {
    if (_playerController == null) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CupertinoActivityIndicator(),
      );
    }
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _playerController!,
        showVideoProgressIndicator: true,
      ),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(backgroundColor: Colors.transparent),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [child],
          ),
        );
      },
    );
  }
}
