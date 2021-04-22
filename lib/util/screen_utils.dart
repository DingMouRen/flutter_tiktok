import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Basically made for iPhone 12 Pro Max
/// iPhone 12 Pro Max screen height
const double baseHeight = 926.0;

/// iPhone 12 Pro Max screen width
const double baseWidth = 428.0;

/// Calculate height
double screenAwareHeight(double height, BuildContext context) {
  return height / baseHeight * MediaQuery.of(context).size.height;
}

/// Calculate width
double screenAwareWidth(double width, BuildContext context) {
  return width / baseWidth * MediaQuery.of(context).size.width;
}

double screenWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}


double screenHeight(BuildContext context){
  return MediaQuery.of(context).size.height;
}

