import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tiktok/controller/recommend_page_controller.dart';
import 'package:flutter_tiktok/page/widget/video_widget.dart';
import 'package:get/get.dart';

///首页tab推荐
class HomeTabRecommendPage extends StatefulWidget {
  HomeTabRecommendPage({Key key}) : super(key: key);

  @override
  _HomeTabRecommendPageState createState() {
    return _HomeTabRecommendPageState();
  }
}

class _HomeTabRecommendPageState extends State<HomeTabRecommendPage> {
  RecommendPageController _controller = Get.put(RecommendPageController());

  @override
  Widget build(BuildContext context) {
    return  PageView.builder(
        itemCount: _controller.videoList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return VideoWidget(videoModel: _controller.videoList[index]);
        }
    );
  }
}
