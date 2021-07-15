import 'dart:math';

import 'package:flutter/material.dart';

class UserItemGridWidget extends StatefulWidget {
  String gifUrl;
  Function onTap;
  UserItemGridWidget({String url,Function onTap}){
    this.gifUrl = url;
    this.onTap = onTap;
  }
  @override
  _UserItemGridWidgetState createState() {
    return _UserItemGridWidgetState();
  }
}

class _UserItemGridWidgetState extends State<UserItemGridWidget> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.onTap?.call();
      },
      child: Stack(
          children: [
            Image.network(widget.gifUrl,fit: BoxFit.cover,),
            Positioned(
              left: 2,
              bottom: 2,
              child: Row(
                children: [
                  Image.asset('assets/images/hollow_heart.webp',width: 15,height: 15,),
                  Text(' ${Random().nextInt(600)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12
                    ),
                  ),
                ],
              ),
            ),
          ],
      ),
    );
  }
}