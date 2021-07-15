import 'package:flutter_tiktok/enum/type_userinfo_edit.dart';

///修改个人资料event
class ModifyInfoEvent{
  int typeUserInfoEdit ;
  String content;

  ModifyInfoEvent(this.typeUserInfoEdit, this.content);
}