import 'package:flutter/material.dart';
import 'package:flutter_tiktok/res/colors.dart';
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
      // color: Colors.red,
      height: 200,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: FlashButton(),
    );
  }
}

class FlashButton extends StatelessWidget{
  double size = 66;
  double borderWidth = 4;
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