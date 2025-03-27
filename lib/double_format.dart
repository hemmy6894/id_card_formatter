import 'package:intl/intl.dart';

extension MoneyFormatter on double {
  String toFormat({
    String locale = 'en_US',
    String symbol = 'TZS',
    int decimalDigits = 0,
  }) {
    final formatCurrency = NumberFormat.currency(
      locale: locale,
      symbol: '$symbol ',
      decimalDigits: decimalDigits,
    );
    return formatCurrency.format(this);
  }
}
