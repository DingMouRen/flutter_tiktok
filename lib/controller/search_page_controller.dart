import 'package:get/get.dart';
///搜索页的Controller
class SearchPageController extends GetxController{
  //排行榜选中的索引
  var indexSelectedRank = 0.obs;

  void setIndexSelectedRank(int index){
    indexSelectedRank.value = index;
  }
}