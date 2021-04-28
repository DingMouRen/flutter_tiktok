import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:get/get.dart';

import '../common/router_manager.dart';

///扫描页
class ScanPage extends StatefulWidget {
  ScanPage({Key key}) : super(key: key);

  @override
  _ScanPageState createState() {
    return _ScanPageState();
  }
}

class _ScanPageState extends State<ScanPage> with TickerProviderStateMixin{
  CameraController _cameraController;
  List<CameraDescription> _cameras;
  AnimationController _animationControllerScan;
  Animation _animationScan;
  double widthMask = 250;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_bottomBarLayout) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ));
    });
    _initCamera();
    _animationControllerScan = AnimationController(duration:Duration(seconds: 4),vsync: this);
    _animationScan = Tween<AlignmentGeometry>(
        begin: Alignment(0.0, -1.2),
        end:  Alignment(0.0, 1.1)
    ).animate(_animationControllerScan);
    _animationControllerScan.forward();
    _animationScan.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _animationControllerScan.repeat();
      }
    });

  }

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.max);
    _cameraController.initialize().then((value) {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {


    if (null == _cameraController || !_cameraController.value.isInitialized) {
      return Center(
        child: SizedBox(
          width: 50,
          height: 50,
          
        ),
      );
    }
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        minWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
        minHeight: MediaQuery.of(context).size.height,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          children: [
            _getCameraPreview(),
            _getMaskLayout(),
            _getAppBarLayout(),
            _getBottomButton(),
          ],
        ),
      ),
    );
  }

  _getCameraPreview() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double cameraWidth = _cameraController.value.previewSize.width;
    double cameraHeight = _cameraController.value.previewSize.height;
    double scale = height / cameraHeight;
    return Transform.scale(
      scale: scale,
      alignment: Alignment.topCenter,
      child: CameraPreview(_cameraController),
    );
  }

  _getAppBarLayout() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          '扫一扫',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              statusBarColor: ColorRes.color_1,
              statusBarIconBrightness: Brightness.dark,
            ));
          },
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              '相册',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
  //获取遮盖层视图
  _getMaskLayout() {

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          minWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
          minHeight: MediaQuery.of(context).size.height,
        ),

        child: Stack(
          children: [
            Container(
              width:MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.black.withAlpha(150),)),
                  Container(
                    width: widthMask,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Expanded(child: Container(color: Colors.black.withAlpha(150),)),
                         Container(width: widthMask,height: widthMask,color: Colors.transparent,child: _getScanWidget(),),
                        Expanded(
                            child: Container(
                              width: widthMask,
                              color: Colors.black.withAlpha(150),
                              child: Column(
                                children: [
                                  SizedBox(height: 20,),
                                  Text("将二维码/条形码放入框内，即可自动扫描",style: TextStyle(color: Colors.white,fontSize: 13),)
                                ],
                              ),)),
                      ],
                    ),
                  ),
                  Expanded(child: Container(color: Colors.black.withAlpha(150),)),
                ],
              ),
            ),


          ],
        )

      ),
    );
  }
  _getScanWidget() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AlignTransition(
            alignment: _animationScan,
            child: Image.asset('assets/images/scan_line.png',height: 60,)),
        Positioned(left:0,top: 0,child: Image.asset('assets/images/scan_left_top.webp',width: 20,height: 20,)),
        Positioned(left:0,bottom: 0,child: Image.asset('assets/images/scan_left_bottom.webp',width: 20,height: 20,)),
        Positioned(right:0,bottom: 0,child: Image.asset('assets/images/scan_right_bottom.webp',width: 20,height: 20,)),
        Positioned(right:0,top: 0,child: Image.asset('assets/images/scan_right_top.webp',width: 20,height: 20,)),
        Positioned(bottom:20,child: Column(
          children: [
            Image.asset('assets/images/flashlight.png',width: 40,height: 40,),
            SizedBox(height: 10,),
            Text("轻触照亮",style: TextStyle(color: Colors.white,fontSize: 12),)
          ],
        ))
      ],
    );
  }

  _getBottomButton() {
    return Positioned(
      bottom: 20,
        child: InkWell(
          onTap: (){
            Get.toNamed(Routers.tikTokCode);
          },
          child: Column(
          children: [
            Image.asset('assets/images/tiktok_code.webp',width: 60,height: 60,),
            Text("我的抖音码",style: TextStyle(color: Colors.white,fontSize: 14),)
          ],
    ),
        ));
  }
}
