import 'package:flutter/material.dart';
import "package:fy/src/fy_icons.dart" as fycons;
import "package:fy/src/fy_validators.dart" as fyvalidators;

class FyFormField extends StatelessWidget {
  FyFormField({
    @required this.fieldData,
    Key key,
  }) : super(key: key);
  dynamic fieldData;
  BuildContext context;

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
                hintStyle: Theme.of(context).textTheme.display1,
                labelStyle: Theme.of(context).textTheme.title,
                icon: Icon(
                  fycons.t[fieldData['column']['icon']],
                  color: Theme.of(context).textTheme.title.color,
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
