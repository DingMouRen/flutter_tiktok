import 'package:flutter_tiktok/model/city_item_model.dart';
import 'package:flutter_tiktok/model/message_model.dart';
import 'package:flutter_tiktok/model/user_model.dart';
import 'package:flutter_tiktok/model/video_model.dart';

import '../model/comment_model.dart';

class Api{

  //获取推荐页面的视频列表
  static List<VideoModel> getRecommendVideoList(){
    List<VideoModel> list = [];
    for(int i = 0;i < 6;i ++){
      VideoModel videoModel = VideoModel();
      videoModel.title = videoTitleList[i];
      videoModel.author = authorList[i];
      videoModel.authorHeaderUrl = authorHeaderUrlList[i];
      videoModel.videoUrl = videoUrlList[i];
      videoModel.favorite = false;
      videoModel.like = false;
      videoModel.likeNumber = '266${i}w';
      videoModel.commentList = commentList;
      videoModel.shareNumber = '18${i}w';
      videoModel.videoMusicImage = videoMusicImageList[i];
      videoModel.videoMusicName = videoMusicNameList[i];
      list.add(videoModel);
    }
    return list;
  }

  //获取朋友页面的视频列表
  static List<VideoModel> getFriendVideoList(){
    List<VideoModel> list = [];
    for(int i = 0;i < 6;i ++){
      VideoModel videoModel = VideoModel();
      videoModel.title = videoTitleList[i];
      videoModel.author = authorList[i];
      videoModel.authorHeaderUrl = authorHeaderUrlList[i];
      videoModel.videoUrl = videoUrlList[i];
      videoModel.favorite = false;
      videoModel.like = false;
      videoModel.likeNumber = '266${i}w';
      videoModel.commentList = commentList;
      videoModel.shareNumber = '18${i}w';
      videoModel.videoMusicImage = videoMusicImageList[i];
      videoModel.videoMusicName = videoMusicNameList[i];
      list.add(videoModel);
    }
    return list;
  }

  //获取关注页面的视频列表
  static List<VideoModel> getFocusVideoList(){
    List<VideoModel> list = [];
    for(int i = 0;i < 6;i ++){
      VideoModel videoModel = VideoModel();
      videoModel.title = videoTitleList[i];
      videoModel.author = authorList[i];
      videoModel.authorHeaderUrl = authorHeaderUrlList[i];
      videoModel.videoUrl = videoUrlList[i];
      videoModel.favorite = false;
      videoModel.like = false;
      videoModel.likeNumber = '266${i}w';
      videoModel.commentList = commentList;
      videoModel.shareNumber = '18${i}w';
      videoModel.videoMusicImage = videoMusicImageList[i];
      videoModel.videoMusicName = videoMusicNameList[i];
      list.add(videoModel);
    }
    return list;
  }

  //获取城市页面的视频列表
  static List<CityItemModel> getCityVideoList(){
    List<CityItemModel> list = [];
    for(int i = 0;i < 6;i ++){
      CityItemModel cityItemModel = CityItemModel();
      cityItemModel.user = userModelList[i];
      cityItemModel.imgCoverUrl = gifList[i];
      cityItemModel.distance = '0.8${i}km';
      list.add(cityItemModel);
    }
    return list;
  }



}





List<UserModel> userModelList = List.generate(6, (i) {
  UserModel userModel = UserModel();
  userModel.name = authorList[i];
  userModel.headerBgImage = headerBgImageList[i];
  userModel.headerImg = authorHeaderUrlList[i];
  userModel.douYinNumber = '19234$i';
  userModel.introduction = introductionList[i];
  userModel.male = i%2 == 0?true:false;
  userModel.city = '杭州';
  userModel.likeTotalNumber = '156${i}w';
  userModel.focusNumber = '45${i}w';
  userModel.fansNumber = '88${i}w';

  List<VideoModel> list = [];
  list.addAll(videoModelList);
  list.addAll(videoModelList);
  list.addAll(videoModelList);
  list.addAll(videoModelList);

  userModel.worksVideo = list;
  userModel.likeVideo = list;

  List<String> gifListTemp = [];
  gifListTemp.addAll(gifList);
  gifListTemp.addAll(gifList);
  gifListTemp.addAll(gifList);
  gifListTemp.addAll(gifList);
  gifListTemp.addAll(gifList);

  userModel.worksVideoGif = gifListTemp;
  userModel.likeVideoGif = gifListTemp;

  return userModel;
});

