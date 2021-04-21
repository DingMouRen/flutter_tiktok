import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tiktok/controller/main_page_scroll_controller.dart';
import 'package:flutter_tiktok/page/home_tab_city_page.dart';
import 'package:flutter_tiktok/page/home_tab_focus_page.dart';
import 'package:flutter_tiktok/page/home_tab_recommend_page.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

///首页
class HomePage extends StatefulWidget {
  PageController _scrollPageController;
  HomePage({PageController pageController}){
    this._scrollPageController = pageController;
  }

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  MainPageScrollController _mainPageScrollController = Get.find();
  TabController _tabController;
  PageController  _pageController;
  double _screenHeight;
  double _screenWidth;


  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this,initialIndex:2);
    _pageController = PageController(initialPage: 2,keepPage: true);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _pageController.dispose();

  }

  @override
  Widget build(BuildContext context) {

    //设置状态栏的颜色和图标模式
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorRes.color_1,
      statusBarIconBrightness: Brightness.light,
    ));

    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _getBody(),
    );
  }

  _getBody() {
    return Container(
      width: _screenWidth,
      height:  _screenHeight,
      child: Stack(
             children: [
               SizedBox(
                 width: MediaQuery.of(context).size.width,
                 height: MediaQueryData.fromWindow(window).padding.top,
               ),
               Positioned(
                   top: MediaQueryData.fromWindow(window).padding.top,
                   child: _getContent()),
               Positioned(
                 top: MediaQueryData.fromWindow(window).padding.top,
                   child: _getTopLayout()),
             ],
      ),
    );
  }

  _getTopLayout() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: (){
                showToast('跳往直播页');
              },
              child:  Image.asset('assets/images/live_btn.webp',width: 35,height: 35)
            ),
          ),
          _getTabBar(),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: (){
                showToast('搜索');
              },
              child:  Image.asset('assets/images/search.webp',width: 35,height: 35,color:ColorRes.color_2)
            ),
          ),

        ],
      ),
    );
  }

  //头部：城市、关注、推荐
  _getTabBar() {
    return Container(
      width: 200,
      height: 44,
      alignment: Alignment.center,
      child: TabBar(
        tabs: [
          Text('滨江'),
          Text('关注'),
          Text('推荐'),
        ],
        indicatorColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: EdgeInsets.only(bottom: 2),
        labelColor: Colors.white,
        unselectedLabelColor: ColorRes.color_2,
        labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
        controller: _tabController,
        onTap: (index){
          _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.linear);
        },

      ),

    );
  }



  _getContent() {
    return Obx(()=>ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: _mainPageScrollController.videoViewHeight.value == 0.0?_screenHeight:_mainPageScrollController.videoViewHeight.value,
      ),
      child: NotificationListener(
        child: PageView(
              controller: _pageController,
              children: [
                HomeTabCityPage(),
                HomeTabFocusPage(),
                HomeTabRecommendPage()
              ],
              onPageChanged: (index) {
                _tabController.animateTo(index);
              }),
        onNotification: (overscroll){
          if (overscroll is OverscrollNotification && overscroll.overscroll != 0 && overscroll.dragDetails != null) {
            if(overscroll.overscroll > 0){
              widget._scrollPageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.linear);
            }else {

            }
          }
          return true;
        },
      ),
    ),
    );
  }


}
