import 'package:flutter/material.dart';
import 'package:flutter_tiktok/controller/focus_page_controller.dart';
import 'package:flutter_tiktok/controller/main_page_scroll_controller.dart';
import 'package:flutter_tiktok/page/widget/video_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_tiktok/net/api.dart';
///首页tab关注
class HomeTabFocusPage extends StatefulWidget {
  PageController pageController;

  HomeTabFocusPage({this.pageController});

  @override
  _HomeTabFocusPageState createState() {
    return _HomeTabFocusPageState();
  }
}

class _HomeTabFocusPageState extends State<HomeTabFocusPage> {
  FocusPageController _controller = Get.put(FocusPageController());
  PageController _pageController = PageController(keepPage: true);

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
          showFocusButton: false,
          onClickHeader: (){
            widget.pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.linear);
          },
        );
      },
      onPageChanged: (index){
      },
    );
  }
}