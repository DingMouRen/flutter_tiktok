import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_tiktok/model/request/publish_feed_request.dart';
import 'package:flutter_tiktok/model/response/feed_list_response.dart';
import 'package:flutter_tiktok/net/api.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FeedController extends GetxController{

  //热门推荐
  final hotFeedList = <FeedListList>[].obs;
  int cursor = 0;
  int count = 10;

  //好友列表
  final friendFeedList = <FeedListList>[].obs;
  int cursorFriend = 0;
  int countFriend = 10;

  ///发布单个视频
  Future<int> publishFeed(String title,String videoUrl,String coverImgUrl,int duration,int width,int height) async{
    PublishFeedRequest publishFeedRequest = PublishFeedRequest();
    PublishFeedContent publishFeedContent = PublishFeedContent();
    PublishFeedLocation publishFeedLocation = PublishFeedLocation();
    List<PublishFeedContentTag> tags = [];
    List<PublishFeedContentAt> ats = [];
    List<PublishFeedContentAttachmants> attachments = [];
    PublishFeedContentMusic music = PublishFeedContentMusic();
    PublishFeedContentAttachmants publishFeedContentAttachmants = PublishFeedContentAttachmants();

    publishFeedRequest.type = 4;//默认成视频，
    publishFeedRequest.content = publishFeedContent;
    publishFeedContent.text = title;
    publishFeedContentAttachmants.type = 2;
    publishFeedContentAttachmants.url = videoUrl;
    publishFeedContentAttachmants.cover = coverImgUrl;
    publishFeedContentAttachmants.gifCover = '-1';
    publishFeedContentAttachmants.duration = duration;
    publishFeedContentAttachmants.width = width;
    publishFeedContentAttachmants.height = height;
    attachments.add(publishFeedContentAttachmants);
    publishFeedContent.attachments = attachments;

    var result = await Api.publishFeed(publishFeedRequest);
    if(null != result){
      EasyLoading.showToast('发布成功');
      Get.back();
    }
    return result.id;
  }

  ///获取热门推荐视频列表
  Future<bool> getHotFeedList(RefreshController refreshController)async{
    var result = await Api.getHotFeedList(cursor, count);
    if(result != null){
      hotFeedList.addAll(result.xList);
      cursor = result.cursor;
      refreshController.loadComplete();
      return true;
    }else{
      return false;
    }

  }

  void refreshHotFeedList(RefreshController refreshController)async{
    cursor = 0;
    hotFeedList.clear();
    await getHotFeedList(refreshController);
    refreshController.refreshCompleted();
  }

  ///获取好友视频列表
  Future<bool> getFriendFeedList(RefreshController refreshController)async{
    var result = await Api.getFriendFeedList(cursorFriend, countFriend);
    if(result != null){
      friendFeedList.addAll(result.xList);
      cursorFriend = result.cursor;
      refreshController.loadComplete();
      return true;
    }else{
      return false;
    }

  }

  void refreshFriendFeedList(RefreshController refreshController)async{
    cursorFriend = 0;
    friendFeedList.clear();
    await getFriendFeedList(refreshController);
    refreshController.refreshCompleted();
  }
}