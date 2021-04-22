import 'package:flutter_tiktok/model/message_model.dart';
import 'package:flutter_tiktok/net/api.dart';
import 'package:get/get.dart';

class MessagePageController extends GetxController{
  List<MessageModel> list = [];

  MessagePageController(){
    list.addAll(messageList);
  }
}