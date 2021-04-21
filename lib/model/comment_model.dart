///评论的数据模型
class CommentModel{
  String commenterName;//评论者的名字
  String commenterHeaderUrl;//评论者的头像
  String commentContent;//评论内容
  bool commentLike;//评论是否点赞
  double commentLikeNumber;//评论点赞数量
  String dateTime;//时间

  CommentModel(this.commenterName, this.commenterHeaderUrl, this.commentContent,
      this.commentLike, this.commentLikeNumber, this.dateTime);

}