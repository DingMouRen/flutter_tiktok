import 'package:get/get.dart';

class UserPageController extends GetxController{
  //是否展示AppBar的title
  var showTitle = false.obs;
  //是否展示右边的菜单
  var showRightMenu = false.obs;


  void setShowTitle(bool show){
    showTitle.value = show;
  }

  void toggleRightMenu(){
    showRightMenu.value = !showRightMenu.value;
  }
}