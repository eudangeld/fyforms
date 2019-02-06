import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';

void main() {
  var doc = loadYaml("forms");
  print(jsonEncode(doc));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[Text('CURINTIHA')],
      ),
    );
  }
}
