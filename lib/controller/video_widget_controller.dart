
import 'package:get/get.dart';

class VideoWidgetController extends GetxController{

  var playing = true.obs;

  //设置视频播放状态
  void setPlayState(bool play){
    playing.value = play;
  }
}