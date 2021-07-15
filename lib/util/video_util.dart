import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class VideoUtil{

  ///获取本地视频的信息
  static Future<VideoPlayerValue> getVideoValue(File videoFile) async{
    VideoPlayerController controller = VideoPlayerController.file(videoFile);
    await controller.initialize();
    return   controller.value;
  }


}