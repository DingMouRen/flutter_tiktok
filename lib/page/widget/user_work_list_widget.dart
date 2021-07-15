import 'package:flutter/material.dart';
import 'package:flutter_tiktok/controller/user_controller.dart';
import 'package:flutter_tiktok/model/response/user_work_list_response.dart';
import 'package:flutter_tiktok/page/widget/user_item_grid_widget.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';

class UserWorkListWidget extends StatefulWidget {
  UserWorkListWidget({Key key}) : super(key: key);

  @override
  _UserWorkListWidgetState createState() {
    return _UserWorkListWidgetState();
  }
}

class _UserWorkListWidgetState extends State<UserWorkListWidget> {
  UserController _userController = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.color_1,
      body: _getBody(context),
    );
  }

  _getBody(BuildContext context) {
    List<UserWorkListList> workList = _userController.userWorkList.value;
    if(null == workList || workList.length == 0){
      return Container();
    }else{
      return Container(
        child: GridView.builder(
          //处理GridView顶部空白
          padding: EdgeInsets.zero,
          itemCount: workList.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
              crossAxisCount: 3,
              //纵轴间距
              mainAxisSpacing: 1,
              //横轴间距
              crossAxisSpacing: 1,
              //子组件宽高长度比例
              childAspectRatio: 9/16),
          itemBuilder: (BuildContext context, int index) {
            return UserItemGridWidget(
              url: workList[index].content.attachments[0].cover,
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => VideoListPage(videoList: _userModel.worksVideo,)));
              },
            );
          },
        ),
      );
    }
  }
}