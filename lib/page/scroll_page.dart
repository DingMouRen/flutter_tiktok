import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tiktok/controller/main_page_scroll_controller.dart';
import 'package:flutter_tiktok/page/main_page.dart';
import 'package:flutter_tiktok/page/user_page.dart';
import 'package:get/get.dart';

///负责MainPage与UserPage页的滑动
class ScrollPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScrollPageState();
  }
}

class _ScrollPageState extends State<ScrollPage> {
  final MainPageScrollController mainPageScrollController = Get.put(MainPageScrollController());
  PageController _pageController = PageController(initialPage: 0,keepPage: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => PageView(
          controller: _pageController,
          physics: mainPageScrollController.scrollPageViewScrollPage.value ? null : NeverScrollableScrollPhysics(),
          children: [MainPage(pageController:_pageController), UserPage(pageController:_pageController,isLoginUser: false,)],

        ),
    );
  }


}
