import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tiktok/common/router_manager.dart';
import 'package:flutter_tiktok/controller/main_page_scroll_controller.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
///首页底部导航
class MainPageBottomBarWidget extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _MainPageBottomBarWidgetState();
  }
}

class _MainPageBottomBarWidgetState extends State<MainPageBottomBarWidget>{

  final MainPageScrollController mainPageScrollController = Get.find();
  //用来获取BottomBar的高度
  final GlobalKey bottomBarKey = GlobalKey();
  Widget _bottomBarLayout;

  @override
  void initState() {
    super.initState();
    _bottomBarLayout = _getLayoutBottomBar();
    //BottomBar绘制完成时候的监听
    WidgetsBinding.instance.addPostFrameCallback((_bottomBarLayout) {
      double videoViewHeight = MediaQuery.of(context).size.height - bottomBarKey.currentContext.size.height - MediaQueryData.fromWindow(window).padding.top;
      mainPageScrollController.setVideoViewHeight(videoViewHeight);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _bottomBarLayout;
  }

  _getLayoutBottomBar(){
    return Container(
      key: bottomBarKey,
      color:Colors.black,
      height: 48,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: _getAnimatedText('首页',0)
          ),
          Expanded(
              flex: 1,
              child: _getAnimatedText('朋友',1)
          ),
          Expanded(
              flex: 1,
              child:InkWell(
                onTap: (){
                  Get.toNamed(Routers.shoot);
                },
                child: Image.asset('assets/images/shoot_btn.webp'),
              )
          ),
          Expanded(
              flex: 1,
              child:_getAnimatedText('消息',2)
          ),
          Expanded(
              flex: 1,
              child:_getAnimatedText('我',3)
          ),
        ],
      ),
    );
  }

  _getAnimatedText(String barName,int index){
    return TextButton(
        onPressed: (){
          mainPageScrollController.selectIndexBottomBarMainPage(index);
          setSystemStatusBarStyle(index);
        },
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child:Obx(()=>  Text(barName,style: TextStyle(
            color: mainPageScrollController.indexBottomBarMainPage.value == index ? Colors.white:Colors.grey,
            fontSize: mainPageScrollController.indexBottomBarMainPage.value == index ? 16:15,
            fontWeight: FontWeight.bold
        ),),
        )
    );
  }

  void setSystemStatusBarStyle(int index) {
    if(index == 3 ){
      //设置状态栏的颜色和图标模式
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ));

    }else{
      //设置状态栏的颜色和图标模式
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: ColorRes.color_1,
        statusBarIconBrightness: Brightness.dark,
      ));
    }

  }

}
