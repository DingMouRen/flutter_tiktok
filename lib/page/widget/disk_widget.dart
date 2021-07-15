import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_tiktok/model/response/feed_list_response.dart';
import 'package:flutter_tiktok/util/constants.dart';
import 'package:flutter_tiktok/util/screen_utils.dart';


/// Rotating vinyl disk with notes go out from its bottom
class VinylDisk extends StatefulWidget {
  FeedListList video;

  VinylDisk({this.video});

  @override
  _VinylDiskState createState() => _VinylDiskState();
}

class _VinylDiskState extends State<VinylDisk> with TickerProviderStateMixin {
  AnimationController _noteOpacityController;
  Animation<double> _noteOpacityAnimation;
  AnimationController _noteAndDiskController;
  Animation<double> _noteAndDiskAnimation;
  AnimationController _noteRotationController;
  Animation<double> _noteRotationAnimation;
  Tween<double> _noteRotationTween;
  final Random _random = Random();
  Path _path;

  int _pathIndex = 0;
  final int _pathsQuantity = 4;

  final _vinylGradient = LinearGradient(
      colors: [
        Colors.grey[800],
        Colors.grey[900],
        Colors.grey[900],
        Colors.grey[800],
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topLeft,
      stops: [0.2, 0.6, 0.8, 1.0]);

  _drawPath({int quantity, int divider}) {
    final xOffset = screenAwareWidth(15.0, context);
    final yOffset = screenAwareHeight(15.0, context);
    var size = Size(
      screenAwareWidth(kVinylDiskContainerWidth, context),
      screenAwareHeight(kVinylDiskContainerHeight, context),
    );
    var path = Path();
    for (var i = 0; i <= quantity; i++) {
      var subPath = Path();
      subPath.moveTo(
          size.width - screenAwareWidth(kVinylDiskWidth, context) / 2,
          size.height -
              (size.height - screenAwareHeight(kVinylDiskHeight, context)) / 2);
      subPath.cubicTo(
          size.width / 4,
          size.height,
          size.width / 5,
          size.height / 2,
          i <= divider ? i * xOffset : 0,
          i <= divider ? 0 : (i - divider) * yOffset);
      path.addPath(subPath, Offset.zero);
    }
    return path;
  }

  /// Calculates position on a sub path got at [_pathIndex]
  /// [value] should come from [Animation] or [AnimationController]
  /// instance.
  Offset _calculatePosition(double value) {
    var pathMetrics = _path.computeMetrics();
    var pathMetric = pathMetrics.elementAt(_pathIndex);
    value = pathMetric.length * value;
    var pos = pathMetric.getTangentForOffset(value);
    return pos.position;
  }

  @override
  void initState() {
    super.initState();
    _noteOpacityController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2200),
    );
    _noteOpacityAnimation = CurvedAnimation(
      parent: _noteOpacityController,
      curve: Curves.decelerate,
    );

    _noteRotationController = AnimationController(
        duration: Duration(milliseconds: 1000 ), vsync: this);
    _noteRotationTween = Tween(begin: -.05, end: .05);
    _noteRotationAnimation =
        _noteRotationTween.animate(_noteRotationController);

    _noteAndDiskController = AnimationController(
        duration: Duration(milliseconds: 1000 * 2), vsync: this);
    _noteAndDiskAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_noteAndDiskController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _pathIndex = _random.nextInt(_pathsQuantity);
              _noteRotationTween.begin = -_random.nextInt(_pathsQuantity) / 100;
              _noteRotationTween.end = _random.nextInt(_pathsQuantity) / 100;
              _noteAndDiskController.reset();
              _noteAndDiskController.forward();

              _noteOpacityController.reset();
              _noteOpacityController.reverse(from: 1.0);
            }
          });
    _noteAndDiskController.forward();
    _noteOpacityController.reverse(from: 1.0);
    _noteRotationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _noteAndDiskController.dispose();
    _noteRotationController.dispose();
    _noteOpacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _path = _drawPath(quantity: _pathsQuantity, divider: 1);
    return Container(
      width: screenAwareWidth(kVinylDiskContainerWidth, context),
      height: screenAwareHeight(kVinylDiskContainerHeight, context),
      child: Stack(children: [
        /// Uncomment to see trajectories
        // Positioned(
        //   child: CustomPaint(
        //     painter: PathPainter(path: _path),
        //   ),
        // ),
        AnimatedBuilder(
          animation: _noteAndDiskAnimation,
          builder: (_, child) => Positioned(
            top: _calculatePosition(_noteAndDiskAnimation.value).dy - kVinylDiskHeight / 3,
            left: _calculatePosition(_noteAndDiskAnimation.value).dx,
            child: RotationTransition(
              turns: _noteRotationAnimation,
              child: FadeTransition(
                opacity: _noteOpacityAnimation,
                child: Icon(Icons.music_note,
                    color: Colors.grey[200], size: _noteAndDiskAnimation.value * 25),
              ),
            ),
          ),
        ),
        Positioned(
          top: screenAwareHeight(
              kVinylDiskContainerHeight / 2 - kVinylDiskHeight / 2, context),
          right: 0,
          child: RotationTransition(
            turns: _noteAndDiskAnimation,
            child: Container(
              padding: EdgeInsets.all(12.0),
              width: screenAwareWidth(kVinylDiskWidth, context),
              height: screenAwareHeight(kVinylDiskHeight, context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: _vinylGradient,
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(image: NetworkImage(widget.video.user.portrait),fit: BoxFit.cover),
                ),
              ),),
            ),
          ),
      ]),
    );
  }
  //网络图片
  _getImage() {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          image: DecorationImage(image: imageProvider),
        ),
      ),
      fit: BoxFit.fitWidth,
      imageUrl: 'assets/images/header_holder.jpg',
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}

/// Simple custom painter
class PathPainter extends CustomPainter {
  /// Path to draw on the canvas
  Path path;

  /// Takes path created in [_VinylDiskState]
  PathPainter({this.path});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke
      ..color = Colors.red;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
