import 'dart:ui';

import 'package:flutter/material.dart';
//拍摄页顶部部件
class ShootTopWidget extends StatefulWidget {
  ShootTopWidget({Key key}) : super(key: key);

  @override
  _ShootTopWidgetState createState() {
    return _ShootTopWidgetState();
  }
}

class _ShootTopWidgetState extends State<ShootTopWidget> {
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
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(
          top: MediaQueryData.fromWindow(window).padding.top+25,
          left: 16
      ),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: 40,
        minHeight: 40,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
              child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Image.asset('assets/images/cross.webp',color: Colors.white,width: 25,height: 25,))),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(150),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/music.webp',color: Colors.white,width: 15,height: 15,),
                  SizedBox(width: 5,),
                  Text('选择音乐',style: TextStyle(color: Colors.white,fontSize: 12),)
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}