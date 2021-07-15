import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoShareWidget extends StatefulWidget {
  VideoShareWidget({Key key}) : super(key: key);

  @override
  _VideoShareWidgetState createState() {
    return _VideoShareWidgetState();
  }
}

class _VideoShareWidgetState extends State<VideoShareWidget> {
  //私信好友名字
  List<String> nameList = [
    '爱丽丝',
    '一条小团团',
    '伊素婉',
    '超级马里奥',
    '肖了个邦',
    '惠子',
  ];
  //分享app名称
  List<String> nameApps = [
    '私信朋友',
    '转发',
    '朋友圈',
    '微信朋友',
    'QQ空间',
    'QQ好友',
    '多闪',
    '今日头条',
    '微博'
  ];
  //分享app图标
  List<String> imgApps = [
    'assets/images/share_app_sixin.webp',
    'assets/images/share_app_zhuanfa.webp',
    'assets/images/share_app_wx_zone.webp',
    'assets/images/share_app_wx.webp',
    'assets/images/share_app_qq_zone.webp',
    'assets/images/share_app_qq.webp',
    'assets/images/share_app_duoshan.webp',
    'assets/images/share_app_toutiao.webp',
    'assets/images/share_app_weibo.webp',
  ];

  //操作名称
  List<String> nameActions = [
    '举报',
    '保存本地',
    '收藏',
    '合拍',
    '动态壁纸',
    '不感兴趣',
    '复制链接',
    '抖音码',
    '帮上热门'
  ];
  //操作图标
  List<String> imgActions = [
    'assets/images/share_action_jubao.webp',
    'assets/images/share_action_download.webp',
    'assets/images/share_action_fav.webp',
    'assets/images/share_action_hepai.webp',
    'assets/images/share_action_bizhi.webp',
    'assets/images/share_action_dislike.webp',
    'assets/images/share_action_copy_url.webp',
    'assets/images/share_action_code.webp',
    'assets/images/share_action_tohot.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 90, //设置最小高度（必要）
        maxHeight: 300, //设置最大高度（必要）
      ),
      child: Column(
        children: [
          _getTitleLayout(),
          SizedBox(height: 20,),
          _getFriendsLayout(),
          Divider(height: 0.5,color: Colors.grey,),
          SizedBox(height: 9,),
          _getAppsLayout(),
          _getActionsLayout(),
        ],
      ),
    );
  }

  _getTitleLayout() {
    return Container(
      height: 30,
      child: Stack(
        alignment:Alignment.center,
        children: [
          Positioned(
            left: 16,
            bottom: 0,
            child: Text('私信给朋友',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 14),),
          ),
          Positioned(
              right: 16,
              bottom: 0,
              child: InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Image.asset('assets/images/bg_cross.webp',width: 25,height: 25,))),
        ],
      ),
    );
  }

  _getFriendsLayout() {
    return Container(
      height: 80,
      child: SingleChildScrollView(
        scrollDirection:Axis.horizontal,
        child: Row(
          children: List.generate(18, (index) {
            return Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  CircleAvatar(
                      radius: 24,
                      backgroundImage:AssetImage('assets/images/header_${index%6}.jpg')
                  ),
                  SizedBox(height: 5,),
                  Text(nameList[index%6],style: TextStyle(color: Colors.white,fontSize: 10),)
                ],
              ),
            );
          }
          ),
        ),
      ),
    );
  }

  _getAppsLayout() {
    return Container(
      height: 80,
     child: SingleChildScrollView(
       scrollDirection: Axis.horizontal,
       child: Row(
         children: List.generate(9, (index) {
           return Container(
             margin: EdgeInsets.only(left: 20),
             child: Column(
               children: [
                 CircleAvatar(
                     backgroundColor:Colors.transparent,
                     radius: 24,
                     backgroundImage:AssetImage(imgApps[index])
                 ),
                 SizedBox(height: 5,),
                 Text(nameApps[index],style: TextStyle(color: Colors.white,fontSize: 10),)
               ],
             ),
           );
         }
         ),
       ),
     ),
    );
  }

  _getActionsLayout() {
    return Container(
      height: 80,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(9, (index) {
            return Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  CircleAvatar(
                      backgroundColor:Colors.transparent,
                      radius: 24,
                      backgroundImage:AssetImage(imgActions[index])
                  ),
                  SizedBox(height: 5,),
                  Text(nameActions[index],style: TextStyle(color: Colors.white,fontSize: 10),)
                ],
              ),
            );
          }
          ),
        ),
      ),
    );
  }
}