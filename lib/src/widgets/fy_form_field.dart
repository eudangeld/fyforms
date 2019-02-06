import 'package:flutter/material.dart';
import "package:fy/src/fy_icons.dart" as fycons;

class FyFormField extends StatelessWidget {
  FyFormField({
    @required this.fieldData,
    Key key,
  }) : super(key: key);
  dynamic fieldData;

  @override
  Widget build(BuildContext context) {
    return _buildTextField();
  }

  Widget _buildTextField() {
    return Expanded(
      flex: fieldData['column']['flex'],
      child: TextFormField(
        decoration: InputDecoration(
            icon: Icon(fycons.t[fieldData['column']['icon']]),
            hintText: fieldData['column']['hint'],
            labelText: fieldData['column']['label'],
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.solid),
            )),
      ),
    );
  }
}