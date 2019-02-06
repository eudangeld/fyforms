import 'package:validators/validators.dart';

typedef bool Validator(String input);
typedef String Validate(String input);

Validate validate(Map<String, String> validations) {
  return (String input) {
    final validationsLength = validations.length;

    for (var i = 0; i < validationsLength; i++) {
      final validationName = validations.keys.elementAt(i);
      final validationMessage = validations.values.elementAt(i);

      if (!validators.containsKey(validationName)) {
        throw new ValidationException(
            'Validation $validationName does not exists.');
      }

      final validator = validators[validationName];

      if (!validator(input)) {
        return validationMessage;
      }

      return null;
    }
  };
}

bool _isNotEmpty(String input) {
  return input.isNotEmpty;
}

final Map<String, Validator> validators = {
  'isNotEmpty': _isNotEmpty,
  'isEmail': isEmail,
  'isURL': isURL,
  'isInt': isInt,
};

class ValidationException implements Exception {
  final String message;

  ValidationException(this.message);

  @override
  String toString() {
    return 'ValidationException: $message';
  }
}
