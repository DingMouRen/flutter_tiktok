import 'package:flutter_tiktok/model/video_model.dart';

class Api{

  static List<VideoModel> getRecommendVideoList(){
    List<VideoModel> list = [];
    for(int i = 0;i < 4;i ++){
      VideoModel videoModel = VideoModel();
      videoModel.videoUrl = 'assets/video/video_1.mp4';
      videoModel.videoMusicImage = 'assets/images/header_holder.jpg';
      videoModel.author = '钉某人';
      videoModel.desc = "凡有等待，便有启程，如果生活和你想象的不一样，希望你能鼓起勇气重新启程。";
      list.add(videoModel);
    }
    return list;
  }
}