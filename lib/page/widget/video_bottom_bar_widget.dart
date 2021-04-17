import 'package:flutter/material.dart';
import 'package:flutter_tiktok/model/video_model.dart';
import 'package:flutter_tiktok/util/constants.dart';
import 'package:marquee/marquee.dart';

class VideoBottomBarWidget extends StatefulWidget {
  VideoModel videoModel;
  VideoBottomBarWidget(this.videoModel);


  @override
  _VideoBottomBarWidgetState createState() {
    return _VideoBottomBarWidgetState();
  }
}

class _VideoBottomBarWidgetState extends State<VideoBottomBarWidget> {

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width - kVinylDiskContainerWidth;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('@${widget.videoModel.author}',style: _getTextStyle(),),
          SizedBox(height: 8,),
          Text('${widget.videoModel.desc}',style: _getTextStyle(),),
          SizedBox(height: 10,),
          Row(
            children: [
              Image.asset('assets/images/tiktok_white.webp',width: 25,height: 25,),
              Container(
                width: 200,
                height: 25,
                child: Marquee(
                  text: "There  ",
                  style: TextStyle(fontSize: 18,color: Colors.white),),
              )
            ],
          ),

        ],
      ),

    );
  }

  _getTextStyle(){
    return TextStyle(
        color: Colors.white,
    );
  }
}