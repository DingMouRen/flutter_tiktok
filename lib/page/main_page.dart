import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tiktok/controller/main_page_scroll_controller.dart';
import 'package:flutter_tiktok/net/api.dart';
import 'package:flutter_tiktok/page/friend_page.dart';
import 'package:flutter_tiktok/page/home_page.dart';
import 'package:flutter_tiktok/page/message_page.dart';
import 'package:flutter_tiktok/page/user_page.dart';
import 'package:flutter_tiktok/page/widget/main_page_bottom_bar_widget.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  final MainPageScrollController mainPageController = Get.find();
  PageController _scrollPageController;
  MainPage({PageController pageController}){
    this._scrollPageController = pageController;
  }

  @override
  Widget build(BuildContext context) {
    //设置状态栏的颜色和图标模式
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorRes.color_1,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      body: Obx(()=>_getBody()),
      //底部导航
      bottomNavigationBar:  MainPageBottomBarWidget(),
    );
  }

  _getBody() {
    switch(mainPageController.indexBottomBarMainPage.value){
      case 0:
        return HomePage(pageController:_scrollPageController);
      case 1:
        return FriendPage();
      case 2:
        return MessagePage();
      case 3:
        return UserPage(
          pageController:_scrollPageController,
          isLoginUser: true,
          userModel: loginUserModel,
        );
    }
  }
}
