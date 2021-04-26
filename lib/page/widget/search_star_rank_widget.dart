import 'package:flutter/material.dart';
import 'package:flutter_tiktok/model/star_model.dart';
import 'package:flutter_tiktok/net/api.dart';
import 'package:flutter_tiktok/res/colors.dart';
///搜索页：明星榜
class SearchStarRankWidget extends StatefulWidget {
  SearchStarRankWidget({Key key}) : super(key: key);

  @override
  _SearchStarRankWidgetState createState() {
    return _SearchStarRankWidgetState();
  }
}

class _SearchStarRankWidgetState extends State<SearchStarRankWidget> {
  List<StarModel> starRankList = [];
  @override
  void initState() {
    super.initState();
    starRankList.addAll(starList);
    starRankList.addAll(starList);
    starRankList.addAll(starList);
    starRankList.addAll(starList);
    starRankList.addAll(starList);
    starRankList.addAll(starList);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.color_1,
      body: Container(
        margin: EdgeInsets.only(left: 16,right: 16),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [Color.fromARGB(255, 31, 30, 38),Color.fromARGB(255, 31, 30, 38)]),
        ),
        child: ListView.builder(
            itemCount: starRankList.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
              return _getItemLayout(index,starRankList[index]);
            }),
      ),
    );
  }

  Widget _getItemLayout(int index,StarModel starModel) {
    double headerSize = 30;
    return Container(
      padding: EdgeInsets.only(top: 10,bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${index+1}',style: TextStyle(
              color: _getTextColor(index),
              fontWeight: FontWeight.bold,
              fontSize: 18,
          ),),
          SizedBox(width: 10,),
          Container(
            constraints: BoxConstraints(
              minHeight: headerSize,
              minWidth: headerSize,
              maxWidth: headerSize,
              maxHeight: headerSize
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(headerSize/2),
                image: DecorationImage(image: AssetImage(starModel.headerImg))
            ),
            alignment: Alignment.bottomRight,
            child: Image.asset('assets/images/auth.webp',width: headerSize/3,height: headerSize/3,)
          ),
          SizedBox(width: 10,),
          Text(starModel.name,style: TextStyle(color: Colors.white,fontSize: 14),),
          Expanded(child: SizedBox()),
          Text(starModel.influence,style: TextStyle(
              color: ColorRes.color_2,
              fontSize: 12
          ),)
        ],
      ),
    );
  }

  _getTextColor(int index) {
    if(index == 0 || index ==1 ||index == 2)return ColorRes.color_4;
    return ColorRes.color_2;
  }
}