import 'package:flutter/material.dart';
import "package:fyforms/src/fy_icons.dart" as fycons;
import "package:fyforms/src/fy_validators.dart" as fyvalidators;

class FyFormField extends StatelessWidget {
  FyFormField({
    @required this.fieldData,
    @required this.themData,
    Key key,
  }) : super(key: key);
  dynamic fieldData;
  BuildContext context;
  ThemeData themData;

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
            validator: fieldData['column']['validator'] != null
                ? fyvalidators.validators[fieldData['column']['validator']]
                : (value) => value,
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
