import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fyforms/fy_forms.dart';

class Fy {
  Fy({
    @required this.onSave,
    @required this.yaml,
    @required this.button,
    this.blas = 3,
  }) {
    this.forms = FyForms(
      onSave: onSave,
      yaml: yaml,
      button: button,
    );
  }
  FyForms forms;
  int blas;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  dynamic yaml;
  Function onSave;
  Widget button;
  bool validate() => _formKey.currentState.validate();
  FyForms get form => forms;
  int get bla => 3;
}
