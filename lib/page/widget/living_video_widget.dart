import 'dart:ui';

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LivingVideoWidget extends StatefulWidget {
  LivingVideoWidget({Key key}) : super(key: key);

  @override
  _LivingVideoWidgetState createState() {
    return _LivingVideoWidgetState();
  }
}

class _LivingVideoWidgetState extends State<LivingVideoWidget> {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  Future<void> initPlayer() async{
    _videoPlayerController = VideoPlayerController.asset('assets/video/living_0.mp4');
    await Future.wait([
      _videoPlayerController.initialize(),
    ]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      showControlsOnInitialize:false,
      showControls:false,
    );
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: 240,
        minHeight: 240,
      ),
      child: Stack(
        children: [
          Chewie(
            controller: _chewieController,
          ),
          Positioned(
              bottom: 5,
              right: 5,
              child: InkWell(
                onTap: (){
                  _chewieController.enterFullScreen();
                },
                child: Container(
                  width: 35,
                  height: 35,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black.withAlpha(150)
                  ),
                  child: Image.asset('assets/images/max.png',),
                ),
              )),
        ],
      ),
    );
  }


}