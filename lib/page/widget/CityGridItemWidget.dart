import 'package:flutter/material.dart';
import 'package:flutter_tiktok/model/city_item_model.dart';

class CityGridItemWidget extends StatelessWidget {
  CityItemModel model;
  Function onTap;

  CityGridItemWidget({this.model,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap?.call();
      },
      child: Stack(
        fit:StackFit.expand,
        children: [
          Image.asset(model.imgCoverUrl,fit: BoxFit.fill,),
          Positioned(
            left: 10,
            bottom: 10,
            child: Row(
              children: [
                Container(
                  width: 25,
                  height: 25,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(image: AssetImage(model.user.headerImg))
                  ),
                ),
                Text(model.distance,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
