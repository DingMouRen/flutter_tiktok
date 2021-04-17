import 'package:flutter_tiktok/model/video_model.dart';

class Api{

  static List<VideoModel> getRecommendVideoList(){
    List<VideoModel> list = [];
    for(int i = 0;i < 4;i ++){
      VideoModel videoModel = VideoModel();
      videoModel.videoUrl = 'assets/video/video_1.mp4';
      list.add(videoModel);
    }
    return list;
  }
}