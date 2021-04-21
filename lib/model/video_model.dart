
import 'comment_model.dart';
import 'user_model.dart';


///视频的数据模型
class VideoModel{
  String title;//视频标题
  String author;//视频作者
  String authorHeaderUrl;//作者头像
  String videoUrl;//视频地址
  bool favorite;//是否收藏
  bool like;//是否喜欢
  String likeNumber;//喜欢的数量
  List<CommentModel> commentList;//评论列表数据
  String shareNumber;//分享的数量
  String videoMusicName;//视频音乐的名称
  String videoMusicImage;//视频音乐的图片
  UserModel user;

}