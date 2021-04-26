import 'package:flutter/material.dart';
import 'package:flutter_tiktok/model/living_rank_model.dart';
import 'package:flutter_tiktok/net/api.dart';
import 'package:flutter_tiktok/res/colors.dart';
///搜索页：直播榜
class SearchLivingRankWidget extends StatefulWidget {
  SearchLivingRankWidget({Key key}) : super(key: key);

  @override
  _SearchLivingRankWidgetState createState() {
    return _SearchLivingRankWidgetState();
  }
}

class _SearchLivingRankWidgetState extends State<SearchLivingRankWidget> {
  List<LivingRankModel> livingRankList = [];
  @override
  void initState() {
    super.initState();
    livingRankList.addAll(livingList);
    livingRankList.addAll(livingList);
    livingRankList.addAll(livingList);
    livingRankList.addAll(livingList);
    livingRankList.addAll(livingList);
    livingRankList.addAll(livingList);
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
            itemCount: livingRankList.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
              return _getItemLayout(index,livingRankList[index]);
            }),
      ),
    );
  }

  Widget _getItemLayout(int index,LivingRankModel model) {
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
                  image: DecorationImage(image: AssetImage(model.headerImg)),
                  border: Border.fromBorderSide(BorderSide(color: ColorRes.color_3,width: 1)),
              ),
          ),
          SizedBox(width: 10,),
          Text(model.name,style: TextStyle(color: Colors.white,fontSize: 14),),
          Expanded(child: SizedBox()),
          Text(model.popularity,style: TextStyle(
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