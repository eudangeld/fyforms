import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyforms/fy_forms.dart';
import 'package:fyforms/fy.dart';
import 'package:yaml/yaml.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FyForms Example',
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
  FyForms fyForm;

  @override
  void initState() {
    super.initState();
    loadYamlFile();
  }

  Future loadYamlFile() async {
    dynamic yamlFile = await rootBundle.loadString('assets/forms.yaml');
    setState(() {
      Fy f = Fy(
          button: FlatButton(
            child: Text('dasda'),
            onPressed: () => print('dasd'),
          ),
          onSave: () => print('ons save'),
          yaml: yamlFile);

      //fyForm = FyForms(yaml: loadYaml(yamlFile));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fyforms example'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          fyForm,
          FlatButton(child: Text('Hit ME'), onPressed: () {})
        ],
      )),
    );
  }
}
