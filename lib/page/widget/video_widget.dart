import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tiktok/controller/main_page_scroll_controller.dart';
import 'package:flutter_tiktok/controller/video_widget_controller.dart';
import 'package:flutter_tiktok/model/comment_model.dart';
import 'package:flutter_tiktok/model/video_model.dart';
import 'package:flutter_tiktok/page/widget/video_bottom_bar_widget.dart';
import 'package:flutter_tiktok/page/widget/video_comment_widget.dart';
import 'package:flutter_tiktok/page/widget/video_right_bar_widget.dart';
import 'package:flutter_tiktok/page/widget/video_share_widget.dart';
import 'package:flutter_tiktok/util/screen_utils.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../res/colors.dart';
import '../../util/screen_utils.dart';
import '../../util/screen_utils.dart';
import 'disk_widget.dart';
import 'like_gesture_widget.dart';

///视频播放列表组件
// ignore: must_be_immutable
class VideoWidget extends StatefulWidget {
  VideoModel videoModel;
  bool showFocusButton;
  VideoWidget({Key key, @required this.videoModel,bool this.showFocusButton}) : super(key: key);

  @override
  _VideoWidgetState createState() {
    return _VideoWidgetState();
  }
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoWidgetController _videoWidgetController = Get.put(VideoWidgetController());
  VideoPlayerController _videoPlayerController;
  MainPageScrollController mainController = Get.find();
  // ChewieController _controller;
  bool _playing = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoModel.videoUrl);
    _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
    _playOrPause();
    // _controller = ChewieController(
    //   videoPlayerController: _videoPlayerController,
    //   autoPlay: true,
    //   looping: true,
    //   fullScreenByDefault: true,
    //   showControlsOnInitialize:false,
    //   showControls: false,
    //
    // );
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
          onSingleTap: () {
            _playOrPause();
            print('宽:${_videoPlayerController.value.size.width} 高:${_videoPlayerController.value.size.height}');
            print('视频宽高比:${_videoPlayerController.value.size.width/_videoPlayerController.value.size.height}');
            print('videoContsoller aspectRatio:${_videoPlayerController.value.aspectRatio}');
            print('屏幕宽:${screenWidth(context)}  高：${screenHeight(context)}');

          },
          child: _getVideoPlayer(),
        ),

        Positioned(
            right: 10,
            bottom: 110,
            child: VideoRightBarWidget(
              videoModel: widget.videoModel,
              showFocusButton: widget.showFocusButton,
              onClickComment: (){
                showBottomComment();
              },
              onClickShare: (){
                showBottomShare();
              },
            )),
        Positioned(
            right: 2,
            bottom: 20,
            child: VinylDisk(widget.videoModel.videoMusicImage)),
        Positioned(
          left: 12,
          bottom: 20,
          child: VideoBottomBarWidget(widget.videoModel),
        )


      ],
    );
  }

  void _playOrPause() {
    _playing = !_playing;
    _videoWidgetController.setPlayState(_playing);
    if (_playing) {
      _videoPlayerController.play();
    } else {
      _videoPlayerController.pause();
    }
  }


  _getVideoPlayer() {
    return  Stack(
        children: [
            OverflowBox(child: VideoPlayer(_videoPlayerController)),
          Obx(()=> _videoWidgetController.playing == true? Container() : _getPauseButton()),
        ],
    );
  }

  _getPauseButton() {
    return Center(
        child: Container(
            width: 100,
            height: 100,
            child: Image.asset(
              'assets/images/pause.webp',
              fit: BoxFit.fill,
            )
        )
    );
  }

  //展示评论
  void showBottomComment() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true, //可滚动 解除showModalBottomSheet最大显示屏幕一半的限制
        shape: RoundedRectangleBorder(borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),),
        builder: (context){
          return VideoCommentWidget(commentList:widget.videoModel.commentList);
        });
  }

  //展示分享布局
  void showBottomShare() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true, //可滚动 解除showModalBottomSheet最大显示屏幕一半的限制
        shape: RoundedRectangleBorder(borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),),
        backgroundColor: ColorRes.color_1,
        builder: (context){
          return VideoShareWidget();
        });
  }



}