
import 'package:flutter_tiktok/model/video_model.dart';

///用户
class UserModel{
  String name;//用户名称
  bool loginUser;//是否是当前登录的用户
  String headerBgImage;//头部背景图
  String douYinNumber;//抖音号
  String introduction;//简介
  bool male;//true为男性，false为女性
  String city;//所属省份城市
  String likeTotalNumber;//总的获赞数量
  String focusNumber;//关注的数量
  String fansNumber;//粉丝的数量
  List<VideoModel> worksVideo;//作品的视频列表
  List<VideoModel> likeVideo;//喜欢的视频列表

}