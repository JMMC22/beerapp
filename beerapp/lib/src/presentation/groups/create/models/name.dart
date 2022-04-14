import 'package:formz/formz.dart';

enum NameValidationError { empty, length }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');
  const Name.dirty([String value = '']) : super.dirty(value);

  @override
  NameValidationError? validator(String? value) {
    if (value?.isEmpty == true) return NameValidationError.empty;
    if (value!.length < 4 == true) return NameValidationError.length;
    return null;
  }
}
