import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tiktok/common/application.dart';
import 'package:flutter_tiktok/controller/main_page_scroll_controller.dart';
import 'package:flutter_tiktok/controller/user_page_controller.dart';
import 'package:flutter_tiktok/event/close_main_drawer_event.dart';
import 'package:flutter_tiktok/event/main_reset_event.dart';
import 'package:flutter_tiktok/page/main_page.dart';
import 'package:flutter_tiktok/page/user_page.dart';
import 'package:flutter_tiktok/page/widget/user_right_menu_widget.dart';
import 'package:flutter_tiktok/res/colors.dart';
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
  UserPageController _userPageController = Get.put(UserPageController());
  PageController _pageController = PageController(initialPage: 0,keepPage: true);
  GlobalKey<DrawerControllerState> drawerKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    Application.eventBus.on<CloseMainDrawerEvent>().listen((event) {
      drawerKey.currentState.close();
    });

  }

  @override
  Widget build(BuildContext context) {


    return Stack(
      children: [
        Obx(() => PageView(
            controller: _pageController,
            physics: mainPageScrollController.scrollPageViewScrollPage.value ? null : NeverScrollableScrollPhysics(),
            children: [
              MainPage(pageController:_pageController),
              Obx(()=>UserPage(pageController:_pageController,isLoginUser: false,uid:mainPageScrollController.uidCuttent.value ,)),
            ],
            onPageChanged: (index){
            },
          ),
        ),
        Obx(()=>DrawerController(
          key: drawerKey,
            alignment: DrawerAlignment.end,
            isDrawerOpen: _userPageController.showRightMenu.value,
            drawerCallback: (isOpened){
              _userPageController.toggleRightMenu();
            },
            child: UserRightMenuWidget()
          ),
        ),
      ],

    );
  }


}
