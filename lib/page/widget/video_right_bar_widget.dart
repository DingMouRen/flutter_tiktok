import 'package:flutter/material.dart';
import 'package:flutter_tiktok/controller/video_widget_controller.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';

class VideoRightBarWidget extends StatefulWidget {
  VideoRightBarWidget({Key key}) : super(key: key);

  @override
  _VideoRightBarWidgetState createState() {
    return _VideoRightBarWidgetState();
  }
}

class _VideoRightBarWidgetState extends State<VideoRightBarWidget> {

  VideoWidgetController _videoWidgetController = Get.find();
  double _widgetWidth = 50;
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: _widgetWidth,
        ),
      child: Column(
        children: [
          _getHeader(),
        ],
      ),
    );
  }
  //头像
  _getHeader() {
    return Container(
      width: _widgetWidth,
      height: _widgetWidth + _widgetWidth/8*3/2,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: _widgetWidth/8*3/2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_widgetWidth/2),
              border: Border.fromBorderSide(BorderSide(color: Colors.white,width: 2)),
              image: DecorationImage(
                image: AssetImage('assets/images/header_holder.jpg')
              )
            ),
          ),
          Positioned(
              child: Container(
                width: _widgetWidth/8*3,
                height: _widgetWidth/8*3,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_widgetWidth/8*3/2),
                  color: ColorRes.color_3,
                ),
                child: Icon(Icons.add,color: Colors.white,size: 15,),
              )),
        ],
      ),
    );
  }
}