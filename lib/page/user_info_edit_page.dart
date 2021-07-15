import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_tiktok/common/application.dart';
import 'package:flutter_tiktok/common/router_manager.dart';
import 'package:flutter_tiktok/common/sp_keys.dart';
import 'package:flutter_tiktok/commonWidget/click_item_list_widget.dart';
import 'package:flutter_tiktok/commonWidget/item_turn_widget.dart';
import 'package:flutter_tiktok/controller/upload_controller.dart';
import 'package:flutter_tiktok/controller/user_controller.dart';
import 'package:flutter_tiktok/enum/type_camera_source.dart';
import 'package:flutter_tiktok/enum/type_userinfo_edit.dart';
import 'package:flutter_tiktok/event/modify_info_event.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:flutter_tiktok/util/camera_util.dart';
import 'package:flutter_tiktok/util/sp_util.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
///编辑用户资料
class UserInfoEditPage extends StatefulWidget {
  UserInfoEditPage({Key key}) : super(key: key);

  @override
  _UserInfoEditPageState createState() {
    return _UserInfoEditPageState();
  }
}

class _UserInfoEditPageState extends State<UserInfoEditPage> {

  UserController userController = Get.put(UserController());
  UploadController uploadController = Get.put(UploadController());

  @override
  void initState() {
    super.initState();
    //获取用户资料
     SPUtil.getInt(SPKeys.userUid).then((uid){
       userController.getUserInfo(uid.toString());
     });
     //监听用户资料编辑
    Application.eventBus.on<ModifyInfoEvent>().listen((event) {
        _parseEditEvent(event);
    });


  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(context),
      body: _getBody(context),
    );
  }

  _getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: ColorRes.color_1,
      title: Text('编辑资料'),
      elevation: 0,
      centerTitle: true,
    );
  }

  _getBody(BuildContext context) {
    return Container(
      color: ColorRes.color_1,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _updateHeaderImg(context),
            Obx(()=>ItemTurnWidget(title: '昵称',rightTitle: userController.userInfoResponse.value.nickname,onClick: (){
              Map<String,String> map = HashMap();
              map['title'] = '昵称';
              map['type_edit'] = '1';
              map['content'] = userController.userInfoResponse.value.nickname;
              Get.toNamed(Routers.modifyUserInfo,parameters:map );
            },),),
            Obx(()=>ItemTurnWidget(title: '抖音号',rightTitle: userController.userInfoResponse.value.uid.toString(),onClick: (){},showArrowRight: false,),),
            Obx(()=> ItemTurnWidget(title: '简介',rightTitle: userController.userInfoResponse.value.bio,onClick: (){
              Map<String,String> map = HashMap();
              map['title'] = '简介';
              map['type_edit'] = '3';
              map['content'] = userController.userInfoResponse.value.bio;
              Get.toNamed(Routers.modifyUserInfo,parameters:map );
            },),),
            Obx(()=>ItemTurnWidget(title: '出生年月',rightTitle: userController.userInfoResponse.value.birth,onClick: (){_pickerBirth();},),),
            Obx((){
              int genderInt = userController.userInfoResponse.value.gender;
              String genderStr = '未设置';
              if(genderInt == 1){
                genderStr='女';
              }else if(genderInt == 2){
                genderStr = '男';
              }else{

              }

              return ItemTurnWidget(title: '性别',rightTitle: genderStr,onClick: (){_showPickerGender(genderInt);},);
            }),
            Obx(()=>ItemTurnWidget(title: '所在城市',rightTitle: userController.userInfoResponse.value.city,onClick: (){
              Map<String,String> map = HashMap();
              map['title'] = '所在城市';
              map['type_edit'] = '6';
              map['content'] = userController.userInfoResponse.value.city;
              Get.toNamed(Routers.modifyUserInfo,parameters:map );
            },),),
            Obx(()=>ItemTurnWidget(title: '职业',rightTitle: userController.userInfoResponse.value.profession,onClick: (){
              Map<String,String> map = HashMap();
              map['title'] = '职业';
              map['type_edit'] = '7';
              map['content'] = userController.userInfoResponse.value.profession;
              Get.toNamed(Routers.modifyUserInfo,parameters:map );
            },),),
          ],
        ),
      ),
    );
  }

  _updateHeaderImg(BuildContext context) {
    double sizeHeader = 90;
    return Container(
      width: Get.width,
      height: 150,
      child: InkWell(
        onTap: (){
          _showImgPickerAction();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(()=> Container(
              width: sizeHeader,
              height: sizeHeader,
              decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(sizeHeader/2),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: userController.userInfoResponse.value.portrait==null?
                    AssetImage('assets/images/person_holder.png'):
                    NetworkImage(userController.userInfoResponse.value.portrait),
                  ),
                  color: Colors.white
              ),
              child: Container(
                width: sizeHeader,
                height: sizeHeader,
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(100),
                  borderRadius:BorderRadius.circular(sizeHeader/2),
                ),
                child: Icon(Icons.camera_alt_outlined,color: Colors.white,size: 36,),
              ),
            ),),
           
            SizedBox(height: 10,),
            Text('点击更换头像',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }

  //展示选择相机/相册
  void _showImgPickerAction() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
          ),),
        backgroundColor: Colors.white,
        builder: (context)=>ClickItemListWidget(
                actionTitles: ['相机','相册'],
                onClick: (int position){
                  switch(position){
                    case TypeCameraSource.camera:
                      _uploadHeaderImg(TypeCameraSource.camera);
                      break;
                    case TypeCameraSource.gallery:
                      _uploadHeaderImg(TypeCameraSource.gallery);
                      break;
                  }
                  Get.back();
                },
     )
    );
  }
  //相机/相册
  void _uploadHeaderImg(int typeImgSource) async{
    ImageSource imageSource;
    if(typeImgSource == TypeCameraSource.camera){
      imageSource = ImageSource.camera;
    }else if(typeImgSource == TypeCameraSource.gallery){
      imageSource = ImageSource.gallery;
    }
    var imgCamera = await ImagePicker.pickImage(source: imageSource);
    String imgSuffix = CameraUtil.getImgSuffix(imgCamera.path);
    bool success = await uploadController.uploadSingleFile(imgSuffix,imgCamera);
    if(success){
      userController.userInfoResponse.value.portrait = uploadController.uploadResponse.tokens[0].effectUrl;
      userController.updateUserInfo();
    }else{
      EasyLoading.showToast('图片上传失败');
    }
  }



  ///修改个人资料：昵称、简介、城市、职业
  void _parseEditEvent(ModifyInfoEvent event) {
    print('type:${event.typeUserInfoEdit}');
    print('content:${event.content}');
    switch(event.typeUserInfoEdit){
      case TypeUserInfoEdit.nickname:
        userController.userInfoResponse.value.nickname = event.content;
        break;
      case TypeUserInfoEdit.bio:
        userController.userInfoResponse.value.bio = event.content;
        break;
      case TypeUserInfoEdit.city:
        userController.userInfoResponse.value.city = event.content;
        break;
      case TypeUserInfoEdit.profession:
        userController.userInfoResponse.value.profession = event.content;
        break;
    }
    print('用户资料:${userController.userInfoResponse.value.toJson()}');
    userController.updateUserInfo();
  }

  ///展示性别选择框
  void _showPickerGender(int genderInt) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),),
        backgroundColor: Colors.white,
        builder: (context)=>ClickItemListWidget(
          actionTitles: ['男','女'],
          onClick: (int position){
            switch(position){
              case 0:
                userController.userInfoResponse.value.gender = 2;
                break;
              case 1:
                userController.userInfoResponse.value.gender = 1;
                break;
            }
            userController.updateUserInfo();
            Get.back();
          },
        )
    );
  }

  //修改出生年月
  void _pickerBirth() {
    showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now().subtract(new Duration(days: 100000)),
      lastDate: new DateTime.now(),
    ).then((DateTime val) {
      String year = val.year.toString();
      String month = val.month.toString();
      String day = val.day.toString();
      String birth = '$year-$month-$day';
      userController.userInfoResponse.value.birth = birth;
      userController.updateUserInfo();
    }).catchError((err) {
      print(err);
    });

  }


}

