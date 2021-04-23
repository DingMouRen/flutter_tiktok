import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tiktok/controller/main_page_scroll_controller.dart';
import 'package:flutter_tiktok/controller/recommend_page_controller.dart';
import 'package:flutter_tiktok/net/api.dart';
import 'package:flutter_tiktok/page/widget/video_widget.dart';
import 'package:get/get.dart';

///首页tab推荐
class HomeTabRecommendPage extends StatefulWidget {
  double contentHeight;
  PageController pageController;
  HomeTabRecommendPage({Key key,this.contentHeight,this.pageController}) : super(key: key);

  @override
  _HomeTabRecommendPageState createState() {
    return _HomeTabRecommendPageState();
  }
}

class _HomeTabRecommendPageState extends State<HomeTabRecommendPage> {
  RecommendPageController _controller = Get.put(RecommendPageController());
  MainPageScrollController _mainController = Get.find();
  PageController _pageController = PageController(keepPage: true);
  @override
  void initState() {
    super.initState();
    //初始化右边用户信息
    _mainController.setCurrentUserOfVideo(userModelList[0]);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  PageView.builder(
        controller: _pageController,
        itemCount: _controller.videoList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return VideoWidget(
            videoModel: _controller.videoList[index],
            showFocusButton: true,
            contentHeight: widget.contentHeight,
            onClickHeader: (){
              widget.pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.linear);
            },
          );
        },
      onPageChanged: (index){
        _mainController.setCurrentUserOfVideo(userModelList[index]);
      },
    );
  }
}
