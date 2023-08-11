import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerPage extends StatefulWidget {
  String? url;
  YoutubePlayerPage({super.key, this.url});

  @override
  State<YoutubePlayerPage> createState() => _YoutubePlayerPageState();
}

class _YoutubePlayerPageState extends State<YoutubePlayerPage> {
  YoutubePlayerController? _playerController;

  @override
  void initState() {
    super.initState();
    _playerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url ?? "") ?? '',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _playerController?.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_playerController == null) {
      return Material(
        child: Center(child: CupertinoActivityIndicator()),
      );
    }
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _playerController!,
        showVideoProgressIndicator: true,
      ),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              child,
            ],
          ),
        );
      },
    );
  }
}
