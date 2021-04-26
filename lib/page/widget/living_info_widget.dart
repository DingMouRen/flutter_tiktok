import 'package:flutter/material.dart';

class LivingInfoWidget extends StatefulWidget {
  LivingInfoWidget({Key key}) : super(key: key);

  @override
  _LivingInfoWidgetState createState() {
    return _LivingInfoWidgetState();
  }
}

class _LivingInfoWidgetState extends State<LivingInfoWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: 80,
        minHeight: 80,
      ),
      margin: EdgeInsets.only(left: 10),
      child: Stack(
        children: [
          Positioned(
            left: 0,
              child: _getTimeRankLayout()),
          Positioned(
            right: 0,
              child: _getChannelLayout()),
          Positioned(
              right: 20,
              bottom: 0,
              child: _getAdLayout())
        ],
      ),
    );
  }

  _getTimeRankLayout() {
    return Container(
      padding: EdgeInsets.only(left: 5,right: 6,top: 2,bottom: 2),
      decoration: BoxDecoration(
          color: Colors.black.withAlpha(50),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisSize:MainAxisSize.min,
        children: [
          Image.asset('assets/images/tag_bg.webp',width: 18,height: 18,color: Color.fromARGB(255, 255,211,18),),
          Text('小时榜',style: TextStyle(fontSize: 12,color: Colors.white.withAlpha(150)),)
        ],
      ),
    );
  }

  _getChannelLayout() {
    return Container(
      padding: EdgeInsets.only(left: 5,right: 10,top: 2,bottom: 2),
      decoration: BoxDecoration(
          color: Colors.black.withAlpha(50),
          borderRadius: BorderRadius.horizontal(left: Radius.circular(20))
      ),
      child: Row(
        mainAxisSize:MainAxisSize.min,
        children: [
          Image.asset('assets/images/game_tag.webp',width: 18,height: 18,),
          SizedBox(width: 5,),
          Text('游戏频道',style: TextStyle(fontSize: 12,color: Colors.white.withAlpha(150)),),
          SizedBox(width: 5,),
          Icon(Icons.arrow_forward_ios,color:Colors.white.withAlpha(150) ,size: 12,),
        ],
      ),
    );
  }

  _getAdLayout() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 10,bottom: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Color.fromARGB(200,192,117,118),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('热血航线集结',style: TextStyle(color: Colors.white,fontSize: 15),),
              Text('开播看播拿大奖',style: TextStyle(color: Colors.grey[400],fontSize: 9),),
            ],
          ),
          Image.asset('assets/images/suolong.png',width: 30,),

        ],
      ),
    );
  }
}