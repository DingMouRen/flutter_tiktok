import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

/// 视频手势封装
/// 单击：暂停
/// 连击：点赞
class LikeGestureWidget extends StatefulWidget {
  const LikeGestureWidget({
    Key key,
    @required this.child,
    this.onAddFavorite,
    this.onSingleTap,
  }) : super(key: key);

  final Function onAddFavorite;
  final Function onSingleTap;
  final Widget child;

  @override
  _LikeGestureWidgetState createState() => _LikeGestureWidgetState();
}

class _LikeGestureWidgetState extends State<LikeGestureWidget> {
  GlobalKey _key = GlobalKey();
  List<Offset> icons = [];
  int lastMilliSeconds = -1;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      key: _key,
      onTapDown: (detail) {

        setState(() {
          int currentMilliSeconds = DateTime.now().millisecondsSinceEpoch;
          int diff = currentMilliSeconds - lastMilliSeconds;
          if(diff < 500){
            icons.add(_convertPosition(detail.globalPosition));
            widget.onAddFavorite?.call();
          }else{
            widget.onSingleTap?.call();
          }
        });
      },
      onTapUp: (detail) {
        lastMilliSeconds = DateTime.now().millisecondsSinceEpoch;
      },

      child: Stack(
        children: <Widget>[
          widget.child,
          _getIconStack(),
        ],
      ),
    );
  }

  // 内部转换坐标点
  Offset _convertPosition(Offset p) {
    RenderBox getBox = _key.currentContext.findRenderObject();
    return getBox.globalToLocal(p);
  }

  _getIconStack() {
    return Stack(
      children: icons.map<Widget>(
            (position) => TikTokFavoriteAnimationIcon(
          key: Key(position.toString()),
          position: position,
          onAnimationComplete: () {
            icons.remove(position);
          },
        ),
      ).toList(),
    );
  }
}

class TikTokFavoriteAnimationIcon extends StatefulWidget {
  final Offset position;
  final double size;
  final Function onAnimationComplete;

  const TikTokFavoriteAnimationIcon({
    Key key,
    this.onAnimationComplete,
    this.position,
    this.size: 200,
  }) : super(key: key);

  @override
  _TikTokFavoriteAnimationIconState createState() =>
      _TikTokFavoriteAnimationIconState();
}

class _TikTokFavoriteAnimationIconState
    extends State<TikTokFavoriteAnimationIcon> with TickerProviderStateMixin {

  AnimationController _animationController;

  double rotate = pi / 10.0 * (2 * Random().nextDouble() - 1);

  double appearDuration = 0.1;

  double dismissDuration = 0.8;

  @override
  void initState() {
    _animationController = AnimationController(
      lowerBound: 0,
      upperBound: 1,
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _animationController.addListener(() {
      setState(() {});
    });
    startAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  //开始动画
  startAnimation() async {
    await _animationController.forward();
    widget.onAnimationComplete?.call();
  }


  @override
  Widget build(BuildContext context) {
    return widget.position == null
        ? Container()
        : Positioned(
            left: widget.position.dx - widget.size /2,
            top: widget.position.dy - widget.size ,
            child: _getBody(),
          );
  }


  //获取动画的值
  double get value => _animationController?.value;

  double get opacity {
    if (value < appearDuration) {
      return 0.9 / appearDuration * value;
    }
    if (value < dismissDuration) {
      return 0.9;
    }
    var res = 0.9 - (value - dismissDuration) / (1 - dismissDuration);
    return res < 0 ? 0 : res;

  }

  double get scale {
    if(value <= 0.5){
      return  0.6+value / 0.5 * 0.5;
    }else if(value<=0.8){
      return 1.1 * (1/1.1 + (1.1 -1)/1.1 * (value - 0.8) / 0.25);
    }else {
      return 1 + (value - 0.8)/0.2 * 0.5;
    }
  }



  _getBody() {
    return Transform.rotate(
      angle: rotate,
      child: Opacity(
        opacity: opacity,
        child: Transform.scale(
          alignment: Alignment.bottomCenter,
          scale: scale,
          child: _getContent(),
        ),
      ),
    );
  }

  _getContent() {
    return ShaderMask(
      child: _getChild(),
      blendMode: BlendMode.srcATop,
      shaderCallback: (Rect bounds) => RadialGradient(
        center: Alignment.topLeft.add(Alignment(0.5, 0.5)),
        colors: [
          Color(0xffEF6F6F),
          Color(0xffF03E3E),
        ],
      ).createShader(bounds),
    );
  }

  _getChild() {
    return Image.asset('assets/images/red_heart.webp',width: widget.size,height: widget.size,);
  }
}