List<VideoModel> videoModelList = List.generate(6, (i) {
  VideoModel videoModel = VideoModel();
  videoModel.title = videoTitleList[i];
  videoModel.author = authorList[i];
  videoModel.authorHeaderUrl = authorHeaderUrlList[i];
  videoModel.videoUrl = videoUrlList[i];
  videoModel.favorite = false;
  videoModel.like = false;
  videoModel.likeNumber = '266${i}w';
  videoModel.commentList = commentList;
  videoModel.shareNumber = '18${i}w';
  videoModel.videoMusicImage = videoMusicImageList[i];
  videoModel.videoMusicName = videoMusicNameList[i];
  return videoModel;
});


//评论的本地假数据
List<CommentModel> commentList = [
  CommentModel('爱丽丝',  'assets/images/header_0.jpg','千秋无绝色！悦目是佳人！倾国倾城貌！惊为天下人！', false, 234, '2分钟前'),
  CommentModel('一条小团团',  'assets/images/header_1.jpg','芙蓉不及美人妆，水殿风来珠翠香', false, 688, '9分钟前'),
  CommentModel('伊素婉',  'assets/images/header_2.jpg', '届笑春桃兮，云堆翠髻；唇绽樱颗兮，榴齿含香',false, 7567, '6分钟前'),
  CommentModel('超级马里奥',  'assets/images/header_3.jpg','朱粉不深匀,闲花淡淡香。细看诸处好,人人道,柳腰身', false, 3543, '23分钟前'),
  CommentModel('肖了个邦',  'assets/images/header_4.jpg', '头上金爵钗，腰佩翠琅玕。明珠交玉体，珊瑚间木难。罗衣何飘飘，轻裾随风远。顾盼遗光彩，长啸气若兰',false, 234, '4小时前'),
  CommentModel('惠子',  'assets/images/header_5.jpg', '皎皎兮似轻云之蔽月，飘飘兮若回风之流雪',false, 888, '4分钟前'),
  CommentModel('爱丽丝',  'assets/images/header_0.jpg','千秋无绝色！悦目是佳人！倾国倾城貌！惊为天下人！', false, 234, '2分钟前'),
  CommentModel('一条小团团',  'assets/images/header_1.jpg','芙蓉不及美人妆，水殿风来珠翠香', false, 688, '9分钟前'),
  CommentModel('伊素婉',  'assets/images/header_2.jpg', '届笑春桃兮，云堆翠髻；唇绽樱颗兮，榴齿含香',false, 7567, '6分钟前'),
  CommentModel('超级马里奥',  'assets/images/header_3.jpg','朱粉不深匀,闲花淡淡香。细看诸处好,人人道,柳腰身', false, 3543, '23分钟前'),
  CommentModel('肖了个邦',  'assets/images/header_4.jpg', '头上金爵钗，腰佩翠琅玕。明珠交玉体，珊瑚间木难。罗衣何飘飘，轻裾随风远。顾盼遗光彩，长啸气若兰',false, 234, '4小时前'),
  CommentModel('惠子',  'assets/images/header_5.jpg', '皎皎兮似轻云之蔽月，飘飘兮若回风之流雪',false, 888, '4分钟前'),
  CommentModel('爱丽丝',  'assets/images/header_0.jpg','千秋无绝色！悦目是佳人！倾国倾城貌！惊为天下人！', false, 234, '2分钟前'),
  CommentModel('一条小团团',  'assets/images/header_1.jpg','芙蓉不及美人妆，水殿风来珠翠香', false, 688, '9分钟前'),
  CommentModel('伊素婉',  'assets/images/header_2.jpg', '届笑春桃兮，云堆翠髻；唇绽樱颗兮，榴齿含香',false, 7567, '6分钟前'),
  CommentModel('超级马里奥',  'assets/images/header_3.jpg','朱粉不深匀,闲花淡淡香。细看诸处好,人人道,柳腰身', false, 3543, '23分钟前'),
  CommentModel('肖了个邦',  'assets/images/header_4.jpg', '头上金爵钗，腰佩翠琅玕。明珠交玉体，珊瑚间木难。罗衣何飘飘，轻裾随风远。顾盼遗光彩，长啸气若兰',false, 234, '4小时前'),
  CommentModel('惠子',  'assets/images/header_5.jpg', '皎皎兮似轻云之蔽月，飘飘兮若回风之流雪',false, 888, '4分钟前'),
];



