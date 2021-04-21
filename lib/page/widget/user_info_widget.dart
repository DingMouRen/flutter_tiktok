import 'package:flutter/material.dart';
import 'package:flutter_tiktok/controller/main_page_scroll_controller.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';
///用户信息
class UserInfoWidget extends StatefulWidget {
  bool isLoginUser;
  UserInfoWidget(this.isLoginUser);

  @override
  _UserInfoWidgetState createState() {
    return  _UserInfoWidgetState();
  }
}

class _UserInfoWidgetState extends State<UserInfoWidget> {
  MainPageScrollController _mainController = Get.find();
  double _widgetHeight = 300;
  bool focus = false;
  @override
  void initState() {
    super.initState();

  }

  //获取控件高度
  double getWidgetHeight(){
    return _widgetHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //背景颜色
        _getBackgroundColor(),
        Column(
          children: [
            //头像、关注
            _getHeaderLayout(),
            //用户信息
            _getUserInfoLayout(),
          ],
        ),
      ],
    );
  }


  //背景颜色
  _getBackgroundColor() {
    return Positioned(
        top: 0,
        child: Container(
          color: ColorRes.color_1,
          width: MediaQuery.of(context).size.width,
          height: _widgetHeight,
        )
    );
  }
  //头像等
  _getHeaderLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          margin: EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.fromBorderSide(BorderSide(color: ColorRes.color_1,width: 2)),
              image: DecorationImage(
                  image: AssetImage(_mainController.userModelCurrent.value.headerImg)
              )
          ),
        ),
         Expanded(
           child: widget.isLoginUser?_getLoginUser():_getCommonUser(),
         ),
      ],
    );
  }
  //登录用户返回
  _getLoginUser(){
    return InkWell(
      onTap: (){

      },
      child: Container(
        height: 37,
        margin: EdgeInsets.only(left: 10,right: 16),
        decoration: BoxDecoration(
          color: ColorRes.color_2.withAlpha(20),
          borderRadius: BorderRadius.circular(2),
        ),
        alignment: Alignment.center,
        child: Text('编辑资料',style: TextStyle(color: Colors.white,fontSize: 15),),
      ),
    );
  }
  //一般用户返回
  _getCommonUser(){
    return InkWell(
      onTap: (){
        setState(() {
          focus = !focus;
        });
      },
      child: Container(
        height: 37,
        margin: EdgeInsets.only(left: 10,right: 16),
        decoration: BoxDecoration(
          color: focus?ColorRes.color_2.withAlpha(20):ColorRes.color_3,
          borderRadius: BorderRadius.circular(2),
        ),
        alignment: Alignment.center,
        child: Text(focus?'取消关注':'+  关注',style: TextStyle(color: Colors.white,fontSize: 15),),
      ),
    );
  }

  _getUserInfoLayout() {
    return Container(
      margin: EdgeInsets.only(left: 12,right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Text(_mainController.userModelCurrent.value.name,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
          SizedBox(height: 5,),
          Text('抖音号：${_mainController.userModelCurrent.value.douYinNumber}',
            style: TextStyle(color: ColorRes.color_2,fontSize: 12),
          ),
          SizedBox(height: 10,),
          Divider(color: Colors.grey.withAlpha(100),height: 0.05,),
          SizedBox(height: 10,),
          Text(_mainController.userModelCurrent.value.introduction,
            style: TextStyle(color: Colors.white,fontSize: 14),),
          SizedBox(height: 5,),
          _getSexCity(),
          SizedBox(height: 10,),
          _getNumberLayout(),
          SizedBox(height: 10,),
        ],
      ),
    );
  }

  _getSexCity() {
    return Row(
      children: [
        //性别
        Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: ColorRes.color_2.withAlpha(50),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(_mainController.userModelCurrent.value.male?'assets/images/male.webp':'assets/images/famale.webp',
                width: 10,
                height: 10,
              ),
              SizedBox(width: 2,),
              Text('29岁',
                style: TextStyle(color: Colors.grey,fontSize: 10),),
            ],
          ),
        ),
        //城市
        Container(
          padding: EdgeInsets.all(3),
          margin: EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
            color: ColorRes.color_2.withAlpha(50),
            borderRadius: BorderRadius.circular(2),
          ),
          child:  Text(_mainController.userModelCurrent.value.city,
            style: TextStyle(color: Colors.grey,fontSize: 10),),
        ),
      ],
    );
  }
  //获赞数、关注数、粉丝
  _getNumberLayout() {
    return  Row(
        children: [
          Text(_mainController.userModelCurrent.value.likeTotalNumber,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
          SizedBox(width: 2,),
          Text('获赞',
            style: TextStyle(color: ColorRes.color_2,fontSize: 13),),
          SizedBox(width: 15,),
          Text(_mainController.userModelCurrent.value.focusNumber,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
          SizedBox(width: 2,),
          Text('关注',
            style: TextStyle(color: ColorRes.color_2,fontSize: 13),),
          SizedBox(width: 15,),
          Text(_mainController.userModelCurrent.value.fansNumber,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
          SizedBox(width: 2,),
          Text('粉丝',
            style: TextStyle(color: ColorRes.color_2,fontSize: 13),),
        ],
    );
  }
}