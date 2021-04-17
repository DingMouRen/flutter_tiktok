import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tiktok/page/widget/like_gesture_widget.dart';
import 'package:video_player/video_player.dart';

class TestPage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TestPage> {

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
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body:  LikeGestureWidget(
        onAddFavorite: (){
          print('onAddFavorite');
        },
        onSingleTap: (){
          print('onSingleTop');
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
        ),
      ),
    );
  }
}
