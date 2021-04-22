import 'package:flutter_tiktok/model/city_item_model.dart';
import 'package:flutter_tiktok/model/video_model.dart';
import 'package:flutter_tiktok/net/api.dart';
import 'package:get/get.dart';
///城市页面的controller
class CityPageController extends GetxController{
  List<CityItemModel> cityItemList = [];

  CityPageController(){
    _getCityVideoList();
  }

  ///获取城市视频列表
  void _getCityVideoList(){
    cityItemList.addAll(Api.getCityVideoList());
  }
}