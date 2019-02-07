import "package:fyforms/src/fy_icons.dart" as fycons;

import 'package:flutter/material.dart';
import 'package:fyforms/src/validate/fy_validation.dart';

class FyFormFactory extends StatelessWidget {
  FyFormFactory({
    @required this.fieldData,
    @required this.themData,
    @required this.data,
    Key key,
  }) : super(key: key);
  dynamic fieldData;
  BuildContext context;
  ThemeData themData;
  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return _buildTextField();
  }

  Widget _buildTextField() {
    return Builder(
      builder: (BuildContext context) {
        return Expanded(
          flex: fieldData['column']['flex'],
          child: TextFormField(
            onSaved: (value) => data[fieldData['column']['id']] = value,
            validator: validate(fieldData['column']['validations']),
            decoration: InputDecoration(
                hintStyle: themData.textTheme.display1,
                labelStyle: themData.textTheme.title,
                icon: Icon(
                  fycons.t[fieldData['column']['icon']],
                  color: themData.textTheme.title.color,
                ),
                hintText: fieldData['column']['hint'],
                labelText: fieldData['column']['label'],
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.solid),
                )),
          ),
        );
      },
    );
  }
}
