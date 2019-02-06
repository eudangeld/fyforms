import 'package:flutter/material.dart';
import 'package:fyforms/src/fy_theme.dart';
import 'package:fyforms/src/widgets/fy_form_field.dart';

class FyForms extends StatefulWidget {
  @override
  _FyFormsState createState() => _FyFormsState();
  FyForms({@required this.yaml});
  dynamic yaml;
}

class _FyFormsState extends State<FyForms> {
  List<Widget> formFields;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ThemeData theme;

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
    return Column(
      children: formFields,
    );
  }

  void _buildRow(dynamic line) {
    List<Widget> row = <Widget>[];
    for (dynamic rowData in line['row']) {
      row.add(FyFormField(
        themData: theme,
        fieldData: rowData,
      ));
    }
    setState(() {
      formFields.add(Row(children: row));
    });
  }
}