//视频本地标题
List<String> videoTitleList = [
  '信手拈来的从容，都是厚积薄发的沉淀。',
  '只有坚持别人无法坚持的坚持，才能拥有别人无法拥有的拥有。',
  '我于颓废中睁眼，亦从灰烬中重燃。',
  '光荣与梦想千篇一律，自律与忍耐万里挑一。',
  '你要知道，别人的辉煌在现在，而你的辉煌在未来。',
  '当你觉得坚持不下去的时候，恰恰是你需要坚持下去的时候。',
];

//视频作者
List<String> authorList = [
  '爱丽丝',
  '一条小团团',
  '伊素婉',
  '超级马里奥',
  '肖了个邦',
  '惠子',
];
//作者头像
List<String> authorHeaderUrlList = [
  'assets/images/header_0.jpg',
  'assets/images/header_1.jpg',
  'assets/images/header_2.jpg',
  'assets/images/header_3.jpg',
  'assets/images/header_4.jpg',
  'assets/images/header_5.jpg',
];

//视频本地地址
List<String> videoUrlList = [
  'assets/video/video_0.mp4',
  'assets/video/video_1.mp4',
  'assets/video/video_2.mp4',
  'assets/video/video_3.mp4',
  'assets/video/video_4.mp4',
  'assets/video/video_6.mp4',
];

//本地视频对应得gif
List<String> gifList = [
  'assets/images/video_0.gif',
  'assets/images/video_1.gif',
  'assets/images/video_2.gif',
  'assets/images/video_3.gif',
  'assets/images/video_4.gif',
  'assets/images/video_5.gif',
];

//视频音乐的名称
List<String> videoMusicNameList = [
  '《隐形的翅膀》- 张韶涵',
  '《挥着翅膀的女孩》 - 容祖儿',
  '《永不退缩》 - 任贤齐',
  '《最初的梦想》 - Remix',
  '《改变自己》 - 王力宏',
  '《奔跑》 - 羽泉',
];

//视频音乐的头像
List<String> videoMusicImageList = [
  'assets/images/header_0.jpg',
  'assets/images/header_1.jpg',
  'assets/images/header_2.jpg',
  'assets/images/header_3.jpg',
  'assets/images/header_4.jpg',
  'assets/images/header_5.jpg',
];

//个人页头部背景
List<String> headerBgImageList = [
  'assets/images/bg_0.jpg',
  'assets/images/bg_1.jpg',
  'assets/images/bg_2.jpg',
  'assets/images/bg_3.jpg',
  'assets/images/bg_4.jpg',
  'assets/images/bg_5.jpg',
];

//个人页简介
List<String> introductionList = [
  '能让人感觉到快乐的不是只有爱情\n还有努力之后的成就感',
  '要悄悄地努力\n会有人在尽头处等你',
  '工作很累\n生活很闷\n但是走过这些艰苦的日子\n迎接你的就是锦绣前程',
  'Calm your mind\n secretly become very strong',
  '心里装着希望\n全力以赴\n才能不负自己',
  '现在付出更多的努力\n未来才会有更多的选择',
];

//消息列表
List<MessageModel> messageList = List.generate(20, (index) {
  MessageModel model = MessageModel();
  model.imgUrl = videoMusicImageList[index%6];
  model.title = authorList[index%6];
  model.desc = index%2 == 0?'一条小团团赞了你的作品 · 6:12':'[发布了新作品] · 06-06';
  return model;
});