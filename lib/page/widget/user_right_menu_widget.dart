import 'package:flutter/material.dart';
import 'package:flutter_tiktok/res/colors.dart';

class UserRightMenuWidget extends StatefulWidget {

  @override
  _UserRightMenuWidgetState createState() {
    return _UserRightMenuWidgetState();
  }
}

class _UserRightMenuWidgetState extends State<UserRightMenuWidget> {
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
    return  Material(
      child: Container(
        width: MediaQuery.of(context).size.width / 3 * 2,
        height: MediaQuery.of(context).size.height,
        color: ColorRes.color_1,
        child:Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children:_getMenuItem(),
              ),
            ),
            Positioned(
                bottom: 40,
                child: Container(
                  width: MediaQuery.of(context).size.width / 3 * 2 - 40,
                  height: 37,
                  padding: EdgeInsets.only(left: 36,right: 36),
                  decoration: BoxDecoration(
                    color: ColorRes.color_2.withAlpha(40),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/more_block.png',width: 20,height: 20,color: Colors.white,),
                      SizedBox(width: 10,),
                      Text('更多功能',style: TextStyle(color: Colors.white,fontSize: 14),)
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }

  _getMenuItem() {
    return [
      Container(
        height: 50,
      ),
      UserRightMenuItemWidget(
        iconUrl: 'assets/images/shop.png',
        title: '我的订单',
        onTap: (){

        },
      ),
      UserRightMenuItemWidget(
        iconUrl: 'assets/images/wallet.png',
        title: '钱包',
        onTap: (){

        },
      ),
      SizedBox(height: 10,),
      Padding(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Divider(color: Colors.grey.withAlpha(100),height: 0.05,),
      ),
      SizedBox(height: 10,),
      UserRightMenuItemWidget(
        iconUrl: 'assets/images/hollow_star.png',
        title: '我的收藏',
        onTap: (){

        },
      ),
      UserRightMenuItemWidget(
        iconUrl: 'assets/images/sun.png',
        title: '我的动态',
        onTap: (){

        },
      ),
      UserRightMenuItemWidget(
        iconUrl: 'assets/images/framer.png',
        title: '创作者服务中心',
        onTap: (){

        },
      ),
      SizedBox(height: 10,),
      Padding(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Divider(color: Colors.grey.withAlpha(100),height: 0.05,),
      ),
      SizedBox(height: 10,),
      UserRightMenuItemWidget(
        iconUrl: 'assets/images/line_application.webp',
        title: '小程序',
        onTap: (){

        },
      ),
      UserRightMenuItemWidget(
        iconUrl: 'assets/images/gongyi.webp',
        title: '抖音公益',
        onTap: (){

        },
      ),
      UserRightMenuItemWidget(
        iconUrl: 'assets/images/rib.png',
        title: '未成年保护工具',
        onTap: (){

        },
      ),
      UserRightMenuItemWidget(
        iconUrl: 'assets/images/service.png',
        title: '我的客服',
        onTap: (){

        },
      ),
      UserRightMenuItemWidget(
        iconUrl: 'assets/images/setting.png',
        title: '设置',
        onTap: (){

        },
      ),
      Container(height: 100,),
    ];
  }
}

class UserRightMenuItemWidget extends StatelessWidget{
  String iconUrl;
  String title;
  Function onTap;
  Alignment alignment;

  UserRightMenuItemWidget({String iconUrl,String title,Function onTap,Alignment alignment}){
    this.onTap = onTap;
    this.title = title;
    this.iconUrl = iconUrl;
    this.alignment = alignment;
}

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorRes.color_1,
      child: InkWell(
        onTap: (){
          onTap?.call();
        },
        child: Container(
          margin: EdgeInsets.only(left: 20,right: 20),
          height: 60,
          alignment: alignment??Alignment.centerLeft,
          color: ColorRes.color_1,
          child: Row(
            children: [
              Image.asset(iconUrl,width: 18,height: 18,color: Colors.white,),
              SizedBox(width: 10,),
              Text(title,style: TextStyle(color: Colors.white,fontSize: 14),)
            ],
          ),
        ),
      ),
    );
  }

}