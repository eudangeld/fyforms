import 'package:flutter/material.dart';
import 'package:fyforms/src/fy_theme.dart';
import 'package:fyforms/src/widgets/fy_form_field.dart';

class FyForms extends StatefulWidget {
  @override
  _FyFormsState createState() => _FyFormsState();
  FyForms({
    @required this.onSave,
    @required this.yaml,
    @required this.button,
  });
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  dynamic yaml;
  final Function onSave;
  final Widget button;

  bool validate() => _formKey.currentState.validate();
}

class _FyFormsState extends State<FyForms> {
  List<Widget> formFields;

  ThemeData theme;
  final Map<String, String> data = {};

  @override
  void initState() {
    super.initState();
    formFields = <Widget>[];
    FyTheme fytheme = FyTheme(fyData: widget.yaml['theme']);
    theme = fytheme.main();
    for (dynamic line in widget.yaml['form']) {
      _buildRow(line);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formKey,
      child: Column(
        children: formFields..add(widget.button),
      ),
    );
  }

  void _buildRow(dynamic line) {
    List<Widget> row = <Widget>[];
    for (dynamic rowData in line['row']) {
      row.add(FyFormField(
        data: data,
        themData: theme,
        fieldData: rowData,
      ));
    }
    setState(() {
      formFields.add(Row(children: row));
    });
  }
}
