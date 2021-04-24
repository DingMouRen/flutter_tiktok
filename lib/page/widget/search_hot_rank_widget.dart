import 'package:flutter/material.dart';
import 'package:flutter_tiktok/res/colors.dart';
///搜索页：抖音热榜
class SearchHotRankWidget extends StatefulWidget {
  SearchHotRankWidget({Key key}) : super(key: key);

  @override
  _SearchHotRankWidgetState createState() {
    return _SearchHotRankWidgetState();
  }
}

class _SearchHotRankWidgetState extends State<SearchHotRankWidget> {
  List<String> hotList = [];
  @override
  void initState() {
    super.initState();
    List<String> list = [
      '张艺兴套路导演组',
      '进村的野生东北虎被控制',
      '王毅称民主不是可口可乐',
      '总有一场相遇是相互喜欢',
      '米桃懂事得让人心疼',
      '丁真李子柒再同框'
    ];
    hotList.addAll(list);
    hotList.addAll(list);
    hotList.addAll(list);
    hotList.addAll(list);
    hotList.addAll(list);
    hotList.addAll(list);
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
          gradient: LinearGradient(colors: [Color.fromARGB(255, 31, 30, 38),Color.fromARGB(255, 52, 31, 40)]),
        ),
        child: ListView.builder(
            itemCount: hotList.length,
            itemBuilder: (context,index){
              return _getItemLayout(index);
            }),
      ),
    );
  }

  Widget _getItemLayout(index) {
    return Container(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset('assets/images/tag_bg.webp',color: _getTagBagColor(index),width: 40,height: 40,),
              Positioned(
                left: 16,
                top: 13,
                child: Text('${index+1}',style: TextStyle(
                  color: _getTextColor(index),
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),),
              )
            ],
          ),
          SizedBox(width: 5,),
          Text(hotList[index],style: TextStyle(color: Colors.white,fontSize: 16),),
          SizedBox(width: 2,),
          Image.asset(index%2 == 0?'assets/images/tag_hot.webp':'assets/images/tag_recomment.webp',
            width: 18,
            height: 18,
          ),
          Expanded(child: SizedBox()),
          Image.asset('assets/images/hot_stroke.webp',width: 16,height: 16,color: ColorRes.color_2,),
          Text('1666.6w',style: TextStyle(
            color: ColorRes.color_2,
            fontSize: 14
          ),)
        ],
      ),
    );
  }
  //获取文字下图片的颜色
  _getTagBagColor(index) {
    if(index == 0) return Color.fromARGB(255, 244 , 176, 22);
    if(index == 1) return Color.fromARGB(255, 143, 140, 151);
    if(index == 2) return Color.fromARGB(255, 201, 105, 85);
    return Colors.transparent;
  }
  //获取文字颜色
  _getTextColor(index) {
    if(index == 0) return Color.fromARGB(255, 189 , 75, 13);
    if(index == 1) return Color.fromARGB(255, 80, 79, 90);
    if(index == 2) return Color.fromARGB(255, 177, 57, 40);
    return ColorRes.color_2;
  }
}