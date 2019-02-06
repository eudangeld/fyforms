import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fy/src/widgets/fy_form_field.dart';
import 'package:yaml/yaml.dart';

void main() {
  runApp(FyForms());
}

class FyForms extends StatefulWidget {
  @override
  _FyFormsState createState() => _FyFormsState();
}

class _FyFormsState extends State<FyForms> {
  List<Widget> formFields = <Widget>[];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    load();
    formFields.add(FlatButton(
      child: Text('Validate Form'),
      onPressed: () => print(_formKey.currentState.validate()),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FyForms'),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: formFields,
            ),
          ),
        ),
      ),
    );
  }

  Future load() async {
    dynamic yamlFile = await rootBundle.loadString('assets/forms.yaml');
    dynamic yaml = loadYaml(yamlFile);
    for (dynamic line in yaml['form']) {
      _buildRow(line);
    }
  }

  void _buildRow(dynamic line) {
    List<Widget> row = <Widget>[];
    for (dynamic rowData in line['row']) {
      row.add(FyFormField(
        fieldData: rowData,
      ));
    }

    setState(() {
      formFields.add(Row(children: row));
    });
  }
}
