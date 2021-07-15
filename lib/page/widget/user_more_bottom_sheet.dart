import 'package:flutter/material.dart';
import 'package:flutter_tiktok/controller/main_page_scroll_controller.dart';
import 'package:flutter_tiktok/model/user_model.dart';
import 'package:flutter_tiktok/net/api.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';

class UserMoreBottomSheet extends StatefulWidget {
  UserMoreBottomSheet({Key key}) : super(key: key);

  @override
  _UserMoreBottomSheetState createState() {
    return _UserMoreBottomSheetState();
  }
}

class _UserMoreBottomSheetState extends State<UserMoreBottomSheet> {
  MainPageScrollController _mainController = Get.find();

  @override
  Widget build(BuildContext context) {
    UserModel user = loginUserModel;
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Text(user.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            SizedBox(height: 2,),
            Text('抖音号:'+user.douYinNumber,style: TextStyle(fontSize: 11,color: Colors.grey),),
            SizedBox(height: 20,),
            Divider(color: Colors.grey.withAlpha(100),height: 0.05,),
            Container(
              padding: EdgeInsets.only(top: 20,bottom: 20),
              child:Text('分享',style: TextStyle(fontSize: 14,),)
            ),
            Divider(color: Colors.grey.withAlpha(100),height: 0.05,),
            Container(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child:Text('发私信',style: TextStyle(fontSize: 14,),)
            ),
            Divider(color: Colors.grey.withAlpha(100),height: 0.05,),
            Container(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child:Text('不让TA看',style: TextStyle(fontSize: 14,),)
            ),
            Divider(color: Colors.grey.withAlpha(100),height: 0.05,),
            Container(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child:Text('举报',style: TextStyle(fontSize: 14,color: Colors.red),)
            ),
            Divider(color: Colors.grey.withAlpha(100),height: 0.05,),
            Container(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child:Text('拉黑',style: TextStyle(fontSize: 14,color: Colors.red),)
            ),
           Container(
             height: 8,
             color: Colors.grey.withAlpha(100),
           ),

            InkWell(
              onTap: (){
                Get.back();
              },
              child: Container(
                  padding: EdgeInsets.only(top: 20,bottom: 20),
                  child:Text('取消',style: TextStyle(fontSize: 14,),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}