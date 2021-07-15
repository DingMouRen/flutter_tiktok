import 'package:flutter/material.dart';
import 'package:flutter_tiktok/controller/feed_controller.dart';
import 'package:flutter_tiktok/controller/focus_page_controller.dart';
import 'package:flutter_tiktok/controller/main_page_scroll_controller.dart';
import 'package:flutter_tiktok/controller/user_controller.dart';
import 'package:flutter_tiktok/model/response/feed_list_response.dart';
import 'package:flutter_tiktok/page/widget/video_widget.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';
import 'package:flutter_tiktok/net/api.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
///首页tab关注
class HomeTabFocusPage extends StatefulWidget {
  PageController pageController;
  double contentHeight;
  HomeTabFocusPage({this.pageController,this.contentHeight,});

  @override
  _HomeTabFocusPageState createState() {
    return _HomeTabFocusPageState();
  }
}

class _HomeTabFocusPageState extends State<HomeTabFocusPage> {
  FocusPageController _controller = Get.put(FocusPageController());
  PageController _pageController = PageController(keepPage: true);
  FeedController _feedController = Get.put(FeedController());
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  UserController userController = Get.put(UserController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _feedController.refreshFriendFeedList(_refreshController);
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
      onRefresh: (){_feedController.refreshFriendFeedList(_refreshController);},
      onLoading: (){_feedController.getFriendFeedList(_refreshController);},
      child: _getVideoList(context),
    );
  }


  _getVideoList(BuildContext context) {
    return Obx((){
      List<FeedListList> videoList = _feedController.friendFeedList;
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
              contentHeight: widget.contentHeight,
              showFocusButton: true,
              onClickHeader: (){
                // widget.pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.linear);
              },
            );
          },
          onPageChanged: (index){
          },
        );
      }

    });
  }
}