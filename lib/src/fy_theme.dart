import 'package:flutter/material.dart';

class FyTheme {
  FyTheme({this.fyData});
  dynamic fyData;

  ThemeData main() {
    print(fyData['accentColor']);
    return ThemeData(
        primaryColor: Color(fyData['primaryColor']),
        textTheme: TextTheme(
          display1: TextStyle(
              fontSize: fyData['hint-size'],
              fontWeight: FontWeight.bold,
              color: Color(fyData['hint-color'])),
          title: TextStyle(
              fontSize: fyData['label-size'],
              fontWeight: FontWeight.bold,
              color: Color(fyData['label-color'])),
        ));
  }
}
