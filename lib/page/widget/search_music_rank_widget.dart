import 'package:flutter/material.dart';
import 'package:flutter_tiktok/model/music_rank_model.dart';
import 'package:flutter_tiktok/net/api.dart';

import '../../res/colors.dart';
///搜索页：音乐榜
class SearchMusicRankWidget extends StatefulWidget {
  SearchMusicRankWidget({Key key}) : super(key: key);

  @override
  _SearchMusicRankWidgetState createState() {
    return _SearchMusicRankWidgetState();
  }
}

class _SearchMusicRankWidgetState extends State<SearchMusicRankWidget> {
  List<MusicRankModel> list = [];
  @override
  void initState() {
    super.initState();
    list.addAll(musicList);
    list.addAll(musicList);
    list.addAll(musicList);
    list.addAll(musicList);
    list.addAll(musicList);
    list.addAll(musicList);
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
            physics: NeverScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context,index){
              return _getItemLayout(index);
            }),
      ),
    );
  }

  Widget _getItemLayout(index) {
    MusicRankModel model = list[index];
    double headerSize = 30;
    return Container(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
              borderRadius: BorderRadius.circular(2),
              image: DecorationImage(image: AssetImage(model.img),fit:BoxFit.cover)
            ),
          ),
          SizedBox(width: 10,),
          Text(model.name,style: TextStyle(color: Colors.white,fontSize: 14),),

          Expanded(child: SizedBox()),
          Image.asset('assets/images/hot_stroke.webp',width: 16,height: 16,color: ColorRes.color_2,),
          Text(model.hot,style: TextStyle(
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