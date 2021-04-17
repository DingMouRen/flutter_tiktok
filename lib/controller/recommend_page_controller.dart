import 'package:flutter_tiktok/model/video_model.dart';
import 'package:flutter_tiktok/net/api.dart';
import 'package:get/get.dart';
///推荐页面
class RecommendPageController extends GetxController{
  List<VideoModel> videoList = [];

  RecommendPageController(){
    _getRecommendVideoList();
  }

  ///获取推荐视频列表
  void _getRecommendVideoList(){
    videoList.addAll(Api.getRecommendVideoList());
  }
}