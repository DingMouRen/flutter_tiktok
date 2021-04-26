import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tiktok/controller/message_page_controller.dart';
import 'package:flutter_tiktok/model/message_model.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';
///消息
class MessagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MessagePageState();
  }
}

class _MessagePageState extends State<MessagePage>{
  MessagePageController _pageController = Get.put(MessagePageController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_bottomBarLayout) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.color_1,
      appBar: AppBar(
        backgroundColor: ColorRes.color_1,
        title: Text('消息',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
        centerTitle: true,
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            alignment: Alignment.centerLeft,
            child: Text('创建群聊',style: TextStyle(fontSize: 14),),
          )
        ],
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          _getSearchLayout(),
          _getSliverList(),
        ],
      ),
    );
  }

  _getSearchLayout() {
    return SliverToBoxAdapter(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 35,
        margin: EdgeInsets.only(left: 16,right: 16,top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: Colors.white.withAlpha(20),
        ),
        child:  Row(
          children: [
            Image.asset('assets/images/search.webp',width: 22,height: 22,color: Colors.white,),
            SizedBox(width: 5,),
            Text('搜索',style: TextStyle(fontSize: 13,color: Colors.white),)
          ],
        ),
      ),
    );
  }

  _getSliverList() {
    return SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return _getItemLayout(_pageController.list[index]);
        },
          childCount: _pageController.list.length,
        ),
        itemExtent: 100
    );
  }

  _getItemLayout(MessageModel model) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: EdgeInsets.only(left: 16,right: 16),
      child: Stack(
        alignment: Alignment.center,
        fit:StackFit.expand ,
        children: [
          Positioned(
            left: 0,
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage(model.imgUrl))
              ),
            ),
          ),
          Positioned(
              left: 55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),),
                  SizedBox(height: 5,),
                  Text(model.desc,style: TextStyle(fontSize: 12,color: ColorRes.color_2),),
                ],
              ),
          ),
          Positioned(
              right: 0,
              child: Icon(Icons.arrow_forward_ios_outlined,color: ColorRes.color_2,size: 15,),
          ),
          Positioned(
              bottom: 0,
              child: Divider(color: Colors.white,height:1,)),
        ],
      ),
    );
  }
}
