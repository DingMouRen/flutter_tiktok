import 'package:flutter/material.dart';
import 'package:flutter_tiktok/res/colors.dart';
///搜索页的搜索记录小部件
class SearchRecordWidget extends StatelessWidget {
  String title;
  SearchRecordWidget({Key key,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      padding: EdgeInsets.only(left: 16,right: 16),
      child: Row(
        children: [
          Image.asset('assets/images/record.webp',color: Colors.white,width: 20,height: 20,),
          SizedBox(width: 10,),
          Text(title,style: TextStyle(color: Colors.white,fontSize: 14),),
          Expanded(child: SizedBox()),
          Image.asset('assets/images/cross.webp',color: ColorRes.color_2,width: 15,height: 15,),
        ],
      ),
    );
  }
}
