import 'dart:ui';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tiktok/page/widget/living_top_widget.dart';
import 'package:flutter_tiktok/page/widget/living_info_widget.dart';
import 'package:flutter_tiktok/page/widget/living_video_widget.dart';
import 'package:flutter_tiktok/page/widget/living_bottom_widget.dart';
import 'package:video_player/video_player.dart';

class LivingPageWidget extends StatefulWidget {
  Function onClosed;
  LivingPageWidget({Key key,this.onClosed}) : super(key: key);

  @override
  _LivingPageWidgetState createState() {
    return _LivingPageWidgetState();
  }
}

class _LivingPageWidgetState extends State<LivingPageWidget> {



  @override
  Widget build(BuildContext context) {

    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
        minHeight: MediaQuery.of(context).size.height,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _getBgImg(),
          _getBlurLayout(),
          Positioned(
            top: MediaQueryData.fromWindow(window).padding.top,
            child: LivingTopWidget(
              onClosed: (){
                widget.onClosed?.call();
              },
            ),
          ),
          Positioned(
            top: MediaQueryData.fromWindow(window).padding.top + 60,
              child: LivingInfoWidget()),
          Positioned(
            top:  MediaQueryData.fromWindow(window).padding.top + 60 + 80,
              child: LivingVideoWidget()),
          Positioned(
              bottom: 0,
              child: LivingBottomWidget())

        ],
      ),
    );
  }

  _getBgImg() {
    return Container(
       child:  Image.asset('assets/images/blur_bg.jpg',fit: BoxFit.fill,),
    );
  }

  //高斯模糊背景
  _getBlurLayout() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
      child: Container(
        color: Colors.white.withAlpha(50),
      ),
    );
  }

}