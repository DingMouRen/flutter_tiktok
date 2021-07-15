import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tiktok/controller/feed_controller.dart';
import 'package:flutter_tiktok/controller/main_page_scroll_controller.dart';
import 'package:flutter_tiktok/controller/recommend_page_controller.dart';
import 'package:flutter_tiktok/model/response/feed_list_response.dart';
import 'package:flutter_tiktok/net/api.dart';
import 'package:flutter_tiktok/page/widget/video_widget.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
  FeedController _feedController = Get.put(FeedController());
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  @override
  void initState() {
    super.initState();
    _feedController.refreshHotFeedList(_refreshController);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _refreshController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  SmartRefresher(
      controller: _refreshController,
      onRefresh: (){_feedController.refreshHotFeedList(_refreshController);},
      onLoading: (){_feedController.getHotFeedList(_refreshController);},
      child: _getVideoList(context),
    );
  }


  _getVideoList(BuildContext context) {
    return Obx((){
      List<FeedListList> videoList = _feedController.hotFeedList;
      if(null == videoList || videoList.length == 0){
        return Container(color: ColorRes.color_1,);
      }else{
        return PageView.builder(
          controller: _pageController,
          itemCount: videoList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return VideoWidget(
              video:videoList[index] ,
              showFocusButton: true,
              contentHeight: widget.contentHeight,
              onClickHeader: (){
                widget.pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.linear);
              },
            );
          },
          onPageChanged: (index){
            _mainController.setCurrentUserOfVideo(videoList[index].user);
          },
        );
      }

    });
  }
}
