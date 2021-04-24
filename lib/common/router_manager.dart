import 'package:flutter_tiktok/page/friend_page.dart';
import 'package:flutter_tiktok/page/home_page.dart';
import 'package:flutter_tiktok/page/home_tab_city_page.dart';
import 'package:flutter_tiktok/page/home_tab_focus_page.dart';
import 'package:flutter_tiktok/page/home_tab_recommend_page.dart';
import 'package:flutter_tiktok/page/main_page.dart';
import 'package:flutter_tiktok/page/message_page.dart';
import 'package:flutter_tiktok/page/scroll_page.dart';
import 'package:flutter_tiktok/page/search_page.dart';
import 'package:flutter_tiktok/page/shoot_page.dart';
import 'package:flutter_tiktok/page/test.dart';
import 'package:flutter_tiktok/page/user_page.dart';
import 'package:flutter_tiktok/page/video_list_page.dart';
import 'package:get/get.dart';

///路由管理者
class RouterManager{
  static final routes = [
    GetPage(name: Routers.test, page: () => TestPage()),
    GetPage(name: Routers.scroll, page: () => ScrollPage()),
    GetPage(name: Routers.main, page: () => MainPage()),
    GetPage(name: Routers.user, page: () => UserPage()),
    GetPage(name: Routers.shoot, page: () => ShootPage()),
    GetPage(name: Routers.home, page: () => HomePage()),
    GetPage(name: Routers.message, page: () => MessagePage()),
    GetPage(name: Routers.homeTabCity, page: () => HomeTabCityPage()),
    GetPage(name: Routers.homeTabFocus, page: () => HomeTabFocusPage()),
    GetPage(name: Routers.homeTabRecommend, page: () => HomeTabRecommendPage()),
    GetPage(name: Routers.videoList, page: () => VideoListPage()),
    GetPage(name: Routers.search, page: () => SearchPage()),
  ];


}
///路由名称
class Routers{
  static final String test = '/test';
  static final String scroll = '/scroll';
  static final String main = '/main';
  static final String user = '/user';
  static final String shoot = '/shoot';
  static final String home = '/home';
  static final String friend = '/friend';
  static final String message = '/message';
  static final String homeTabCity = '/homeTabCity';
  static final String homeTabFocus = '/homeTabFocus';
  static final String homeTabRecommend = '/homeTabRecommend';
  static final String videoList = '/videoList';
  static final String search = '/search';
}