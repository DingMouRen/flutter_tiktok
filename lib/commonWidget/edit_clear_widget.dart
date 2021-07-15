import 'package:flutter/material.dart';
import 'package:flutter_tiktok/res/colors.dart';

class EditClearWidget extends StatefulWidget {

  Function(String content) onChange;
  String contentOriginal;

  EditClearWidget({Key key,this.onChange,this.contentOriginal}) : super(key: key);

  @override
  _EditClearWidgetState createState() {
    return _EditClearWidgetState();
  }
}

class _EditClearWidgetState extends State<EditClearWidget> {
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
    return Container(
      height: 60,
      padding: EdgeInsets.only(left: 20,right: 20),
      child: TextField(
        controller: TextEditingController(
          text: widget.contentOriginal??'',
        ),
        cursorColor: Colors.yellow,
        cursorWidth: 2,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorRes.color_3
            )
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorRes.color_3
            )
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorRes.color_3
            )
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorRes.color_3
            )
          )
        ),
        onChanged: (text){
          widget.onChange.call(text);
        },
      ),
    );
  }
}