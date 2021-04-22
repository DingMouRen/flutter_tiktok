import 'package:flutter_tiktok/model/video_model.dart';
import 'package:flutter_tiktok/net/api.dart';
import 'package:get/get.dart';
//朋友页面的controller
class FriendPageController extends GetxController{
  List<VideoModel> videoList = [];

  FriendPageController(){
    _getFriendVideoList();
  }

  ///获取推荐视频列表
  void _getFriendVideoList(){
    videoList.addAll(Api.getFriendVideoList());
  }
}