part of 'package:id_card_formatter/id_card_formatter.dart';

/// An extension on [double] to format monetary values
/// with thousands separators and an optional currency symbol.
extension MoneyFormatter on double {
  /// Converts the number into a currency-formatted string.
  ///
  /// [symbol] is the currency prefix (default: `'TZS'`).
  /// [decimalDigits] is the number of digits after the decimal point (default: `0`).
  ///
  /// Example:
  /// ```dart
  /// 1234567.89.toFormat(symbol: 'TZS', decimalDigits: 2); // 'TZS 1,234,567.89'
  /// ```
  String toFormat({
    String symbol = 'TZS',
    int decimalDigits = 0,
  }) {
    final numStr = toStringAsFixed(decimalDigits);
    final parts = numStr.split('.');
    final integerPart = parts[0];
    final fractionalPart = parts.length > 1 ? parts[1] : '';

    final buffer = StringBuffer();
    int count = 0;

    for (int i = integerPart.length - 1; i >= 0; i--) {
      buffer.write(integerPart[i]);
      count++;
      if (count % 3 == 0 && i != 0) {
        buffer.write(',');
      }
    }

    final formattedInt = buffer.toString().split('').reversed.join();

    if (decimalDigits > 0) {
      return '$symbol $formattedInt.$fractionalPart';
    } else {
      return '$symbol $formattedInt';
    }
  }
}
