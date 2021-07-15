import 'package:flutter/material.dart';

class ClickItemListWidget extends StatefulWidget {
  final List actionTitles;
  final Function(int position) onClick;
  ClickItemListWidget({Key key,this.actionTitles,this.onClick});

  @override
  _ClickItemListWidgetState createState() {
    return _ClickItemListWidgetState();
  }
}

class _ClickItemListWidgetState extends State<ClickItemListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      shrinkWrap: true,
        itemCount: widget.actionTitles.length,
        itemBuilder: (context,position){
          return _getItem(context,position);
        });
  }

  Widget _getItem(BuildContext context, int position) {
    return InkWell(
      onTap: (){
        widget.onClick.call(position);
      },
      child: Container(
        height: 60,
        child: Column(
          children: [
            Container(
              height: 59,
              alignment: Alignment.center,
              child: Text(widget.actionTitles[position],style: TextStyle(fontSize: 16),),
            ),
            Divider(height: 0.5,color: Colors.black.withAlpha(60),)
          ],
        ),
      ),
    );
  }
}