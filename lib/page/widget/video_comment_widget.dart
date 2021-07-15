import 'package:flutter/material.dart';

import '../../model/comment_model.dart';
import '../../util/screen_utils.dart';
import '../../util/screen_utils.dart';
import 'package:get/get.dart';
///视频评论部件
class VideoCommentWidget extends StatefulWidget {
  List<CommentModel> commentList;
  VideoCommentWidget({Key key,@required this.commentList}) : super(key: key);

  @override
  _VideoCommentWidgetState createState() {
    return _VideoCommentWidgetState();
  }
}

class _VideoCommentWidgetState extends State<VideoCommentWidget> {


  @override
  Widget build(BuildContext context) {
    return  Container(
        constraints: BoxConstraints(
          minHeight: 90, //设置最小高度（必要）
          maxHeight: MediaQuery.of(context).size.height /5 * 4, //设置最大高度（必要）
        ),
      child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _getHeaderLayout(),
                Expanded(
                  child:ListView.builder(
                      shrinkWrap:true,
                      itemCount: widget.commentList.length,
                      itemBuilder: (context,index){
                        return _getItemComment(widget.commentList[index]);
                      }
                  ),
                ),
               _getBottomLayout(),
              ],
      ),
    );
  }
  //头部布局
  _getHeaderLayout() {
    return Container(
      height: 60,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 10,
            child: Text('${widget.commentList.length}条评论',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11.5),),
          ),
          Positioned(
            top: 10,right: 10,
              child: InkWell(
                onTap: (){
                  Get.back();
                },
                  child: Image.asset('assets/images/cross.webp',color: Colors.grey,width: 20,height: 20,)))
        ],
      ),
    );
  }

  //获取评论
  _getItemComment(CommentModel commentModel) {
    return Container(
      width:screenWidth(context),
      margin: EdgeInsets.only(left: 10,right: 10,bottom: 15),
      child: Row(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(commentModel.commenterHeaderUrl),
          ),
          SizedBox(width: 10,),
          Expanded(child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Text(commentModel.commenterName,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
              SizedBox(height: 5,),
              Text(commentModel.commentContent,style: TextStyle(fontSize: 14),),
              SizedBox(height: 5,),
              Row(
                children: [
                  Text(commentModel.dateTime,style: TextStyle(color: Colors.grey[400],fontSize: 12)),
                  SizedBox(width: 5,),
                  Text('回复',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.grey),),
                ],
              )
            ],
          )),
          SizedBox(width: 10,),
          Column(
            children: [
              Icon(Icons.favorite_rounded,color: Colors.grey,size: 20,),
              Text(commentModel.commentLikeNumber.toInt().toString(),style: TextStyle(fontSize: 12,color: Colors.grey),),
            ],
          ),
        ],
      ),
    );
  }

  _getBottomLayout() {
    return  Container(
      height: 60,
      child:  Column(
          children: [
            Divider(color: Colors.grey[300],height: 0.5,),
            Row(
              children: [
                Expanded(child: Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(top: 6,bottom: 10,left: 10),
                  margin: EdgeInsets.only(left: 10,right: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[100]
                  ),
                  child: Text('留下你的精彩评论吧',style: TextStyle(color: Colors.grey,),),
                )),
                Image.asset('assets/images/at.webp',color: Colors.grey[600],width: 25,height: 25,),
                Image.asset('assets/images/smile.webp',color: Colors.grey[600],width: 43,height: 43),
              ],
            ),
          ],
        ),
    );
  }
}