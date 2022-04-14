import 'package:formz/formz.dart';

enum PriceValidationError { empty, unvalid }

class Price extends FormzInput<String, PriceValidationError> {
  const Price.pure() : super.pure('');
  const Price.dirty([String value = '']) : super.dirty(value);

  @override
  PriceValidationError? validator(String? value) {
    final RegExp regex = RegExp(r'(\d*\.)?(\d*\,)?(\d+)');

    if (value?.isEmpty == true) return PriceValidationError.empty;
    if (!regex.hasMatch(value!)) return PriceValidationError.unvalid;
    return null;
  }
}
