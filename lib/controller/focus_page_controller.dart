import 'package:flutter_tiktok/model/video_model.dart';
import 'package:flutter_tiktok/net/api.dart';
import 'package:get/get.dart';
//关注页面Controller
class FocusPageController extends GetxController{
  List<VideoModel> videoList = [];

  FocusPageController(){
    _getFocusVideoList();
  }

  ///获取推荐视频列表
  void _getFocusVideoList(){
    videoList.addAll(Api.getFocusVideoList());
  }
}