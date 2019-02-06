import 'package:flutter_test/flutter_test.dart';
import 'package:fy/src/fy_validation.dart';

void main() {
  test('Invalid validation name throws ValidationException', () {
    expect(validate({'dontExists': 'Do not exists'})('Input'),
        throwsA(throwsException));
  });
}
