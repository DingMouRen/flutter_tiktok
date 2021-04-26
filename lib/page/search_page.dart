import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tiktok/controller/search_page_controller.dart';
import 'package:flutter_tiktok/page/widget/search_brand_rank_widget.dart';
import 'package:flutter_tiktok/page/widget/search_hot_rank_widget.dart';
import 'package:flutter_tiktok/page/widget/search_living_rank_widget.dart';
import 'package:flutter_tiktok/page/widget/search_music_rank_widget.dart';
import 'package:flutter_tiktok/page/widget/search_ranking_bar_widget.dart';
import 'package:flutter_tiktok/page/widget/search_record_widget.dart';
import 'package:flutter_tiktok/page/widget/search_star_rank_widget.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';

import '../common/router_manager.dart';
///搜索页
class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  PageController _pageController = PageController();
  SearchPageController _searchPageController = Get.put(SearchPageController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_bottomBarLayout) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: ColorRes.color_1,
        statusBarIconBrightness: Brightness.dark,
      ));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.color_1,
      appBar: AppBar(
        title: _getAppBarLayout(),
        backgroundColor: ColorRes.color_1,
        elevation: 0,
        brightness: Brightness.dark,
        leading: IconButton(
          icon: ImageIcon(AssetImage('assets/images/scan.webp'),size: 20,),
          onPressed: (){
            Get.toNamed(Routers.scan);
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          _getSearchRecordLayout(),
          _getGuessLayout(),
          _getRankingBarLayout(),
          _getPageLayout(),
        ],
      ),
    );
  }
  //appbar
  _getAppBarLayout() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
                height: 30,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.white.withAlpha(50),
                ),
                child: Row(
                  children: [
                    Image.asset('assets/images/search.webp',width: 24,height: 24,color: Colors.grey,),
                    SizedBox(width: 5,),
                    Text('关晓彤cos女帝',style: TextStyle(fontSize: 14,color: Colors.grey),)
                  ],
                ),
              ),
          ),
          SizedBox(width: 10,),

          InkWell(
              onTap:(){
                Navigator.pop(context);
              },
              child: Text('取消',style: TextStyle(color: Colors.white,fontSize: 14),))

        ],
      ),
    );
  }
  ///搜索记录
  _getSearchRecordLayout() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SearchRecordWidget(title: 'Github 钉某人',),
          SearchRecordWidget(title: 'Flutter 钉某人',),
          SizedBox(height: 20,),
          Text('全部搜索记录',style: TextStyle(color: ColorRes.color_2,fontSize: 14),),
          SizedBox(height: 20,),
          Padding(padding:EdgeInsets.only(left: 16,right: 16),child: Divider(color: Colors.grey.withAlpha(100),height: 0.05,)),
        ],
      ),
    );
  }
  //猜你想搜
  _getGuessLayout() {
    List<String> guessList = [
      '大师姐健身',
      '短剧创作者扶持',
      '刘亦菲路演',
      '抖来跳舞',
      '蔡依林美杜莎',
      '李子柒中国风'
    ];
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(left: 16,right: 16),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                Text('猜你想搜',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                Expanded(child: SizedBox()),
                Text('换一换',style: TextStyle(color: ColorRes.color_2,fontSize: 14),),
                SizedBox(width: 5,),
                Image.asset('assets/images/exchange.webp',color: ColorRes.color_2,width: 18,height: 18,)
              ],
            ),
            SizedBox(height: 15,),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: guessList.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio:6,
              ),
              itemBuilder: (context,index){
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(guessList[index],style: TextStyle(color: Colors.white,fontSize: 16),),
                      SizedBox(width: 2,),
                      Image.asset(index%2 == 0?'assets/images/tag_hot.webp':'assets/images/tag_recomment.webp',
                        width: 18,
                        height: 18,
                      )
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 20,),
            Divider(color: Colors.grey.withAlpha(100),height: 0.05,),
           ],
        ),
      ),
    );
  }
  ///获取榜单的bar
  _getRankingBarLayout() {
    return SliverToBoxAdapter(
      child: SearchRankingBarWidget(
        onClick: (index){
          _pageController.animateToPage(index, duration: Duration(microseconds: 200), curve: Curves.linear);
        },
      ),
    );
  }
  ///获取排行榜
  _getPageLayout() {
    return SliverToBoxAdapter(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: PageView.builder(
            controller: _pageController,
            itemCount: 5,
            onPageChanged: (index){
              _searchPageController.setIndexSelectedRank(index);
            },
            itemBuilder: (context,index){
              switch(index){
                case 0:
                  return SearchHotRankWidget();
                case 1:
                  return SearchStarRankWidget();
                case 2:
                  return SearchLivingRankWidget();
                case 3:
                  return SearchMusicRankWidget();
                case 4:
                  return SearchBrandRankWidget();
                default:
                  return Container();
              }
            }),
      ),
    );
  }
}