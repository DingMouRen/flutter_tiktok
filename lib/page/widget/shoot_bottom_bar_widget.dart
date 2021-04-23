import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShootBottomBarWidget extends StatefulWidget {
  double width;
  double height;
  List<String> list;
  int initialItem = 0;
  ValueChanged<int> onSelected;

  ShootBottomBarWidget(
      {this.width, this.height, this.list, this.initialItem, this.onSelected});

  @override
  State<StatefulWidget> createState() {
    return _ShootBottomBarWidgetState();
  }
}

class _ShootBottomBarWidgetState
    extends State<ShootBottomBarWidget> {
  FixedExtentScrollController _scrollController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController =
        FixedExtentScrollController(initialItem: widget.initialItem);
    _selectedIndex = widget.initialItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.topCenter,
      child:  Container(
        width: widget.width,
        height: widget.height,
        alignment: Alignment.topCenter,
        child:  RotatedBox(
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
    );
  }

  _getItemLayout(int index) {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 50,
      child: Text(
        widget.list[index],
        style: TextStyle(
          color: _selectedIndex == index ? Colors.white : Colors.grey,
          fontWeight: FontWeight.w500,
          fontSize: 15,

        ),
      ),
    );
  }
}
