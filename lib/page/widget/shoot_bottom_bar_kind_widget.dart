import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShootBottomBarKindWidget extends StatefulWidget {
  double width;
  double height;
  List<String> list;
  int initialItem = 0;
  ValueChanged<int> onSelected;

  ShootBottomBarKindWidget(
      {this.width, this.height, this.list, this.initialItem, this.onSelected});

  @override
  State<StatefulWidget> createState() {
    return _ShootBottomBarKindWidgetState();
  }
}

class _ShootBottomBarKindWidgetState
    extends State<ShootBottomBarKindWidget> {
  FixedExtentScrollController _scrollController;
  int _selectedIndex = 0;
  double _selectedBgHeight;

  @override
  void initState() {
    super.initState();
    _scrollController =
        FixedExtentScrollController(initialItem: widget.initialItem);
    _selectedIndex = widget.initialItem;
    _selectedBgHeight = widget.height / 2;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: widget.height,
          height: _selectedBgHeight,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(_selectedBgHeight/2)
          ),
        ),
        Container(
          width: widget.width,
          height: widget.height,
          child: Center(
            child: RotatedBox(
              quarterTurns: -1,
              child: NotificationListener(
                child: ListWheelScrollView(
                  controller: _scrollController,
                  physics: FixedExtentScrollPhysics(),
                  diameterRatio: 100,
                  children: List.generate(
                    widget.list.length,
                        (index) => RotatedBox(
                        quarterTurns: 1, child: _getItemLayout(index)),
                  ),
                  itemExtent: widget.height,
                ),
                onNotification: (scroll) {
                  if (scroll is UserScrollNotification &&
                      scroll.direction == ScrollDirection.idle) {
                    setState(() {
                      _selectedIndex = _scrollController.selectedItem;
                      widget.onSelected(_selectedIndex);
                    });
                  }
                  return true;
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  _getItemLayout(int index) {
    return  Container(
        alignment: Alignment.center,
        width: 50,
        height: 50,
        child:  Text(
            widget.list[index],
            style: TextStyle(
              color: _selectedIndex == index ? Colors.black : Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              shadows:<Shadow>[
                Shadow(
                  offset: Offset(0.5, 0.5),
                  blurRadius: 0.5,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
    );
  }
}
