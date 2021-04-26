import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tiktok/page/widget/living_page_widget.dart';
//直播页
class LivingPage extends StatefulWidget {
  LivingPage({Key key}) : super(key: key);

  @override
  _LivingPageState createState() {
    return _LivingPageState();
  }
}

class _LivingPageState extends State<LivingPage> {
  PageController _pageController = PageController(keepPage: true);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_bottomBarLayout) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
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
      body: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: PageView.builder(
          controller: _pageController,
            itemCount: 10,
            scrollDirection:Axis.vertical,
            itemBuilder: (context,index){
              return LivingPageWidget(
                onClosed: (){
                  Navigator.pop(context);
                },
              );
            }),
      ),
    );
  }
}