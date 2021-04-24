import 'package:flutter/material.dart';
import 'package:flutter_tiktok/controller/search_page_controller.dart';
import 'package:flutter_tiktok/page/widget/gradient_text.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';
///搜索页排行榜的头部bar
class SearchRankingBarWidget extends StatefulWidget {
  ValueChanged<int> onClick;
  SearchRankingBarWidget({Key key,this.onClick}) : super(key: key);

  @override
  _SearchRankingBarWidgetState createState() {
    return _SearchRankingBarWidgetState();
  }
}

class _SearchRankingBarWidgetState extends State<SearchRankingBarWidget> {
  SearchPageController _searchPageController = Get.find();
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
    return Obx(()=>Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 16,right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            splashColor:Colors.transparent,
            onTap: (){
              setState(() {
                _searchPageController.setIndexSelectedRank(0);
                widget.onClick(0);
              });
            },
            child: GradientText(
              '抖音热榜',
              gradient: _searchPageController.indexSelectedRank.value == 0?LinearGradient(colors: [Color.fromARGB(255, 237, 157, 88), Color.fromARGB(255, 243, 70, 107),])
                  :LinearGradient(colors: [ColorRes.color_2,ColorRes.color_2]),
              style: TextStyle(
                color: _searchPageController.indexSelectedRank.value == 0?Colors.white:ColorRes.color_2,
                fontWeight: _searchPageController.indexSelectedRank.value == 0?FontWeight.bold:FontWeight.normal,
                fontSize: _searchPageController.indexSelectedRank.value == 0?18:16
              ),
            ),
          ),

          InkWell(
          splashColor:Colors.transparent,
            onTap: (){
              setState(() {
                _searchPageController.setIndexSelectedRank(1);
                widget.onClick(1);
              });
            },
            child: Text(
              '明星榜',
              style: TextStyle(
                  color: _searchPageController.indexSelectedRank.value == 1?Colors.white:ColorRes.color_2,
                  fontWeight: _searchPageController.indexSelectedRank.value == 1?FontWeight.bold:FontWeight.normal,
                  fontSize: _searchPageController.indexSelectedRank.value == 1?18:16
              ),
            ),
          ),

          InkWell(
            splashColor:Colors.transparent,
            onTap: (){
              setState(() {
                _searchPageController.setIndexSelectedRank(2);
                widget.onClick(2);
              });
            },
            child: Text(
              '直播榜',
              style: TextStyle(
                  color: _searchPageController.indexSelectedRank.value == 2?Colors.white:ColorRes.color_2,
                  fontWeight: _searchPageController.indexSelectedRank.value == 2?FontWeight.bold:FontWeight.normal,
                  fontSize: _searchPageController.indexSelectedRank.value == 2?18:16
              ),
            ),
          ),

          InkWell(
            splashColor:Colors.transparent,
            onTap: (){
              setState(() {
                _searchPageController.setIndexSelectedRank(3);
                widget.onClick(3);
              });
            },
            child: Text(
              '音乐榜',
              style: TextStyle(
                  color: _searchPageController.indexSelectedRank.value == 3?Colors.white:ColorRes.color_2,
                  fontWeight: _searchPageController.indexSelectedRank.value == 3?FontWeight.bold:FontWeight.normal,
                  fontSize: _searchPageController.indexSelectedRank.value == 3?18:16
              ),
            ),
          ),

          InkWell(
            splashColor:Colors.transparent,
            onTap: (){
              setState(() {
                _searchPageController.setIndexSelectedRank(4);
                widget.onClick(4);
              });
            },
            child: Text(
              '品牌榜',
              style: TextStyle(
                  color: _searchPageController.indexSelectedRank.value == 4?Colors.white:ColorRes.color_2,
                  fontWeight: _searchPageController.indexSelectedRank.value == 4?FontWeight.bold:FontWeight.normal,
                  fontSize: _searchPageController.indexSelectedRank.value == 4?18:16
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}