import 'package:flutter/material.dart';
///首页tab关注
class HomeTabFocusPage extends StatefulWidget {

  @override
  _HomeTabFocusPageState createState() {
    return _HomeTabFocusPageState();
  }
}

class _HomeTabFocusPageState extends State<HomeTabFocusPage> {
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
      width: double.infinity,
      height: double.infinity,
      child: Center(child: Text('关注'),),color: Colors.blue,);
  }
}