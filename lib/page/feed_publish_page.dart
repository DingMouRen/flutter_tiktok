import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tiktok/controller/feed_controller.dart';
import 'package:flutter_tiktok/controller/upload_controller.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:flutter_tiktok/util/camera_util.dart';
import 'package:flutter_tiktok/util/video_util.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
///发布视频页面
class FeedPublishPage extends StatefulWidget {
  FeedPublishPage({Key key,}) : super(key: key);

  @override
  _FeedPublishPageState createState() {
    return _FeedPublishPageState();
  }
}

class _FeedPublishPageState extends State<FeedPublishPage> {

  String videoFilePath;
  File videoFile;
  String coverPath;
  AppBar _appBar;
  TextEditingController _editingController = TextEditingController();
  UploadController _uploadController = Get.put(UploadController());
  FeedController _feedController = Get.put(FeedController());

  @override
  void initState() {
    super.initState();
    videoFilePath = Get.parameters['videoPath'];
    videoFile = File(videoFilePath);
    _getCoverImgPath();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context)  {
    _appBar = _getAppBar(context);

    return Scaffold(
      backgroundColor: ColorRes.color_1,
      appBar: _appBar,
      body:_getBody(context),

    );
  }

   _getCoverImgPath() async{
     await VideoThumbnail.thumbnailFile(
        video: videoFilePath,
       quality: 100
    ).then((value) {

       setState(() {
         coverPath = value;
       });
     });
  }

  _getBody(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
          minHeight: MediaQuery.of(context).size.height - kToolbarHeight,
      ),
      child: Stack(
        children: [
          _topLayout(context),
          _bottomLayout(context),
        ],
      ),
    );
  }

  _topLayout(BuildContext context) {
    return  Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex:4,
                  child: Container(
                    height: 180,
                    child: TextField(
                      controller: _editingController,
                      cursorColor: ColorRes.color_3,
                      maxLines: 12,
                      minLines: 1,
                      style: TextStyle( color: Colors.white),//文字大小、颜色
                      decoration: InputDecoration(
                        fillColor:ColorRes.color_1,
                        filled: true,
                          hintText: '请输入标题',
                        hintStyle:TextStyle(color: Colors.white),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        isDense: true,
                        border: InputBorder.none,
                      ),
                    ),
                  )
              ),
              Expanded(
                  flex:2,
                  child: Container(
                    height: 180,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        null == coverPath?Container():Image.file(File(coverPath),fit: BoxFit.fill,),
                        Positioned(
                            bottom:0,
                            child: Container(
                              width: 200,
                            color: Colors.grey.withAlpha(200),
                            alignment: Alignment.center,
                            height: 28,
                            child: Text('封面',style: TextStyle(color: Colors.white),),
                        ))
                      ],
                    ),
                  )
              ),
            ],
        );
  }

  _bottomLayout(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: InkWell(
          onTap: ()async{
             VideoPlayerValue videoValue = await VideoUtil.getVideoValue(videoFile);

             print('发布视频时长:${videoValue.duration.inSeconds}  width:${videoValue.size.width}  height:${videoValue.size.height}');
             bool videoUpload = await _uploadController.uploadSingleFile('mp4', videoFile);
             String videoUrl = _uploadController.uploadResponse.tokens[0].effectUrl;
             print('发布视频：$videoUpload 地址:$videoUrl');
             bool imgUpload =  await _uploadController.uploadSingleFile(CameraUtil.getImgSuffix(coverPath), File(coverPath));
             String coverUrl = _uploadController.uploadResponse.tokens[0].effectUrl;
             print('发布封面图：$imgUpload 地址:$coverUrl');
             _feedController.publishFeed(_editingController.text,
                 videoUrl,
                 coverUrl,
                 videoValue.duration.inSeconds.toInt(),
                 videoValue.size.width.toInt(),
                 videoValue.size.height.toInt()
             );
          },
          child: Container(
            height: 60,
             decoration: BoxDecoration(
               color: ColorRes.color_3,
               borderRadius: BorderRadius.circular(5)
             ),
            alignment: Alignment.center,
            child: Text('发布',style: TextStyle(color: Colors.white,fontSize: 18),),
          ),
        )
    );
  }

  AppBar _getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: ColorRes.color_1,
      title: Text('发布',style: TextStyle(color: Colors.white),),
      centerTitle: true,
    );
  }


}