import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tiktok/res/colors.dart';
///直播头部
class LivingTopWidget extends StatefulWidget {
  Function onClosed;

  LivingTopWidget({this.onClosed});

  @override
  _LivingTopWidgetState createState() {
    return _LivingTopWidgetState();
  }
}

class _LivingTopWidgetState extends State<LivingTopWidget> {
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
      margin: EdgeInsets.only(left: 10),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight:60,
        minHeight: 60,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _getLeftLayout(),
          Expanded(child: SizedBox()),
          _getTop('assets/images/star_1.jpeg','6838',0),
          SizedBox(width: 2,),
          _getTop('assets/images/star_2.jpeg','6819',1),
          SizedBox(width: 2,),
          _getTop('assets/images/star_3.jpeg','6830',2),
          SizedBox(width: 5,),
          Container(
            height: 30,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 6,right: 6,top: 3,bottom: 3),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Text('2288',style: TextStyle(color: Colors.white,fontSize: 12),)),
          SizedBox(width: 10,),
          InkWell(
            onTap: (){
              widget.onClosed?.call();
            },
            child: Image.asset('assets/images/cross.webp',width: 22,height: 22,color: Colors.white,),
          ),
          SizedBox(width: 20,),
        ],
      ),
    );
  }

  _getTop(String img,String num,int topIndex) {
    double headerSize = 30;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          constraints: BoxConstraints(
              minHeight: headerSize,
              minWidth: headerSize,
              maxWidth: headerSize,
              maxHeight: headerSize
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(headerSize/2),
            image: DecorationImage(image: AssetImage(img)),
            border: Border.fromBorderSide(BorderSide(color: Colors.black.withAlpha(100),width: 1)),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            padding: EdgeInsets.only(left: 1,right: 1,top: 1,bottom: 1),
            decoration: BoxDecoration(
              color: _getTopColor(topIndex),
              borderRadius: BorderRadius.circular(headerSize),
            ),
            child: Text(num,style: TextStyle(color: Colors.white,fontSize: 8),),
          ),
        )
      ],
    );
  }

  _getTopColor(int topIndex) {
    if(topIndex == 0) return Color.fromARGB(255, 250,203,72).withAlpha(200);
    if(topIndex == 1) return Color.fromARGB(255, 182,180,181).withAlpha(200);
    return Color.fromARGB(255, 174,146,107).withAlpha(200);
  }

  _getLeftLayout() {
    double headerSize = 36;
    return Container(
      padding: EdgeInsets.only(left: 1,right: 4),
      height: headerSize,
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(50),
        borderRadius: BorderRadius.circular(headerSize)
      ),
      child: Row(
        children: [
          Container(
            constraints: BoxConstraints(
                minHeight: headerSize,
                minWidth: headerSize,
                maxWidth: headerSize,
                maxHeight: headerSize
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(headerSize/2),
              image: DecorationImage(image: AssetImage("assets/images/star_5.jpeg")),
            ),
          ),
          SizedBox(width: 4,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('彭于晏',style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),),
              Text('88.8万本场点赞',style: TextStyle(color: Colors.grey[400],fontSize: 8,)),
            ],
          ),
          SizedBox(width: 5,),
          Container(
            padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 254,43,84),
                borderRadius: BorderRadius.circular(headerSize/2)
            ),
            child: Text('关注',style: TextStyle(color: Colors.white,fontSize:13 ,fontWeight: FontWeight.w500),),
          ),
        ],
      ),
    );
  }
}