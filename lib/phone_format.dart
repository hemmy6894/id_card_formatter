part of 'package:id_card_formatter/id_card_formatter.dart';

/// A utility extension on [String] for formatting phone numbers

extension PhoneFormatter on String {
  /// Formats a  number into the format: `(+XXX) XXX XXX XXX`.
  ///
  /// - Each `X` is a digit.
  /// - Example: `'255123456789'` → `'(+255) 123 456 789'`

  String phoneFormat({String pattern = '(+XXX) XXX XXX XXX'}) {
    final clean = replaceAll('-', '').replaceAll(' ', '');
    final buffer = StringBuffer();
    buffer.write(clean);
    return buffer.toString().genericFormat(format: pattern);
  }
}
