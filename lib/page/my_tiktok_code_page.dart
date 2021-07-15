import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../common/router_manager.dart';
import '../res/colors.dart';
///我的抖音码
class MyTikTokCodePage extends StatefulWidget {

  @override
  _MyTikTokCodePageState createState() {
    return _MyTikTokCodePageState();
  }
}

class _MyTikTokCodePageState extends State<MyTikTokCodePage> {
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
    // TODO: implement build
    return Scaffold(
      backgroundColor: ColorRes.color_1,
      appBar: AppBar(
        backgroundColor: ColorRes.color_1,
        title: Text('我的抖音码',style: TextStyle(color: Colors.white),),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          color: Colors.white,
          onPressed: (){
            Get.back();
          },
        ),
      ),
      body: Container(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 100,
                child: Container(
                  width: 296,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: AssetImage('assets/images/tiktok_my_code.jpg'))
                  ),
                ),
            ),

            Positioned(
              left: 50,
                bottom: 20,
                child: Column(
                  children: [
                    Image.asset('assets/images/down_load.webp',width: 40,height: 40,),
                    Text("保存到相册",style: TextStyle(color: Colors.white,fontSize: 12),)
                  ],
                ),
            ),
            Positioned(
              right: 50,
              bottom: 20,
              child: InkWell(
                onTap: (){
                  Get.back();
                },
                child: Column(
                  children: [
                    Image.asset('assets/images/scan.webp',width: 30,height: 30,color: Colors.white,),
                    Text("扫一扫",style: TextStyle(color: Colors.white,fontSize: 12),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}