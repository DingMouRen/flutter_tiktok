import 'package:flutter/material.dart';
import 'package:flutter_tiktok/common/application.dart';
import 'package:flutter_tiktok/commonWidget/edit_clear_widget.dart';
import 'package:flutter_tiktok/controller/user_controller.dart';
import 'package:flutter_tiktok/enum/type_userinfo_edit.dart';
import 'package:flutter_tiktok/event/modify_info_event.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';
///修改用户资料的通用组件
class ModifyInfoPage extends StatefulWidget {

  ModifyInfoPage({Key key}) : super(key: key);

  @override
  _ModifyInfoPageState createState() {
    return _ModifyInfoPageState();
  }
}

class _ModifyInfoPageState extends State<ModifyInfoPage> {
  int typeEdit;
  String content;
  String contentNew = '';
  String title;
  @override
  void initState() {
    super.initState();
    Map<String,String> parameters = Get.parameters;
    title = parameters['title'];
    content = parameters['content'];
    typeEdit = int.parse(parameters['type_edit']);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorRes.color_1,
      appBar: AppBar(
        backgroundColor: ColorRes.color_1,
        title: Text('修改$title'),
        centerTitle: true,
        actions: [
          TextButton(
          onPressed: (){
            Application.eventBus.fire(ModifyInfoEvent(typeEdit, contentNew));
            Get.back();
          },
          child: Text('保存',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: ColorRes.color_3),))
        ],
      ),
      body: _getBody(content),
    );
  }

  _getBody(String content) {
    return EditClearWidget(
      contentOriginal: content,
      onChange: (text){
        contentNew = text;
      },
    );
  }
}