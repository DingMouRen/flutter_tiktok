import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_tiktok/common/router_manager.dart';
import 'package:flutter_tiktok/common/sp_keys.dart';
import 'package:flutter_tiktok/commonWidget/item_turn_widget.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:flutter_tiktok/util/sp_util.dart';
import 'package:get/get.dart';
//设置页面
class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() {
    return _SettingPageState();
  }
}

class _SettingPageState extends State<SettingPage> {
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
      backgroundColor: ColorRes.color_1,
      appBar:_getAppBar(context),
      body: _getBody(context),
    );
  }

  _getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: ColorRes.color_1,
      title: Text('设置',style: TextStyle(color: Colors.white),),
      centerTitle: true,
      elevation: 0,
    );
  }

  _getBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20,right: 20),
                child: Text('账号',style: TextStyle(color: ColorRes.color_2,fontSize: 12),)),
            ItemTurnWidget(img: 'assets/images/person.png',title: '账号与安全',onClick: (){EasyLoading.showToast('账号与安全');},),
            ItemTurnWidget(img: 'assets/images/lock.png',title: '隐私设置',onClick: (){EasyLoading.showToast('功能待开发');},),
            Divider(color: ColorRes.color_2.withAlpha(20),),
            Padding(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Text('通用',style: TextStyle(color: ColorRes.color_2,fontSize: 12),)),
            ItemTurnWidget(img: 'assets/images/notice.png',title: '通知设置',onClick: (){EasyLoading.showToast('功能待开发');},),
            ItemTurnWidget(img: 'assets/images/active_wallpager.png',title: '动态壁纸',onClick: (){EasyLoading.showToast('功能待开发');},),
            ItemTurnWidget(img: 'assets/images/setting_common.png',title: '通用设置',onClick: (){EasyLoading.showToast('功能待开发');},),
            ItemTurnWidget(img: 'assets/images/color_palette.png',title: '背景设置',onClick: (){EasyLoading.showToast('功能待开发');},),
            Divider(color: ColorRes.color_2.withAlpha(20),),
            Padding(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Text('账号互通',style: TextStyle(color: ColorRes.color_2,fontSize: 12),)),
            ItemTurnWidget(img: 'assets/images/share_app_toutiao.webp',title: '头条主页',onClick: (){EasyLoading.showToast('功能待开发');},),
            ItemTurnWidget(img: 'assets/images/fensi.png',title: '粉丝',onClick: (){EasyLoading.showToast('功能待开发');},),
            Divider(color: ColorRes.color_2.withAlpha(20),),
            Padding(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Text('关于',style: TextStyle(color: ColorRes.color_2,fontSize: 12),)),
            ItemTurnWidget(img: 'assets/images/ad.png',title: '广告反馈与设置',onClick: (){EasyLoading.showToast('功能待开发');},),
            ItemTurnWidget(img: 'assets/images/user_service.png',title: '用户协议',onClick: (){EasyLoading.showToast('功能待开发');},),
            ItemTurnWidget(img: 'assets/images/community_service.png',title: '社区自律公约',onClick: (){EasyLoading.showToast('功能待开发');},),
            ItemTurnWidget(img: 'assets/images/private_service.png',title: '隐私政策',onClick: (){EasyLoading.showToast('功能待开发');},),
            ItemTurnWidget(img: 'assets/images/sdk_list.png',title: '第三方SDK列表',onClick: (){EasyLoading.showToast('功能待开发');},),
            ItemTurnWidget(img: 'assets/images/setting_about.png',title: '关于Flutter抖音',onClick: (){EasyLoading.showToast('功能待开发');},),
            ItemTurnWidget(img: 'assets/images/setting_feedback.png',title: '反馈与帮助',onClick: (){EasyLoading.showToast('功能待开发');},),
            ItemTurnWidget(img: 'assets/images/setting_delete.png',title: '清理占用空间',onClick: (){EasyLoading.showToast('功能待开发');},),
            Divider(color: ColorRes.color_2.withAlpha(20),),
            ItemTurnWidget(img: 'assets/images/setting_exchange.png',title: '切换账号',onClick: (){

              SPUtil.remove(SPKeys.userUid);
              SPUtil.remove(SPKeys.token);

              Get.offNamed(Routers.login);},),
            ItemTurnWidget(img: 'assets/images/setting_logout.png',title: '退出登录',onClick: (){

              SPUtil.remove(SPKeys.userUid);
              SPUtil.remove(SPKeys.token);

              Get.offNamed(Routers.login);},),

          ],
        ),
      ),
    );
  }
}