import 'package:flutter/material.dart';
import 'package:flutter_tiktok/controller/video_widget_controller.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

import '../../model/video_model.dart';
import 'disk_widget.dart';

class VideoRightBarWidget extends StatefulWidget {

  final Function onClickComment;
  final Function onClickShare;
  final Function onClickHeader;
  VideoModel videoModel;
  bool showFocusButton;
  VideoRightBarWidget({Key key,this.onClickComment,this.onClickShare,this.videoModel,this.showFocusButton,this.onClickHeader}) : super(key: key);

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
          SizedBox(height: 25,),
          _getLikeButton(),
          SizedBox(height: 20,),
          _getCommentButton(),
          SizedBox(height: 20,),
          _getShareButton(),
        ],
      ),
    );
  }
  //头像
  _getHeader() {
    return InkWell(
      onTap: (){
        widget.onClickHeader?.call();
      },
      child: Container(
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
                  image: AssetImage(widget.videoModel.authorHeaderUrl)
                )
              ),
            ),
            widget.showFocusButton == true?
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
                )):SizedBox(width: 0,height: 0,),
          ],
        ),
      ),
    );
  }
  //获取点赞按钮
  _getLikeButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LikeButton(
            size: 40,
            circleColor:CircleColor(start: ColorRes.color_3,end: ColorRes.color_3),
            likeBuilder: (isLike){
              return isLike == true?Image.asset('assets/images/red_heart.webp'):Image.asset('assets/images/red_heart.webp',color: Colors.white,);
            },
            bubblesColor:const BubblesColor(dotPrimaryColor: ColorRes.color_3,dotSecondaryColor: ColorRes.color_3,dotThirdColor: ColorRes.color_3,dotLastColor: ColorRes.color_3,)
        ),
        SizedBox(height: 2,),
        Text('188w',style: TextStyle(color: Colors.white),)
      ],
    );
  }
  //获取评论按钮
  _getCommentButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          iconSize: _widgetWidth,
          padding:const EdgeInsets.all(0.0),
          onPressed: (){
            widget.onClickComment?.call();
          },
          icon: Image.asset('assets/images/comment.webp',),
        ),
        Text('18w',style: TextStyle(color: Colors.white),)

      ],
    );
  }

  //获取分享按钮
  _getShareButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          iconSize: _widgetWidth,
          padding:const EdgeInsets.all(0.0),
          onPressed: (){
            widget.onClickShare?.call();
          },
          icon: Image.asset('assets/images/share_button.webp',width: 35,height: 35,),
        ),
        Text('18w',style: TextStyle(color: Colors.white),)

      ],
    );
  }

}