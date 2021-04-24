import 'package:flutter/material.dart';
import 'package:flutter_tiktok/page/widget/shoot_bottom_bar_kind_widget.dart';
import 'package:flutter_tiktok/page/widget/shoot_bottom_bar_widget.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:oktoast/oktoast.dart';
//拍摄页底部布局
class ShootBottomWidget extends StatefulWidget {
  ShootBottomWidget({Key key}) : super(key: key);

  @override
  _ShootBottomWidgetState createState() {
    return _ShootBottomWidgetState();
  }
}

class _ShootBottomWidgetState extends State<ShootBottomWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Column(
        children: [
          ShootBottomBarKindWidget(
            width: 200,
            height: 50,
            list: ['照片','视频','游戏','文字'],
            initialItem: 1,
            onSelected: (index){
            },
          ),
          FlashButton(size: 70,),
           SizedBox(height: 20,),
           ShootBottomBarWidget(
                width: MediaQuery.of(context).size.width,
                height: 60,
                list: ['分段拍','快拍','影集'],
                initialItem: 1,
                onSelected: (index){
                  print('index:$index');
            },
              ),
        ],
      ),
    );
  }
}

class FlashButton extends StatelessWidget{
  double size = 66;
  double borderWidth = 4;

  FlashButton({this.size});

  @override
  Widget build(BuildContext context) {
    double innerSize = size - borderWidth*2 -4;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        border: Border.fromBorderSide(BorderSide(color: Colors.white,width: borderWidth)),
      ),
      alignment: Alignment.center,
      child: Container(
        width: innerSize,
        height: innerSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(innerSize/2),
          color: ColorRes.color_3,
        ),
        child: Image.asset('assets/images/flash.png',width: 5,height: 5,),
      ),
    );
  }

}