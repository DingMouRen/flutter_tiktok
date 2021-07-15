import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_tiktok/common/router_manager.dart';
import 'package:flutter_tiktok/common/sp_keys.dart';
import 'package:flutter_tiktok/controller/user_controller.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:flutter_tiktok/util/sp_util.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {

  TextField accountField,pwdField;
  String account,pwd;
  UserController loginController = Get.put(UserController());

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

    accountField = TextField(
        cursorColor:ColorRes.color_1,
        cursorWidth: 2,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: '请输入邮箱'
      ),
      onChanged: (text){
        account = text;
      },
    );

    pwdField = TextField(
      cursorColor:ColorRes.color_1,
      cursorWidth: 2,
      obscureText: true,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入密码'
      ),
      onChanged: (text){
        pwd = text;
      },
    );

    return Scaffold(
      backgroundColor: ColorRes.color_1,
      appBar: AppBar(
        backgroundColor: ColorRes.color_1,
        elevation: 0,
        leading: TextButton(
          onPressed: (){
            Get.back();
          },
          child: Icon(Icons.close,color: Colors.white,size: 30,),
        ),
      ),
      body: _layoutLogin(context),
    );
  }

  _layoutLogin(BuildContext context) {
    return Container(
      child:  Container(
          height: 300,
          margin: EdgeInsets.only(top: 180),
          child: Column(
              children: [
                _getAccountTextField(),
                SizedBox(height: 10,),
                _getPwdTextField(),
                SizedBox(height: 20,),
               _getLogin(context),
                _getBottomLayout(context),
              ],
            ),
      ),
    );
  }

  _getAccountTextField() {
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: 60,right: 60),
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 10,right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5)
      ),
      child: accountField,
    );
  }

  _getPwdTextField() {
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: 60,right: 60),
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 10,right: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)
      ),
      child: pwdField,
    );
  }

  _getLogin(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(left: 60,right: 60),
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        onPressed: (){
          if(null != account && account.length > 0 && null != pwd && pwd.length > 0){
            loginController.login(account, pwd);
          }else{
            EasyLoading.showToast('请填写完整邮箱和密码');
          }
        },
        child: Text('登录',style: TextStyle(color: Colors.white,fontSize: 20),),
        color: ColorRes.color_3,
        shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(5)
        ),
      ),
    );
  }

  _getBottomLayout(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 60,right: 60),
      height: 40,
      child: Stack(
        children: [
          Positioned(
              left: 0,
              child: TextButton(
                onPressed: (){
                  EasyLoading.showToast('功能待开发');
                },
                child: Text('忘记密码',style: TextStyle(color: Colors.white),),
              )),
          Positioned(
              right: 0,
              child: TextButton(
                onPressed: (){
                  Get.toNamed(Routers.register);
                },
                child: Text('注册',style: TextStyle(color: Colors.white),),
              )),
        ],
      ),
    );
  }
}