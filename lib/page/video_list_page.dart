import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tiktok/model/video_model.dart';
import 'package:flutter_tiktok/page/widget/video_widget.dart';
import 'package:flutter_tiktok/res/colors.dart';
///视频列表页
class VideoListPage extends StatefulWidget {
  List<VideoModel> videoList;
  VideoListPage({Key key,this.videoList}) : super(key: key);

  @override
  _VideoListPageState createState() {
    return _VideoListPageState();
  }
}

class _VideoListPageState extends State<VideoListPage> {
  PageController _pageController = PageController(keepPage: true);

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:Colors.black,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            _getVideoPageView(),
            _getTopBarLayout(),
            _getBottomLayout(),
          ],
        ),
      ),
    );
  }

  _getTopBarLayout() {
    return Container(
      height: 40,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: 40,
        minHeight: 40
      ),
      margin: EdgeInsets.only(top: MediaQueryData.fromWindow(window).padding.top),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
          left: 0,
          child: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,),
              onPressed: (){
                Navigator.pop(context);
              },
          ),
          ),

          Positioned(
            right: 0,
              child: IconButton(
                icon: Icon(Icons.search_rounded,color: Colors.white,),
              )
          )
        ],
      ),
    );
  }

  _getVideoPageView() {
    double contentHeight = MediaQuery.of(context).size.height - 48 - MediaQueryData.fromWindow(window).padding.top;
    return  Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: contentHeight,
          ),
        margin: EdgeInsets.only(top: MediaQueryData.fromWindow(window).padding.top),
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.videoList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return VideoWidget(
                videoModel: widget.videoList[index],
                showFocusButton: false,
                onClickHeader: (){

                },
              );
            },
            onPageChanged: (index){
            },
        ));
  }

  _getBottomLayout() {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 48,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 16,right: 16),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Text("留下你的精彩评论吧",style: TextStyle(color: ColorRes.color_2,fontSize: 14),),
            Positioned(
              right: 65,
                child: Image.asset('assets/images/at.webp',color:  ColorRes.color_2,width: 28,height: 28,),
            ),
            Positioned(
              right: 16,
              child: Image.asset('assets/images/smile.webp',color:  ColorRes.color_2,width: 45,height: 45,),
            )
          ],
        ),
      ),
    );
  }




}