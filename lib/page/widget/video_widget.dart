import 'package:flutter/material.dart';
import 'package:flutter_tiktok/controller/video_widget_controller.dart';
import 'package:flutter_tiktok/model/video_model.dart';
import 'package:flutter_tiktok/page/widget/video_right_bar_widget.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'disk_widget.dart';
import 'like_gesture_widget.dart';
///视频播放列表组件
// ignore: must_be_immutable
class VideoWidget extends StatefulWidget {
  VideoModel videoModel;
  VideoWidget({Key key,@required this.videoModel}) : super(key: key);

  @override
  _VideoWidgetState createState() {
    return _VideoWidgetState();
  }
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoWidgetController _videoWidgetController = Get.put(VideoWidgetController());
  VideoPlayerController _videoPlayerController;
  bool _playing = true;
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
        widget.videoModel.videoUrl
    )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _videoPlayerController.play();
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LikeGestureWidget(
          onSingleTap: (){
            _playOrPause();
          },
          child: _getVideoPlayer(),
        ),

        Positioned(
          right: 10,
            bottom: 10,
            child: VideoRightBarWidget()),
        // _getRightLayout(),
        // _getBottomLayout() 走马灯Marquee


      ],
    );
  }

  void _playOrPause(){
    _playing = !_playing;
    _videoWidgetController.setPlayState(_playing);
    if(_playing){
      _videoPlayerController.play();
    }else{
      _videoPlayerController.pause();
    }
  }

  _getVideoPlayer() {
    return Stack(
      children: [
        VideoPlayer(_videoPlayerController),
        Obx(()=> _videoWidgetController.playing == true?
        Container()
            :Center(child: Image.asset('assets/images/pause.webp',width: 200,height: 200,),)),
      ],
    );
  }

  //获取右边的布局
  _getRightLayout() {

  }

  //获取底部的布局
  _getBottomLayout() {

  }

}