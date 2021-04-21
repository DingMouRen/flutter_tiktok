import 'package:flutter/rendering.dart';
import 'package:flutter_tiktok/model/user_model.dart';
import 'package:get/get.dart';
///用来控制首页滑动、存储当前播放视频的用户model数据
class MainPageScrollController extends GetxController{


  //MainPage的底部导航当前选中bar的位置
  var indexBottomBarMainPage = 0.obs;

  //ScrollPage是否可以滑动
  var scrollPageViewScrollPage = true.obs;

  //视频播放页的高度
  var videoViewHeight = 0.0.obs;

  //当前播放视频的用户model
  var userModelCurrent = UserModel().obs;

  //设置当前播放视频的用户model
  void setCurrentUserOfVideo(UserModel userModel){
    userModelCurrent.update((user) {
      user.name = userModel.name;
     user.headerBgImage = userModel.headerBgImage;
     user.headerImg = userModel.headerImg;
     user.douYinNumber = userModel.douYinNumber ;
     user.introduction = userModel.introduction ;
     user.male = userModel.male;
     user.city = userModel.city;
     user.likeTotalNumber = userModel.likeTotalNumber;
     user.focusNumber = userModel.focusNumber;
     user.fansNumber = userModel.fansNumber;
     user.worksVideo = userModel.worksVideo ;
     user.likeVideo = userModel.likeVideo ;
     user.likeVideoGif = userModel.likeVideoGif;
     user.worksVideoGif = userModel.worksVideoGif;
    });
  }

  //设置视频播放页视频的高度
  void setVideoViewHeight(double height){
    videoViewHeight.value = height;
  }

  //MainPage底部导航选中指定的bar
  void selectIndexBottomBarMainPage(int index){
    if(index == 0 || index == 1){
      updateScrollPageScrollState(true);
    }else{
      updateScrollPageScrollState(false);
    }
    indexBottomBarMainPage.value = index;
  }

  //ScrollPage的PageView是否可以滑动
  void updateScrollPageScrollState(bool scroll){
    scrollPageViewScrollPage.value = scroll;
  }

}