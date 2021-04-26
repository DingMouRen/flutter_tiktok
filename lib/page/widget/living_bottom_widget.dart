import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tiktok/net/api.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:flutter_tiktok/model/living_commend_model.dart';

class LivingBottomWidget extends StatefulWidget {
  LivingBottomWidget({Key key}) : super(key: key);

  @override
  _LivingBottomWidgetState createState() {
    return _LivingBottomWidgetState();
  }
}

class _LivingBottomWidgetState extends State<LivingBottomWidget> {
  ScrollController _scrollController = ScrollController();
  int count = 1;
  List<LivingCommendModel> list = [];
  @override
  void initState() {
    super.initState();
    List.generate(20, (index) => list.addAll(livingCommendList));

    Timer.periodic(Duration(seconds: 1), (timer) {
      _scrollController.animateTo(40.0 * count, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
      count++;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQueryData.fromWindow(window).padding.top + 60 + 80 + 200;
    return Container(
      // color: Colors.red,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - height,
      child: Stack(
        children: [
          Positioned(
              bottom: 60,
              child: _getCommentLayout()),
          Positioned(
              bottom: 0,
              child: _getBottomBarLayout()),
          Positioned(
              bottom: 10,
              right: 10,
              child: _getHeaderLayout()),
        ],
      ),
    );
  }
  _getCommentLayout() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: ListView.builder(
        controller: _scrollController,
        padding: EdgeInsets.zero,
          itemCount: list.length,
          shrinkWrap: true,
          itemBuilder: (context,index){
            return _getCommentItem(index);
          },
      ),
    );
  }

  _getBottomBarLayout() {
    return Container(
      height: 50,
      child: Row(
        children: [
          Container(
            width: 150,
            height: 50,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
            margin: EdgeInsets.only(left: 10,bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.black.withAlpha(50),
            ),
            child: Text('说点什么',style: TextStyle(color: Colors.grey[400]),),
          ),
          Container(
            width: 40,
            height: 50,
            margin: EdgeInsets.only(left: 5,bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.black.withAlpha(50),
            ),
            child: Icon(Icons.more_horiz,color: Colors.white,),
          ),
          Container(
            width: 40,
            height: 50,
            margin: EdgeInsets.only(left: 5,bottom: 10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.black.withAlpha(50),
            ),
            child: Image.asset('assets/images/living_heart.png'),
          ),
          Container(
            width: 40,
            height: 50,
            margin: EdgeInsets.only(left: 5,bottom: 10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.black.withAlpha(50),
            ),
            child: Image.asset('assets/images/living_gift.png'),
          ),
        ],
      ),
    );
  }

  _getHeaderLayout() {
    return InkWell(
      onTap: (){
        showUserInfo();
      },
      child: Container(
        height: 80,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ColorRes.color_3.withAlpha(20),ColorRes.color_3]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(
                  minHeight: 40,
                  minWidth: 40,
                  maxWidth: 40,
                  maxHeight: 40
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: AssetImage('assets/images/star_5.jpeg')),
                border: Border.fromBorderSide(BorderSide(color: Colors.black.withAlpha(100),width: 1)),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: 40,
              height: 40,
              child: Text('+',style: TextStyle(color: Colors.white,fontSize: 30),),
            )
          ],
        ),
      ),
    );
  }

  _getCommentItem(int index) {
    LivingCommendModel model = list[index];
    return Container(
      // width: 10.0 * model.commend.length,
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.only(bottom: 5,left: 10,right: _getMarginRight(index)),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(50),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize:MainAxisSize.min,
        children: [
          Text('${model.name}:',style: TextStyle(color: Color.fromARGB(255,145,230,252),fontWeight: FontWeight.bold),),
          Text('${model.commend}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

        ],
      ),
    );
  }

  //展示评论
  void showUserInfo() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        elevation:0,
        isScrollControlled: true, //可滚动 解除showModalBottomSheet最大显示屏幕一半的限制
        shape: RoundedRectangleBorder(borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),),
        builder: (context){
          return _getUserInfo();
        });
  }

   _getUserInfo() {
     double headerSize = 80;
    return Container(
      constraints: BoxConstraints(
        minHeight: 220, //设置最小高度（必要）
        maxHeight: 220, //设置最大高度（必要）
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
              top: 35,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 220.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10))
                ),
                child: _getUserLayout(),
              )),
          Container(
            constraints: BoxConstraints(
                minHeight: headerSize,
                minWidth: headerSize,
                maxWidth: headerSize,
                maxHeight: headerSize
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(headerSize/2),
              image: DecorationImage(image: AssetImage('assets/images/star_5.jpeg')),
              border: Border.fromBorderSide(BorderSide(color: Colors.white,width: 2)),
            ),
          ),

        ],
      ),
    );
  }

  _getMarginRight(int index) {
    int diff = index % 6;
    if(diff == 0) return 24 * 10.0;
    if(diff == 1) return 20 * 10.0;
    if(diff == 2) return 16 * 10.0;
    if(diff == 3) return 14 * 10.0;
    if(diff == 4) return 8 * 10.0;
    if(diff == 5) return 3 * 10.0;
  }

  _getUserLayout() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
            left: 10,
            top: 10,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('礼物展馆',style:TextStyle(color: Colors.grey,fontSize: 14) ,),
                Text('6/18',style:TextStyle(color: ColorRes.color_3,fontSize: 14) ,),
                SizedBox(width: 2,),
                Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 8,),
              ],
            )),
        Positioned(
            right: 10,
            top: 10,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.warning_amber_rounded,color: Colors.grey,size: 16,),
                Text('举报',style:TextStyle(color: Colors.grey,fontSize: 14) ,),
              ],
            )),

          Positioned(
            top: 50,
            child: Column(
              children: [
                Row(
                  children: [
                    Text('彭于晏',style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold) ,),
                    SizedBox(width: 5,),
                    Image.asset('assets/images/male.webp',width: 10,height: 10,)
                  ],
                ),
                SizedBox(width: 5,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('粉丝 66w',style:TextStyle(color: Colors.grey,fontSize: 12) ,),
                    Container(
                      width: 0.5,
                      height: 8,
                      color: Colors.grey,
                      margin: EdgeInsets.only(left: 5,right: 5),
                    ),
                    Text('关注 66',style:TextStyle(color: Colors.grey,fontSize: 12) ,),
                  ],
                ),
                SizedBox(height: 5,),
                Text('直播时间：下午8点直播',style:TextStyle(color: Colors.grey,fontSize: 12) ,),
              ],
            ),
          ),

        Positioned(
            bottom: 40,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height:0.5,color: Colors.grey.withAlpha(50),),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('+关注',style: TextStyle(color: ColorRes.color_3,fontWeight:FontWeight.bold,fontSize: 16),),
                      Container(
                        width: 0.5,
                        height: 16,
                        color: Colors.grey.withAlpha(50),
                        margin: EdgeInsets.only(left: 5,right: 5),
                      ),
                      Text('粉丝群',style: TextStyle(fontSize: 16),),
                      Container(
                        width: 0.5,
                        height: 16,
                        color: Colors.grey.withAlpha(50),
                        margin: EdgeInsets.only(left: 5,right: 5),
                      ),
                      Text('主页',style: TextStyle(fontSize: 16),),
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }

}