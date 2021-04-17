import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
///用来控制首页滑动
class MainPageScrollController extends GetxController{

  //ScrollPage的PageView的当前页码
  var indexPageViewScrollPage = 0.obs;

  //MainPage的底部导航当前选中bar的位置
  var indexBottomBarMainPage = 0.obs;

  //HomePage的顶部Tab选中的位置
  var indexTabBarHomePage = 2.obs;

  //ScrollPage是否可以滑动
  var scrollPageViewScrollPage = true.obs;

  //HomePage的PageView是否可以滑动
  var scrollPageViewHomePage = false.obs;

  //ScrollPage的滑动方向
  ScrollDirection scrollDirectionScrollPage;

  //视频播放页的高度
  var videoViewHeight = 0.0.obs;

  void setVideoViewHeight(double height){
    videoViewHeight.value = height;
  }

  //ScrollPage的滑动方向发生变化
  void scrollDirectionChange(ScrollDirection direction){
    scrollDirectionScrollPage = direction;
    updateScrollState();
  }

  //ScrollPage的PageView当前页码
  void selectIndexPageViewScrollPage(int index){
    indexPageViewScrollPage.value = index;
    updateScrollState();
  }

  //MainPage底部导航选中指定的bar
  void selectIndexBottomBarMainPage(int index){
    indexBottomBarMainPage.value = index;
    updateScrollState();
  }

  //HomePage顶部tabBar选中指定的Bar
  void selectIndexTabBarHomePage(int index){
    indexTabBarHomePage.value = index;
    updateScrollState();
  }



  //滑动规则
  void updateScrollState(){
    var indexPageViewScrollPageTemp = indexPageViewScrollPage.value;
    var indexBottomBarMainPageTemp = indexBottomBarMainPage.value;
    var indexTabBarHomePageTemp = indexTabBarHomePage.value;

    // print('indexPageViewScrollPage:${indexPageViewScrollPageTemp} indexBottomBarMainPage:${indexBottomBarMainPageTemp} indexTabBarHomePage:${indexTabBarHomePageTemp} direction:${scrollDirectionScrollPage}');

    switch(indexPageViewScrollPage.value){
      case 0:
        _checkPageViewScrollPageAt0();
        break;
      case 1:
        scrollPageViewScrollPage.value = true;
        scrollPageViewHomePage.value = true;
        break;
    }

  }

  void _checkPageViewScrollPageAt0() {
    switch(indexBottomBarMainPage.value){
      case 0:
        _checkWidgetMainPageAt0();
        break;
      case 1:
        scrollPageViewScrollPage.value = true;
        scrollPageViewHomePage.value = true;
        break;
      case 2:
        scrollPageViewScrollPage.value = false;
        scrollPageViewHomePage.value = true;
        break;
      case 3:
        scrollPageViewScrollPage.value = false;
        scrollPageViewHomePage.value = true;
        break;
    }
  }

  void _checkWidgetMainPageAt0() {
    switch(indexTabBarHomePage.value){
      case 0:
        scrollPageViewScrollPage.value = false;
        scrollPageViewHomePage.value = true;
        break;
      case 1:
        scrollPageViewScrollPage.value = false;
        scrollPageViewHomePage.value = true;
        break;
      case 2:
        if(scrollDirectionScrollPage == ScrollDirection.forward){
          scrollPageViewScrollPage.value = false;
          scrollPageViewHomePage.value = true;
        }else if(scrollDirectionScrollPage == ScrollDirection.reverse){
          scrollPageViewScrollPage.value = true;
          scrollPageViewHomePage.value = false;
        }
        break;
    }
  }



}